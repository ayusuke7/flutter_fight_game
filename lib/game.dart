import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flight_game/constants/fighter_data.dart';
import 'package:flutter_flight_game/constants/game_data.dart';
import 'package:flutter_flight_game/fighters/ryu.dart';
import 'package:flutter_flight_game/game_board.dart';
import 'package:flutter_flight_game/stages/ken_stage.dart';
import 'package:flutter_flight_game/types/frame_time.dart';
import 'package:flutter_flight_game/types/vector.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final frameTime = FrameTime(0, 0);

  final ryu = Ryu(
    direction: FighterDir.RIGHT,
    position: Vector(200, GameData.GAME_FLOOR),
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
          child: Focus(
            autofocus: true,
            onKeyEvent: _keyListener,
            child: Transform.scale(
              scale: GameData.GAME_SCALE,
              child: ColoredBox(
                color: Colors.black,
                child: CustomPaint(
                  size: GameData.GAME_VIEWPORT,
                  painter: GameBoard(
                    stage: KenStage(),
                    frameTime: frameTime,
                    player1: ryu,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  KeyEventResult _keyListener(FocusNode node, KeyEvent event) {
    final pressed = HardwareKeyboard.instance.isLogicalKeyPressed(event.logicalKey);
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (pressed) {
        ryu.changeState(FighterState.WALK_BACK);
      } else {
        ryu.changeState(FighterState.IDLE);
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      if (pressed) {
        ryu.changeState(FighterState.WALK_FRONT);
      } else {
        ryu.changeState(FighterState.IDLE);
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      ryu.changeState(FighterState.JUMP_UP);
    }

    return KeyEventResult.handled;
  }
}
