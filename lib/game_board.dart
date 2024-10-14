import 'package:flutter/material.dart';
import 'package:flutter_flight_game/fighters/fighter.dart';
import 'package:flutter_flight_game/stages/ken_stage.dart';
import 'package:flutter_flight_game/types/frame_time.dart';

class GameBoard extends CustomPainter {
  final FrameTime frameTime;

  final KenStage stage;
  final Fighter player1;
  final Fighter player2;

  GameBoard({
    required this.frameTime,
    required this.player1,
    required this.player2,
    required this.stage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    stage.draw(canvas);

    player1.update(frameTime, size);
    player1.draw(canvas, size);

    player2.update(frameTime, size);
    player2.draw(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
