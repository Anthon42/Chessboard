Map computeRoute(Map map) {
  bool isFinished = false;
  final Map resultMap = Map<String, int>();

  Map<String, int> nextStep(
      Map<String, int> map,
      int startPositionX,
      int startPositionY,
      final int columnCount,
      final int rowCount,
      int steep) {
    if (isFinished == true) return null;

    if (steep > columnCount * rowCount) {
      isFinished = true;
      resultMap.addAll(map);
      return null;
    }

    Map localMap = Map<String, int>();
    localMap.addAll(map);

    if (localMap['$startPositionX$startPositionY'] == 0) {
      localMap['$startPositionX$startPositionY'] = steep;

      if ((startPositionX - 1 > -1) && (startPositionY + 2 < rowCount)) {
        nextStep(localMap, startPositionX - 1, startPositionY + 2, columnCount,
            rowCount, steep + 1);
      }

      if ((startPositionX - 2 > -1) && (startPositionY + 1 < rowCount)) {
        nextStep(localMap, startPositionX - 2, startPositionY + 1, columnCount,
            rowCount, steep + 1);
      }

      if ((startPositionX + 1 < columnCount) &&
          (startPositionY + 2 < rowCount)) {
        nextStep(localMap, startPositionX + 1, startPositionY + 2, columnCount,
            rowCount, steep + 1);
      }

      if ((startPositionX + 2 < columnCount) &&
          (startPositionY + 1 < rowCount)) {
        nextStep(localMap, startPositionX + 2, startPositionY + 1, columnCount,
            rowCount, steep + 1);
      }

      if ((startPositionX + 2 < columnCount) && (startPositionY - 1 > -1)) {
        nextStep(localMap, startPositionX + 2, startPositionY - 1, columnCount,
            rowCount, steep + 1);
      }

      if ((startPositionX + 1 < columnCount) && (startPositionY - 2 > -1)) {
        nextStep(localMap, startPositionX + 1, startPositionY - 2, columnCount,
            rowCount, steep + 1);
      }

      if ((startPositionX - 1 > -1) && (startPositionY - 2 > -1)) {
        nextStep(localMap, startPositionX - 1, startPositionY - 2, columnCount,
            rowCount, steep + 1);
      }

      if ((startPositionX - 2 > -1) && (startPositionY - 1 > -1)) {
        nextStep(localMap, startPositionX - 2, startPositionY - 1, columnCount,
            rowCount, steep + 1);
      }
    }
    return null;
  }

  nextStep(map[1], map[0]['startPositionX'], map[0]['startPositionY'],
      map[0]['columnCount'], map[0]['rowCount'], 1);
  return resultMap;
}
