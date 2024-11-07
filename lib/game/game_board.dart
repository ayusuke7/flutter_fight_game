import 'package:flutter/material.dart';
import 'package:flutter_flight_game/game/fighters/fighter.dart';
import 'package:flutter_flight_game/game/stages/stage.dart';
import 'package:flutter_flight_game/game/types/frame_time.dart';

class GameBoard extends CustomPainter {
  final FrameTime frameTime;
  final Fighter player1;
  final Fighter player2;
  final Stage stage;

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