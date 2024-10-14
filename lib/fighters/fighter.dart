import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_flight_game/constants/fighter_data.dart';
import 'package:flutter_flight_game/constants/game_data.dart';
import 'package:flutter_flight_game/types/frame_time.dart';
import 'package:flutter_flight_game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/types/vector.dart';
import 'package:flutter_flight_game/utils/key_map.dart';

class Fighter with KeyMap {
  final SpriteSheetData spriteSheetData;
  final Vector velocity = Vector(0, 0);
  final Vector position;
  final String name;

  FighterState fighterState;
  FighterDir direction;

  int animationFrame = 0;
  int animationTimer = 0;

  Fighter({
    required this.name,
    required this.spriteSheetData,
    required this.position,
    required this.direction,
    this.fighterState = FighterState.IDLE,
  }) {
    _initState();
  }

  List<Sprite> get currentAnimation {
    return spriteSheetData.animations[fighterState.name]!;
  }

  Sprite get currentAnimationFrame {
    return currentAnimation[animationFrame];
  }

  void update(FrameTime time, Size size) {
    position.x += (velocity.x * direction.side) * time.secondsPassed;
    position.y += velocity.y * time.secondsPassed;

    _updateState(time);
    _updateAnimations(time);
    _updateStateContraints(size);
  }

  void draw(Canvas canvas, Size size) {
    final originX = currentAnimationFrame.anchor!.x;
    final originY = currentAnimationFrame.anchor!.y;

    canvas.save();
    canvas.scale(direction.side.toDouble(), 1);
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      Rect.fromLTWH(
        currentAnimationFrame.x,
        currentAnimationFrame.y,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      Rect.fromLTWH(
        (position.x * direction.side).floorToDouble() - originX,
        position.y.floorToDouble() - originY,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      Paint(),
    );
    canvas.transform(Matrix4.identity().storage);
    canvas.restore();

    _debug(canvas);
  }

  void _changeState(FighterState newState) {
    if (newState == fighterState || !newState.validStates.contains(fighterState)) {
      return;
    }

    fighterState = newState;
    animationFrame = 0;

    _initState();
  }

  void _updateAnimations(FrameTime time) {
    final frameDelay = currentAnimationFrame.delay;

    if (time.previous > animationTimer + frameDelay) {
      animationTimer = time.previous;

      if (frameDelay > 0) {
        animationFrame++;
      }

      if (animationFrame >= currentAnimation.length) {
        animationFrame = 0;
      }
    }
  }

  void _updateStateContraints(Size size) {
    const maxWidth = 32.0;

    if (position.x > size.width - maxWidth) {
      position.x = size.width - maxWidth;
    }

    if (position.x < maxWidth) {
      position.x = maxWidth;
    }
  }

  void _initState() {
    switch (fighterState) {
      case FighterState.IDLE:
      case FighterState.JUMP_START:
      case FighterState.JUMP_LAND:
      case FighterState.CROUCH_DOWN:
        _handleIdleInit();
        break;
      case FighterState.JUMP_UP:
      case FighterState.JUMP_FRONT:
      case FighterState.JUMP_BACK:
        _handleJumpInit();
        break;
      case FighterState.WALK_BACK:
      case FighterState.WALK_FRONT:
        _handleMoveInit();
        break;
      default:
        break;
    }
  }

  void _updateState(FrameTime time) {
    switch (fighterState) {
      case FighterState.IDLE:
        _handleIdleState();
        break;
      case FighterState.WALK_FRONT:
        _handleWalkFrontState();
        break;
      case FighterState.WALK_BACK:
        _handleWalkBackState();
        break;
      case FighterState.JUMP_UP:
      case FighterState.JUMP_FRONT:
      case FighterState.JUMP_BACK:
        _handleJumpState(time);
        break;
      case FighterState.JUMP_START:
        _handleJumpStartState();
        break;
      case FighterState.JUMP_LAND:
        _handleJumpLandState();
        break;
      case FighterState.CROUCH:
        _handleCrouchState();
        break;
      case FighterState.CROUCH_UP:
        _handleCrouchUpState();
        break;
      case FighterState.CROUCH_DOWN:
        _handleCrouchDownState();
        break;
      default:
        break;
    }
  }

  /* Handle Init States */

  void _handleIdleInit() {
    velocity.x = 0;
    velocity.y = 0;
  }

  void _handleMoveInit() {
    velocity.x = initialVelocitys[fighterState] ?? 0;
  }

  void _handleJumpInit() {
    velocity.y = -FighterData.JUMP_UP;
    _handleMoveInit();
  }

  /* Handle Update States */

  void _handleIdleState() {
    if (isUp) {
      _changeState(FighterState.JUMP_START);
    }
    if (isDown) {
      _changeState(FighterState.CROUCH_DOWN);
    }
    if (isForward) {
      _changeState(FighterState.WALK_FRONT);
    }
    if (isBackward) {
      _changeState(FighterState.WALK_BACK);
    }
  }

  void _handleJumpState(FrameTime time) {
    velocity.y += FighterData.GRAVITY * time.secondsPassed;
    if (position.y > GameData.GAME_FLOOR) {
      position.y = GameData.GAME_FLOOR;
      _changeState(FighterState.JUMP_LAND);
    }
  }

  void _handleWalkFrontState() {
    if (!isForward) {
      _changeState(FighterState.IDLE);
    }
    if (isUp) {
      _changeState(FighterState.JUMP_START);
    }
    if (isDown) {
      _changeState(FighterState.CROUCH_DOWN);
    }
  }

  void _handleWalkBackState() {
    if (!isBackward) {
      _changeState(FighterState.IDLE);
    }
    if (isUp) {
      _changeState(FighterState.JUMP_START);
    }
    if (isDown) {
      _changeState(FighterState.CROUCH_DOWN);
    }
  }

  void _handleJumpStartState() {
    if (currentAnimationFrame.delay == -2) {
      if (isBackward) {
        _changeState(FighterState.JUMP_BACK);
      } else if (isForward) {
        _changeState(FighterState.JUMP_FRONT);
      } else {
        _changeState(FighterState.JUMP_UP);
      }
    }
  }

  void _handleJumpLandState() {
    if (animationFrame < 1) return;

    if (!isIdle) {
      _handleIdleState();
    } else if (currentAnimationFrame.delay != -2) {
      return;
    }

    _changeState(FighterState.IDLE);
  }

  void _handleCrouchState() {
    if (!isDown) {
      _changeState(FighterState.CROUCH_UP);
    }
  }

  void _handleCrouchUpState() {
    if (currentAnimationFrame.delay == -2) {
      _changeState(FighterState.IDLE);
    }
  }

  void _handleCrouchDownState() {
    if (currentAnimationFrame.delay == -2) {
      _changeState(FighterState.CROUCH);
    }
  }

  /* Debugger */
  void _debug(Canvas canvas) {
    if (currentAnimationFrame.hitBox != null) {
      final paintHitBox = Paint()
        ..color = (name == "ryu"
                ? const Color.fromARGB(255, 76, 175, 80)
                : const Color.fromRGBO(244, 67, 54, 1))
            .withOpacity(.5)
        ..style = PaintingStyle.fill;

      canvas.drawRect(
        Rect.fromLTWH(
          position.x + currentAnimationFrame.hitBox!.x,
          position.y + currentAnimationFrame.hitBox!.y,
          currentAnimationFrame.hitBox!.width,
          currentAnimationFrame.hitBox!.height,
        ),
        paintHitBox,
      );
    }
  }
}
