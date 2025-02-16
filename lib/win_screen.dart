import 'dart:math';
import 'package:flutter/material.dart';
import 'package:funcolor/resourse/assets_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WinScreen(),
    );
  }
}

class WinScreen extends StatefulWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  _WinScreenState createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Confetti> confetti;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Create confetti with random properties
    confetti = List.generate(500, (index) => Confetti(random));

    // Start the animation loop
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 2), () {
      if (mounted) {
        setState(() {
          for (var particle in confetti) {
            particle.update();
          }
        });
        _startAnimation();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Color(0xff2C005E).withOpacity(.20),
      // Color(0xff9C008D).withOpacity(.30),
      child: Stack(
        children: [
          // Confetti particles
          ...confetti.map((particle) {
            return Positioned(
              left: particle.y,
              top: particle.x,
              child: Transform.rotate(
                angle: particle.angle,
                child: ConfettiPiece(
                  size: particle.size,
                  color: particle.color,
                ),
              ),
            );
          }).toList(),

          // Win message
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Center(
              child: Container(
                height: 210,
                width: 800,
                decoration: BoxDecoration(
                  color: Color(0xff9C008D),
                  borderRadius: BorderRadius.all(Radius.circular(82))
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 135),
                  child: Row(
                    children: [
                      const Text(
                        'Awsome',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10,
                              color: Colors.black38,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 64),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 222,
                          height: 86,
                          child: Image.asset(ImageAssets.nextButton,fit:BoxFit.cover),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Confetti {
  double x;
  double y;
  double velocityX;
  double velocityY;
  double angle;
  double angularVelocity;
  double size;
  Color color;
  final Random random;

  Confetti(this.random)
      : x = random.nextDouble() * 400,
        y = -20,
        velocityX = (random.nextDouble() - 0.5) * 8,
        velocityY = random.nextDouble() * 4 + 2,
        angle = random.nextDouble() * pi * 2,
        angularVelocity = (random.nextDouble() - 0.5) * 0.3,
        size = random.nextDouble() * 12 + 5,
        color = Colors.primaries[random.nextInt(Colors.primaries.length)];

  void update() {
    x += velocityX;
    y += velocityY;
    angle += angularVelocity;

    // Reset if particle goes off screen
    if (y > 800) {
      y = -20;
      x = random.nextDouble() * 400;
      velocityY = random.nextDouble() * 4 + 2;
    }
  }
}

class ConfettiPiece extends StatelessWidget {
  final double size;
  final Color color;

  const ConfettiPiece({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size * 0.6,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}

// Function to show the win screen
void showWinScreen(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const WinScreen(),
  );
}