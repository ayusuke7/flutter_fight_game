import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_flight_game/constants/game_data.dart';
import 'package:flutter_flight_game/fighters/fighter.dart';
import 'package:flutter_flight_game/game_board.dart';
import 'package:flutter_flight_game/types/frame_time.dart';
import 'package:flutter_flight_game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/types/vector.dart';
import 'package:flutter_flight_game/utils/assets.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final frameTime = FrameTime(0, 0);

  final ryu = Fighter(
    spriteSheet: AssetsUtil.ryuSpriteSheet,
    position: Vector(100, 100),
    velocity: Vector(0, 0),
    sprites: [
      Sprite(75, 14, 60, 89, anchor: Vector(34, 86)),
      Sprite(7, 14, 59, 90, anchor: Vector(33, 87)),
      Sprite(277, 11, 58, 92, anchor: Vector(32, 89)),
      Sprite(211, 10, 55, 93, anchor: Vector(31, 90)),
      Sprite(277, 11, 58, 92, anchor: Vector(32, 89)),
      Sprite(7, 14, 59, 90, anchor: Vector(33, 87)),
    ],
  );

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

  void _gameLoop() {
    SchedulerBinding.instance.scheduleFrameCallback(_frame);
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("FPS: ${frameTime.fps}"),
        ),
        body: Center(
          child: Transform.scale(
            scale: GameData.GAME_SCALE,
            child: ColoredBox(
              color: Colors.black,
              child: CustomPaint(
                size: GameData.GAME_VIEWPORT,
                painter: GameBoard(
                  frameTime: frameTime,
                  player1: ryu,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
