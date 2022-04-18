import 'package:congraph/styles/app_colors.dart';
import 'package:congraph/styles/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaintClockModule extends StatelessWidget {
  const PaintClockModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appBarBackgroundColor,
        // centerTitle: true,
        title: const SelectableText(
          'Congraphs',
          style: AppTextStyles.appBarTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.circleInfo),
            tooltip: 'Info',
          ),
          const SizedBox(
            width: 20,
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(FontAwesomeIcons.github),
            tooltip: 'Source code',
          )
        ],
      ),
      body: CustomPaint(
        painter: ActuallyDrawClock(),
        child: Container(),
      ),
    );
  }
}

class ActuallyDrawClock extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = AppColors.color2;
    Offset center = Offset(size.width, size.height / 2);
    Offset startingPoint = Offset(size.width, size.height / 2);
    Offset endPoint = Offset(size.width - 100, size.height / 2);
    Offset minuteHandEndPoint = Offset(size.width - 150, size.height / 3.6);
    Offset endingPointText = Offset(size.width / 2, size.height / 2);

    var linePaint = Paint()
      ..color = AppColors.color1
      ..strokeWidth = 50
      ..strokeCap = StrokeCap.round;

    var linePaint2 = Paint()
      ..color = AppColors.color1
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    var linePaint3 = Paint()
      ..color = AppColors.color3
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, size.height / 2.1, linePaint);
    canvas.drawCircle(center, size.height / 2.2, paint);
    canvas.drawLine(startingPoint, endingPointText, linePaint3);
    canvas.drawLine(startingPoint, endPoint, linePaint2);
    canvas.drawLine(startingPoint, minuteHandEndPoint, linePaint2);
    canvas.drawLine(startingPoint, center, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
