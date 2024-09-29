import 'package:flutter_flight_game/constants/fighter_data.dart';
import 'package:flutter_flight_game/fighters/fighter.dart';
import 'package:flutter_flight_game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/types/vector.dart';
import 'package:flutter_flight_game/utils/assets.dart';

class Ryu extends Fighter {
  Ryu({
    required super.position,
    required super.direction,
  }) : super(
          spriteSheetData: SpriteSheetData(
            spriteSheet: AssetsUtil.ryuSpriteSheet,
            animations: {
              FighterState.IDLE.name: [
                Sprite(75, 14, 60, 89, anchor: Vector(34, 86), delay: 68),
                Sprite(7, 14, 59, 90, anchor: Vector(33, 87), delay: 68),
                Sprite(277, 11, 58, 92, anchor: Vector(32, 89), delay: 68),
                Sprite(211, 10, 55, 93, anchor: Vector(31, 90), delay: 68),
                Sprite(277, 11, 58, 92, anchor: Vector(32, 89), delay: 68),
                Sprite(7, 14, 59, 90, anchor: Vector(33, 87), delay: 68),
              ],
              FighterState.WALK_FRONT.name: [
                Sprite(9, 136, 53, 83, anchor: Vector(27, 81), delay: 65),
                Sprite(78, 131, 60, 89, anchor: Vector(35, 86), delay: 65),
                Sprite(152, 128, 64, 92, anchor: Vector(35, 87), delay: 65),
                Sprite(229, 130, 65, 90, anchor: Vector(29, 88), delay: 65),
                Sprite(307, 128, 54, 91, anchor: Vector(25, 87), delay: 65),
                Sprite(371, 128, 50, 89, anchor: Vector(25, 86), delay: 65),
              ],
              FighterState.WALK_BACK.name: [
                Sprite(777, 128, 61, 87, anchor: Vector(35, 85), delay: 65),
                Sprite(430, 124, 59, 90, anchor: Vector(36, 87), delay: 65),
                Sprite(495, 124, 57, 90, anchor: Vector(36, 88), delay: 65),
                Sprite(559, 124, 58, 90, anchor: Vector(38, 89), delay: 65),
                Sprite(631, 125, 58, 91, anchor: Vector(36, 88), delay: 65),
                Sprite(707, 126, 57, 89, anchor: Vector(36, 87), delay: 65),
              ],
              FighterState.JUMP_UP.name: [
                Sprite(67, 244, 56, 104, anchor: Vector(32, 107), delay: 100),
                Sprite(138, 233, 50, 89, anchor: Vector(25, 103), delay: 100),
                Sprite(197, 233, 54, 77, anchor: Vector(25, 103), delay: 100),
                Sprite(259, 240, 48, 70, anchor: Vector(28, 101), delay: 100),
                Sprite(319, 234, 48, 89, anchor: Vector(25, 106), delay: 100),
                Sprite(375, 244, 55, 109, anchor: Vector(31, 113), delay: -1),
              ],
            },
          ),
        );
}
