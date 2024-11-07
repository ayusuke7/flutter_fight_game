import 'package:flutter_flight_game/game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/game/types/vector.dart';

enum SpriteKey {
  IDLE,
  WALK_FRONT,
  WALK_BACK,
  JUMP_UP,
  JUMP_ROLL,
  JUMP_LAND,
  CROUCH,
}

abstract class SpritesData {
  static List<Sprite> ryu(SpriteKey key) {
    final hitboxIdle = HitBox(-16, -80, 32, 78);
    final hitboxJump = HitBox(-16, -91, 32, 66);
    final hitboxCrouch = HitBox(-16, -50, 32, 50);
    final hitboxBend = HitBox(-16, -58, 32, 58);

    return {
      SpriteKey.IDLE: [
        Sprite(75, 14, 60, 89, anchor: Vector(34, 86), hitBox: hitboxIdle),
        Sprite(7, 14, 59, 90, anchor: Vector(33, 87), hitBox: hitboxIdle),
        Sprite(277, 11, 58, 92, anchor: Vector(32, 89), hitBox: hitboxIdle),
        Sprite(211, 10, 55, 93, anchor: Vector(31, 90), hitBox: hitboxIdle),
      ],
      SpriteKey.WALK_FRONT: [
        Sprite(9, 136, 53, 83, anchor: Vector(27, 81), hitBox: hitboxIdle),
        Sprite(78, 131, 60, 89, anchor: Vector(35, 86), hitBox: hitboxIdle),
        Sprite(152, 128, 64, 92, anchor: Vector(35, 87), hitBox: hitboxIdle),
        Sprite(229, 130, 65, 90, anchor: Vector(29, 88), hitBox: hitboxIdle),
        Sprite(307, 128, 54, 91, anchor: Vector(25, 87), hitBox: hitboxIdle),
        Sprite(371, 128, 50, 89, anchor: Vector(25, 86), hitBox: hitboxIdle),
      ],
      SpriteKey.WALK_BACK: [
        Sprite(777, 128, 61, 87, anchor: Vector(35, 85), hitBox: hitboxIdle),
        Sprite(430, 124, 59, 90, anchor: Vector(36, 87), hitBox: hitboxIdle),
        Sprite(495, 124, 57, 90, anchor: Vector(36, 88), hitBox: hitboxIdle),
        Sprite(559, 124, 58, 90, anchor: Vector(38, 89), hitBox: hitboxIdle),
        Sprite(631, 125, 58, 91, anchor: Vector(36, 88), hitBox: hitboxIdle),
        Sprite(707, 126, 57, 89, anchor: Vector(36, 87), hitBox: hitboxIdle),
      ],
      SpriteKey.JUMP_UP: [
        Sprite(67, 244, 56, 104, anchor: Vector(32, 107), hitBox: hitboxJump),
        Sprite(138, 233, 50, 89, anchor: Vector(25, 103), hitBox: hitboxJump),
        Sprite(197, 233, 54, 77, anchor: Vector(25, 103), hitBox: hitboxJump),
        Sprite(259, 240, 48, 70, anchor: Vector(28, 101), hitBox: hitboxJump),
        Sprite(319, 234, 48, 89, anchor: Vector(25, 106), hitBox: hitboxJump),
        Sprite(375, 244, 55, 109, anchor: Vector(31, 113), hitBox: hitboxJump),
      ],
      SpriteKey.JUMP_ROLL: [
        Sprite(878, 121, 55, 103, anchor: Vector(25, 106), hitBox: hitboxJump),
        Sprite(442, 261, 61, 78, anchor: Vector(22, 90), hitBox: hitboxJump),
        Sprite(507, 259, 104, 42, anchor: Vector(61, 76), hitBox: hitboxJump),
        Sprite(617, 240, 53, 82, anchor: Vector(42, 111), hitBox: hitboxJump),
        Sprite(676, 257, 122, 44, anchor: Vector(71, 81), hitBox: hitboxJump),
        Sprite(804, 258, 71, 89, anchor: Vector(53, 98), hitBox: hitboxJump),
        Sprite(883, 261, 54, 109, anchor: Vector(31, 113), hitBox: hitboxJump),
      ],
      SpriteKey.JUMP_LAND: [
        Sprite(7, 268, 55, 85, anchor: Vector(29, 83), hitBox: hitboxJump),
      ],
      SpriteKey.CROUCH: [
        Sprite(551, 21, 53, 83, anchor: Vector(27, 81), hitBox: hitboxIdle),
        Sprite(611, 36, 57, 69, anchor: Vector(25, 66), hitBox: hitboxBend),
        Sprite(679, 44, 61, 61, anchor: Vector(25, 58), hitBox: hitboxCrouch),
      ],
    }[key]!;
  }
}
