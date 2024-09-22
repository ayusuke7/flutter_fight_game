class FrameTime {
  int previous;
  double secondsPassed;

  FrameTime(
    this.previous,
    this.secondsPassed,
  );

  int get fps {
    return secondsPassed > 0 ? 1 ~/ secondsPassed : 0;
  }
}
