import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_flight_game/constants/game_data.dart';
import 'package:flutter_flight_game/fighters/fighter.dart';
import 'package:flutter_flight_game/game_stage.dart';
import 'package:flutter_flight_game/types/frame_time.dart';
import 'package:flutter_flight_game/types/sprite.dart';
import 'package:flutter_flight_game/types/vector.dart';
import 'package:flutter_flight_game/utils/assets.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final frameTime = FrameTime(0, 0);

  final ryu = Fighter(
    spriteSheet: AssetsUtil.ryuSpriteSheet,
    position: Vector(0, 0),
    velocity: Vector(0, 0),
    sprites: [
      Sprite(75, 14, 60, 89),
      Sprite(7, 14, 59, 90),
      Sprite(277, 11, 58, 92),
      Sprite(211, 10, 55, 93),
      Sprite(277, 11, 58, 92),
      Sprite(7, 14, 59, 90)
    ],
  );

  void _gameLoop() {
    SchedulerBinding.instance.scheduleFrameCallback(_frame);
  }

  void _frame(Duration timeStamp) {
    int currentTime = timeStamp.inMilliseconds;

    if (frameTime.previous == 0) {
      frameTime.previous = currentTime;
    }

    frameTime.secondsPassed = (currentTime - frameTime.previous) / 1000.0;
    frameTime.previous = currentTime;

    SchedulerBinding.instance.scheduleFrameCallback(_frame);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gameLoop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FPS: ${frameTime.fps}"),
      ),
      body: Transform.scale(
        scale: 1.5,
        child: Center(
          child: ColoredBox(
            color: Colors.black,
            child: CustomPaint(
              size: GameData.GAME_VIEWPORT,
              painter: GameStage(
                frameTime: frameTime,
                figther: ryu,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
