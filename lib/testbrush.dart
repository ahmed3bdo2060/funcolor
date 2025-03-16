import 'package:flutter/material.dart';

void main() {
  runApp(DrawingApp());
}

class DrawingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drawing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DrawingScreen(),
    );
  }
}

class DrawingScreen extends StatefulWidget {
  @override
  _DrawingScreenState createState() => _DrawingScreenState();
}

class _DrawingScreenState extends State<DrawingScreen> {
  List<Offset?> points = [];
  Color currentColor = Colors.black; // اللون الافتراضي
  double strokeWidth = 5.0; // السماكة الافتراضية

  // تغيير اللون
  void _changeColor(Color color) {
    setState(() {
      currentColor = color;
    });
  }

  // تغيير السماكة
  void _changeStrokeWidth(double width) {
    setState(() {
      strokeWidth = width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drawing App')),
      body: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            points.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          points.add(null); // نهاية الخط
        },
        child: CustomPaint(
          size: Size.infinite,
          painter: DrawingPainter(points, currentColor, strokeWidth),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            points.clear(); // مسح النقاط
          });
        },
        child: Icon(Icons.clear),
      ),
      // إضافة خيارات لتغيير اللون والسماكة
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.color_lens),
              onPressed: () {
                _showColorPicker(context);
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _changeStrokeWidth(strokeWidth + 1.0); // زيادة السماكة
              },
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (strokeWidth > 1.0) {
                  _changeStrokeWidth(strokeWidth - 1.0); // تقليل السماكة
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // دالة لعرض نافذة لاختيار اللون
  void _showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('اختر اللون'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: currentColor,
              onColorChanged: (Color color) {
                _changeColor(color);
                Navigator.of(context).pop();
              },
            ),
          ),
        );
      },
    );
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;
  final Color color;
  final double strokeWidth;

  DrawingPainter(this.points, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      } else if (points[i] != null && points[i + 1] == null) {
        canvas.drawCircle(points[i]!, 1.0, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ColorPicker extends StatefulWidget {
  final Color pickerColor;
  final Function(Color) onColorChanged;

  ColorPicker({required this.pickerColor, required this.onColorChanged});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _currentColor = widget.pickerColor;
  }

  @override
  Widget build(BuildContext context) {
    return ColorPickerSlider(
      pickerColor: _currentColor,
      onColorChanged: (Color color) {
        setState(() {
          _currentColor = color;
        });
        widget.onColorChanged(color);
      },
    );
  }
}

class ColorPickerSlider extends StatelessWidget {
  final Color pickerColor;
  final Function(Color) onColorChanged;

  ColorPickerSlider({required this.pickerColor, required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 1,
      value: pickerColor.opacity,
      onChanged: (newOpacity) {
        onColorChanged(pickerColor.withOpacity(newOpacity));
      },
    );
  }
}
