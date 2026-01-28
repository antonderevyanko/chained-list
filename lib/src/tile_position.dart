enum TilePosition {
  first,
  last,
  middle,
  theOnly;

  bool get isFirst => this == TilePosition.first;
  bool get isMiddle => this == TilePosition.middle;
  bool get isLast => this == TilePosition.last;
  bool get isTheOnly => this == TilePosition.theOnly;

  static TilePosition positionBy({
    required int index,
    required int length,
  }) {
    if (length == 1) return TilePosition.theOnly;
    if (index == 0) return TilePosition.first;
    if (index == length - 1) return TilePosition.last;

    return TilePosition.middle;
  }
}
