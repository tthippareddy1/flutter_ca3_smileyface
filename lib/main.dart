import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DrawingApp(),
    );
  }
}

class DrawingApp extends StatefulWidget {
  @override
  _DrawingAppState createState() => _DrawingAppState();
}

class _DrawingAppState extends State<DrawingApp> {
  String selectedEmoji = "Smiley";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emoji Drawing App')),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedEmoji,
            onChanged: (String? newValue) {
              setState(() {
                selectedEmoji = newValue!;
              });
            },
            items: <String>['Smiley', 'Party Face', 'Heart']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: Center(
              child: CustomPaint(
                painter: selectedEmoji == "Smiley"
                    ? SmileyPainter()
                    : selectedEmoji == "Party Face"
                        ? PartyFacePainter()
                        : HeartPainter(),
                size: Size(300, 300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




class SmileyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // Draw face
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 80, paint);

    // Draw eyes
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width / 2 - 30, size.height / 2 - 20), 10, paint);
    canvas.drawCircle(Offset(size.width / 2 + 30, size.height / 2 - 20), 10, paint);

    // Draw smile (arc)
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2 + 20), radius: 40), 0.2, 3, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class PartyFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.yellow;

    // Draw face
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 80, paint);

    // Draw eyes
    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width / 2 - 30, size.height / 2 - 20), 10, paint);
    canvas.drawCircle(Offset(size.width / 2 + 30, size.height / 2 - 20), 10, paint);

    // Draw mouth (laughing expression)
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;
    canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2 + 20), radius: 40), 0, 3.14, false, paint);

    // Draw a party hat
    paint.color = Colors.red;
    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2 - 40, size.height / 2 - 80)
        ..lineTo(size.width / 2 + 40, size.height / 2 - 80)
        ..lineTo(size.width / 2, size.height / 2 - 140)
        ..close(),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.red;

    Path heartPath = Path();
    heartPath.moveTo(size.width / 2, size.height / 2 + 40);
    heartPath.cubicTo(size.width / 2 - 40, size.height / 2 - 40, size.width / 2 - 80, size.height / 2 + 20, size.width / 2, size.height / 2 + 80);
    heartPath.cubicTo(size.width / 2 + 80, size.height / 2 + 20, size.width / 2 + 40, size.height / 2 - 40, size.width / 2, size.height / 2 + 40);

    canvas.drawPath(heartPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}













// Run the app again, and you should see a smiley face.


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DrawingApp(),
//     );
//   }
// }

// class DrawingApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Emoji Drawing App')),
//       body: Center(
//         child: CustomPaint(
//           painter: SmileyPainter(),
//           size: Size(300, 300),
//         ),
//       ),
//     );
//   }
// }



// class SmileyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.yellow
//       ..style = PaintingStyle.fill;

//     // Draw face
//     canvas.drawCircle(Offset(size.width / 2, size.height / 2), 80, paint);

//     // Draw eyes
//     paint.color = Colors.black;
//     canvas.drawCircle(Offset(size.width / 2 - 30, size.height / 2 - 20), 10, paint);
//     canvas.drawCircle(Offset(size.width / 2 + 30, size.height / 2 - 20), 10, paint);

//     // Draw smile (arc)
//     paint.style = PaintingStyle.stroke;
//     paint.strokeWidth = 5;
//     canvas.drawArc(Rect.fromCircle(center: Offset(size.width / 2, size.height / 2 + 20), radius: 40), 0.2, 3, false, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }








































//Below code This will display a square, a circle, and an arc on the screen.

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DrawingApp(),
//     );
//   }
// }

// class DrawingApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Shape Drawing App')),
//       body: Center(
//         child: CustomPaint(
//           painter: ShapePainter(),
//           size: Size(300, 300),
//         ),
//       ),
//     );
//   }
// }

// class ShapePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 5.0;

//     // Draw a square
//     canvas.drawRect(Rect.fromLTWH(50, 50, 100, 100), paint);

//     // Draw a circle
//     canvas.drawCircle(Offset(200, 100), 50, paint);

//     // Draw an arc (half-circle)
//     canvas.drawArc(Rect.fromCircle(center: Offset(150, 200), radius: 50), 0, 3.14, false, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }














