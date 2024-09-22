import 'package:flutter/material.dart';
import 'package:flutter_flight_game/fighters/fighter.dart';
import 'package:flutter_flight_game/types/frame_time.dart';

class GameStage extends CustomPainter {
  final Fighter figther;
  final FrameTime frameTime;

  GameStage({
    required this.frameTime,
    required this.figther,
  });

  @override
  void paint(Canvas canvas, Size size) {
    figther.update(frameTime);
    figther.draw(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
