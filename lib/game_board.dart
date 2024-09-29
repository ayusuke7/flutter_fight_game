import 'package:flutter/material.dart';
import 'package:flutter_flight_game/fighters/fighter.dart';
import 'package:flutter_flight_game/stages/ken_stage.dart';
import 'package:flutter_flight_game/types/frame_time.dart';

class GameBoard extends CustomPainter {
  final FrameTime frameTime;

  final KenStage stage;
  final Fighter player1;

  GameBoard({
    required this.frameTime,
    required this.player1,
    required this.stage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    stage.draw(canvas);

    player1.update(frameTime, size);
    player1.draw(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
