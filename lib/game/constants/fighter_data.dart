enum FighterState {
  IDLE,
  WALK_FRONT,
  WALK_BACK,
  JUMP_UP,
  JUMP_FRONT,
  JUMP_BACK,
  JUMP_START,
  JUMP_LAND,
  CROUCH,
  CROUCH_UP,
  CROUCH_DOWN;

  List<FighterState> get validStates {
    switch (this) {
      case IDLE:
        return [
          IDLE,
          WALK_BACK,
          WALK_FRONT,
          JUMP_UP,
          JUMP_FRONT,
          JUMP_BACK,
          JUMP_LAND,
          CROUCH_UP,
        ];
      case WALK_FRONT:
        return [IDLE, WALK_BACK];
      case WALK_BACK:
        return [IDLE, WALK_FRONT];
      case JUMP_START:
        return [IDLE, WALK_FRONT, WALK_BACK, JUMP_LAND];
      case JUMP_UP:
        return [JUMP_START];
      case JUMP_FRONT:
        return [JUMP_START];
      case JUMP_BACK:
        return [JUMP_START];
      case JUMP_LAND:
        return [JUMP_UP, JUMP_FRONT, JUMP_BACK];
      case CROUCH:
        return [CROUCH_DOWN];
      case CROUCH_UP:
        return [CROUCH];
      case CROUCH_DOWN:
        return [IDLE, WALK_FRONT, WALK_BACK];
      default:
        return [];
    }
  }
}

enum FighterDir {
  LEFT,
  RIGHT;

  int get side => this == LEFT ? -1 : 1;

  bool get flip => this == LEFT;
}

abstract class FighterData {
  static const GRAVITY = 1000.0;

  static const WALK_FRONT = 200.0;
  static const WALK_BACK = 150.0;
  static const JUMP_UP = 420.0;
  static const JUMP_FRONT = 170.0;
  static const JUMP_BACK = 200.0;
}

const initialVelocitys = {
  FighterState.WALK_FRONT: FighterData.WALK_FRONT,
  FighterState.WALK_BACK: -FighterData.WALK_BACK,
  FighterState.JUMP_FRONT: FighterData.JUMP_FRONT,
  FighterState.JUMP_BACK: -FighterData.JUMP_BACK,
};
