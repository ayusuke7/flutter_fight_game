import 'dart:ui';

import 'package:flutter_flight_game/constants/fighter_data.dart';
import 'package:flutter_flight_game/constants/game_data.dart';
import 'package:flutter_flight_game/types/frame_time.dart';
import 'package:flutter_flight_game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/types/vector.dart';

class Fighter {
  final SpriteSheetData spriteSheetData;
  final Vector velocity = Vector(0, 0);
  final Vector position;

  FighterState fighterState;
  FighterDir direction;

  int animationFrame = 0;
  int animationTimer = 0;

  Fighter({
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
    canvas.drawImageRect(
      spriteSheetData.spriteSheet,
      Rect.fromLTWH(
        currentAnimationFrame.x,
        currentAnimationFrame.y,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      Rect.fromLTWH(
        position.x - currentAnimationFrame.anchor!.x,
        position.y - currentAnimationFrame.anchor!.y,
        currentAnimationFrame.width,
        currentAnimationFrame.height,
      ),
      Paint(),
    );
  }

  void changeState(FighterState newState) {
    if (newState == fighterState) return;

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
        _handleIdleInit();
        break;
      case FighterState.JUMP_UP:
        _handleJumpUpInit();
        break;
      case FighterState.WALK_BACK:
      case FighterState.WALK_FRONT:
        _handleMoveInit();
        break;
      default:
    }
  }

  void _updateState(FrameTime time) {
    switch (fighterState) {
      case FighterState.JUMP_UP:
        _handleJumpState(time);
        break;
      default:
    }
  }

  void _handleIdleInit() {
    velocity.x = 0;
    velocity.y = 0;
  }

  void _handleMoveInit() {
    velocity.x = initialVelocitys[fighterState] ?? 0;
  }

  void _handleJumpState(FrameTime time) {
    velocity.y += FighterData.GRAVITY * time.secondsPassed;
    if (position.y > GameData.GAME_FLOOR) {
      position.y = GameData.GAME_FLOOR;
      changeState(FighterState.IDLE);
    }
  }

  void _handleJumpUpInit() {
    velocity.y = -FighterData.JUMP_UP;
    _handleMoveInit();
  }
}
