import 'package:flutter_flight_game/constants/fighter_data.dart';
import 'package:flutter_flight_game/constants/sprite_data.dart';
import 'package:flutter_flight_game/fighters/fighter.dart';
import 'package:flutter_flight_game/types/sprite_sheet.dart';
import 'package:flutter_flight_game/utils/assets.dart';

class Ryu extends Fighter {
  Ryu({
    super.name = "ryu",
    required super.position,
    required super.direction,
  }) : super(
          spriteSheetData: SpriteSheetData(
            spriteSheet: AssetsUtil.ryuSpriteSheet,
            animations: {
              FighterState.IDLE.name: [
                SpritesData.ryu(SpriteKey.IDLE)[0]..delay = 68,
                SpritesData.ryu(SpriteKey.IDLE)[1]..delay = 68,
                SpritesData.ryu(SpriteKey.IDLE)[2]..delay = 68,
                SpritesData.ryu(SpriteKey.IDLE)[3]..delay = 68,
                SpritesData.ryu(SpriteKey.IDLE)[2]..delay = 68,
                SpritesData.ryu(SpriteKey.IDLE)[1]..delay = 68,
              ],
              FighterState.WALK_FRONT.name: [
                SpritesData.ryu(SpriteKey.WALK_FRONT)[0]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_FRONT)[1]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_FRONT)[2]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_FRONT)[3]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_FRONT)[4]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_FRONT)[5]..delay = 65,
              ],
              FighterState.WALK_BACK.name: [
                SpritesData.ryu(SpriteKey.WALK_BACK)[0]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_BACK)[1]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_BACK)[2]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_BACK)[3]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_BACK)[4]..delay = 65,
                SpritesData.ryu(SpriteKey.WALK_BACK)[5]..delay = 65,
              ],
              FighterState.JUMP_UP.name: [
                SpritesData.ryu(SpriteKey.JUMP_UP)[0]..delay = 180,
                SpritesData.ryu(SpriteKey.JUMP_UP)[1]..delay = 100,
                SpritesData.ryu(SpriteKey.JUMP_UP)[2]..delay = 100,
                SpritesData.ryu(SpriteKey.JUMP_UP)[3]..delay = 100,
                SpritesData.ryu(SpriteKey.JUMP_UP)[4]..delay = 100,
                SpritesData.ryu(SpriteKey.JUMP_UP)[5]..delay = -1,
              ],
              FighterState.JUMP_START.name: [
                SpritesData.ryu(SpriteKey.JUMP_LAND)[0]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_LAND)[0]..delay = -2,
              ],
              FighterState.JUMP_LAND.name: [
                SpritesData.ryu(SpriteKey.JUMP_LAND)[0]..delay = 33,
                SpritesData.ryu(SpriteKey.JUMP_LAND)[0]..delay = 117,
                SpritesData.ryu(SpriteKey.JUMP_LAND)[0]..delay = -2,
              ],
              FighterState.JUMP_FRONT.name: [
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[0]..delay = 200,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[1]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[2]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[3]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[4]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[5]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[6]..delay = 0,
              ],
              FighterState.JUMP_BACK.name: [
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[6]..delay = 200,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[5]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[4]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[3]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[2]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[1]..delay = 50,
                SpritesData.ryu(SpriteKey.JUMP_ROLL)[0]..delay = 50,
              ],
              FighterState.CROUCH.name: [
                SpritesData.ryu(SpriteKey.CROUCH)[2]..delay = 0,
              ],
              FighterState.CROUCH_DOWN.name: [
                SpritesData.ryu(SpriteKey.CROUCH)[0]..delay = 30,
                SpritesData.ryu(SpriteKey.CROUCH)[1]..delay = 30,
                SpritesData.ryu(SpriteKey.CROUCH)[2]..delay = 30,
                SpritesData.ryu(SpriteKey.CROUCH)[2]..delay = -2,
              ],
              FighterState.CROUCH_UP.name: [
                SpritesData.ryu(SpriteKey.CROUCH)[2]..delay = 30,
                SpritesData.ryu(SpriteKey.CROUCH)[1]..delay = 30,
                SpritesData.ryu(SpriteKey.CROUCH)[0]..delay = 30,
                SpritesData.ryu(SpriteKey.CROUCH)[0]..delay = -2,
              ],
            },
          ),
        );
}
