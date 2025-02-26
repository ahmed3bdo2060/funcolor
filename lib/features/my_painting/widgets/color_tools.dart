
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:funcolor/core/components/gradient_box_border.dart';
import 'package:funcolor/core/utils/app_colors.dart';


class ColorTools extends StatefulWidget {
  final Function(Color) onColorSelected;
  final Color selectedColor;
  final Function(double)? onStrokeWidthChanged;
  final double strokeWidth;

  // Available colors
  static const List<Color> colors = [
    Colors.white,
    Colors.black,
    Colors.yellow,
    Color(0xFF4CAF50), // Green
    Color(0xFFFF9800), // Orange
    Color(0xFF2196F3), // Blue
    Colors.deepOrange,
    Colors.lightBlueAccent,
    Colors.cyan
  ];


  const ColorTools({
    Key? key,
    required this.onColorSelected,
    required this.selectedColor,
    this.onStrokeWidthChanged,
    this.strokeWidth = 15.0,
  }) : super(key: key);

  @override
  State<ColorTools> createState() => _ColorToolsState();
}

class _ColorToolsState extends State<ColorTools> {
  late double _currentStrokeWidth;

  @override
  void initState() {
    super.initState();
    _currentStrokeWidth = widget.strokeWidth;
  }

  @override
  Widget build(BuildContext context) {
    // Split colors into two columns
    // final int midPoint = (ColorTools.colors.length / 2).ceil();
    final leftColors = ColorTools.colors;
    // final rightColors = ColorTools.colors.sublist(midPoint);

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xFF2A0B4F),
        borderRadius: BorderRadius.circular(20),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [AppColors.borderColor, AppColors.borderColor2],
          ),
          width: 5.w,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RotatedBox(
            quarterTurns: 3,
            child: Container(
              width: 380,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.orange,
                  showValueIndicator: ShowValueIndicator.onlyForDiscrete ,
                  inactiveTrackColor: Colors.white.withOpacity(0.1),
                  thumbColor: Colors.white,
                  trackHeight: 45,
                  thumbShape: SliderComponentShape.noOverlay ,
                  overlayColor: Colors.white.withOpacity(0.1),
                  valueIndicatorColor: Colors.white,
                  valueIndicatorTextStyle: const TextStyle(
                    color: Color(0xFF2A0B4F),
                  ),
                ),
                child: Slider(
                  value: _currentStrokeWidth,
                  min: 5.0,
                  max: 50.0,
                  divisions: 45,
                  label: _currentStrokeWidth.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _currentStrokeWidth = value;
                    });
                    widget.onStrokeWidthChanged?.call(value);
                  },
                ),
              ),
            ),
          ),
          // Left column
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child:
            Container(height: 350,width: 200,child: GridView
              (gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:  2,mainAxisExtent:120,
                childAspectRatio: 182.72/311.95,crossAxisSpacing: 12),children:
            leftColors.map((color) => _buildColorButton(color)).toList(),
            ))
          //   SingleChildScrollView(
          //     child: Column(
          //       children: leftColors.map((color) => _buildColorButton(color)).toList(),
          //     ),
          //   ),
          // ),
          // Right column
          // Padding(
          //   padding: const EdgeInsets.only(top: 20),
          //   child: SingleChildScrollView(
          //     child: Column(
          //       children: rightColors.map((color) => _buildColorButton(color)).toList(),
          //     ),
          //   ),
          // ),
          )],
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    final isSelected = widget.selectedColor == color;

    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 6),
      child: GestureDetector(
        onTap: () => widget.onColorSelected(color),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
              width: 3,
            ),
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: color.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
      ),
    );
  }
}
