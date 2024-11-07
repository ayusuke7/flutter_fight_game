import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flight_game/game/constants/fighter_data.dart';
import 'package:flutter_flight_game/game/constants/game_data.dart';
import 'package:flutter_flight_game/game/fighters/ryu.dart';
import 'package:flutter_flight_game/game/game_board.dart';
import 'package:flutter_flight_game/game/stages/ken_stage.dart';
import 'package:flutter_flight_game/game/types/frame_time.dart';
import 'package:flutter_flight_game/game/types/vector.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final frameTime = FrameTime(0, 0);

  final ryu = Ryu(
    direction: FighterDir.RIGHT,
    position: Vector(50, GameData.GAME_FLOOR),
  );
  final ken = Ryu(
    name: "ken",
    direction: FighterDir.LEFT,
    position: Vector(300, GameData.GAME_FLOOR),
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
                    player2: ken,
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
    final pressed = HardwareKeyboard.instance.isLogicalKeyPressed(
      event.logicalKey,
    );
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      ryu.arrowUp(pressed);
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      ryu.arrowDown(pressed);
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      ryu.arrowLeft(pressed, ryu.direction.flip);
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      ryu.arrowRight(pressed, ryu.direction.flip);
    } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
      ken.arrowUp(pressed);
    } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
      ken.arrowDown(pressed);
    } else if (event.logicalKey == LogicalKeyboardKey.keyA) {
      ken.arrowLeft(pressed, ken.direction.flip);
    } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
      ken.arrowRight(pressed, ken.direction.flip);
    }

    return KeyEventResult.handled;
  }
}
