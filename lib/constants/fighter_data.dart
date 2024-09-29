enum FighterState {
  IDLE,
  WALK_FRONT,
  WALK_BACK,
  JUMP_UP,
}

enum FighterDir {
  LEFT,
  RIGHT;

  int get side => this == LEFT ? -1 : 1;
}

abstract class FighterData {
  static const GRAVITY = 1000.0;

  static const WALK_FRONT = 200.0;
  static const WALK_BACK = 150.0;
  static const JUMP_UP = 420.0;
}

const initialVelocitys = {
  FighterState.WALK_FRONT: FighterData.WALK_FRONT,
  FighterState.WALK_BACK: -FighterData.WALK_BACK,
};
