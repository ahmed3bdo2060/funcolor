import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ElephantColoringPage(),
  ));
}

class ElephantColoringPage extends StatefulWidget {
  @override
  _ElephantColoringPageState createState() => _ElephantColoringPageState();
}

class _ElephantColoringPageState extends State<ElephantColoringPage> {
  Color selectedColor = Colors.green; // اللون الافتراضي
  Offset? _touchPosition; // لتخزين موقع التفاعل
  List<bool> _isTouchInside = [false, false, false]; // لتحديد إذا كان التفاعل داخل أي منطقة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Color the Elephant')),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _touchPosition = details.localPosition;
                  _isTouchInside[0] = _isPointInsidePath(_touchPosition!, 0);
                  _isTouchInside[1] = _isPointInsidePath(_touchPosition!, 1);
                  _isTouchInside[2] = _isPointInsidePath(_touchPosition!, 2);
                });
              },
              onPanEnd: (details) {
                setState(() {
                  _touchPosition = null;
                });
              },
              child: CustomPaint(
                size: Size(double.infinity, double.infinity),
                painter: ElephantPainter(
                  selectedColor,
                  _isTouchInside,
                  _touchPosition,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorPicker(
              onColorChanged: (color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // وظيفة لتحديد إذا كان النقطة داخل أي مسار معين (جسم الفيل، الأذن، الأنف)
  bool _isPointInsidePath(Offset point, int index) {
    final path = Path();

    if (index == 0) {
      // الجسم (دائرة حول الجسم)
      path.addOval(Rect.fromCircle(center: Offset(200, 300), radius: 150));
    } else if (index == 1) {
      // الأذن (مثال: دائرة حول الأذن)
      path.addOval(Rect.fromCircle(center: Offset(120, 100), radius: 50)); // أذن واحدة
      path.addOval(Rect.fromCircle(center: Offset(280, 100), radius: 50)); // الأذن الثانية
    } else if (index == 2) {
      // الأنف (دائرة حول الأنف)
      path.addOval(Rect.fromCircle(center: Offset(200, 400), radius: 30));
    }

    return path.contains(point);
  }
}

class ElephantPainter extends CustomPainter {
  final Color color;
  final List<bool> isTouchInside;
  final Offset? touchPosition;

  ElephantPainter(this.color, this.isTouchInside, this.touchPosition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    // رسم صورة الفيل كخلفية (يمكنك استبدالها بصورة حقيقية)
    final imageAsset = AssetImage('assets/images/elephantuncolored.png');
    imageAsset.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool sync) {
        final img = info.image;
        canvas.drawImage(img, Offset(0, 0), paint);
      }),
    );

    // رسم مسار جسم الفيل
    final bodyPath = Path();
    bodyPath.addOval(Rect.fromCircle(center: Offset(200, 300), radius: 150));
    paint.color = isTouchInside[0] ? Colors.blue : Colors.transparent;
    canvas.drawPath(bodyPath, paint);

    // رسم مسار الأذن
    final earPath = Path();
    earPath.addOval(Rect.fromCircle(center: Offset(120, 100), radius: 50));
    earPath.addOval(Rect.fromCircle(center: Offset(280, 100), radius: 50));
    paint.color = isTouchInside[1] ? Colors.yellow : Colors.transparent;
    canvas.drawPath(earPath, paint);

    // رسم مسار الأنف
    final trunkPath = Path();
    trunkPath.addOval(Rect.fromCircle(center: Offset(200, 400), radius: 30));
    paint.color = isTouchInside[2] ? Colors.red : Colors.transparent;
    canvas.drawPath(trunkPath, paint);

    // رسم نقطة التفاعل إذا كان المستخدم داخل المسار
    if (isTouchInside[0] && touchPosition != null) {
      paint.color = color;
      canvas.drawCircle(touchPosition!, 10, paint); // جسم الفيل
    }
    if (isTouchInside[1] && touchPosition != null) {
      paint.color = color;
      canvas.drawCircle(touchPosition!, 10, paint); // الأذن
    }
    if (isTouchInside[2] && touchPosition != null) {
      paint.color = color;
      canvas.drawCircle(touchPosition!, 10, paint); // الأنف
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ColorPicker extends StatelessWidget {
  final Function(Color) onColorChanged;

  ColorPicker({required this.onColorChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onColorChanged(Colors.red),
          child: Container(
            width: 40,
            height: 40,
            color: Colors.red,
          ),
        ),
        GestureDetector(
          onTap: () => onColorChanged(Colors.blue),
          child: Container(
            width: 40,
            height: 40,
            color: Colors.blue,
          ),
        ),
        GestureDetector(
          onTap: () => onColorChanged(Colors.green),
          child: Container(
            width: 40,
            height: 40,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
