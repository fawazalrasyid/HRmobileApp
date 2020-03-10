import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:hr_app/dashboard/dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AbsensiPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.red,
      ),
    );
  }
}

class AbsensiPage extends StatefulWidget {
  static var tag;

  @override
  _AbsensiPageState createState() => _AbsensiPageState();
}

class _AbsensiPageState extends State<AbsensiPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inHours}:${duration.inMinutes % 60}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(hours: 9),
    );
  }

  TextStyle textwhiteStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  TextStyle text22bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text18bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text16bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text14bold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
  );

  TextStyle text14 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 14.0,
  );

// For make Date
  String get date {
    return DateFormat('EEEE d MMMM yyyy').format(DateTime.now());
  }

// For make Time
  String get time {
    return DateFormat('k:mm').format(DateTime.now());
  }

// For Box Decoration
  Container boxDecoration() {
    return Container(
      height: 150.00,
      width: double.maxFinite,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Color(0xfff4f4f4),
        borderRadius: BorderRadius.circular(15.00),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(date, style: text16bold),
          Text(
            time,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 50,
              color: Color(0xff000000),
            ),
          )
        ],
      ),
    );
  }

  // For Stopwatch
  Expanded buildStopwatch() {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.center,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: CustomPaint(
                    painter: CustomTimerPainter(
                        animation: controller,
                        backgroundColor: Color(0xffFDCB58),
                        color: Color(0xffFEEF88))),
              ),
              Align(
                alignment: FractionalOffset.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      timerString,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 60.0,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// For button Animated
  AnimatedBuilder buttonAnimatedBuilder() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Material(
          elevation: 2.0,
          borderRadius: BorderRadius.circular(15.0),
          color: Color(0xffFF3030),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              if (controller.isAnimating)
                controller.reset();
              else {
                controller.reverse(
                    from: controller.value == 0.0 ? 1.0 : controller.value);
              }
            },
            child: Text(
              controller.isAnimating ? "Pulang" : "Masuk",
              textAlign: TextAlign.center,
              style: textwhiteStyle,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    height:
                        controller.value * MediaQuery.of(context).size.height,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(height: 42.0),
                      Stack(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Dashboard()),
                                ModalRoute.withName('/'),
                              );
                            },
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Icon(
                                Icons.keyboard_backspace,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Absensi',
                              textAlign: TextAlign.center,
                              style: text16bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      boxDecoration(),
                      SizedBox(height: 32.0),
                      buildStopwatch(),
                      SizedBox(
                        height: 40,
                      ),
                      buttonAnimatedBuilder(),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
