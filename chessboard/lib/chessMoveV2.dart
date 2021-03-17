int rating(
  Map<String, int> map,
  int startPositionX,
  int startPositionY,
  final int columnCount,
  final int rowCount,
) {
  int currentRating = 0;
  if ((startPositionX - 1 > -1) &&
      (startPositionY + 2 < rowCount) &&
      (map['${startPositionX - 1}${startPositionY + 2}'] == 0)) currentRating++;
  if ((startPositionX - 2 > -1) &&
      (startPositionY + 1 < rowCount) &&
      (map['${startPositionX - 2}${startPositionY + 1}'] == 0)) currentRating++;
  if ((startPositionX + 1 < columnCount) &&
      (startPositionY + 2 < rowCount) &&
      (map['${startPositionX + 1}${startPositionY + 2}'] == 0)) currentRating++;
  if ((startPositionX + 2 < columnCount) &&
      (startPositionY + 1 < rowCount) &&
      (map['${startPositionX + 2}${startPositionY + 1}'] == 0)) currentRating++;
  if ((startPositionX + 2 < columnCount) &&
      (startPositionY - 1 > -1) &&
      (map['${startPositionX + 2}${startPositionY - 1}'] == 0)) currentRating++;
  if ((startPositionX + 1 < columnCount) &&
      (startPositionY - 2 > -1) &&
      (map['${startPositionX + 1}${startPositionY - 2}'] == 0)) currentRating++;
  if ((startPositionX - 1 > -1) &&
      (startPositionY - 2 > -1) &&
      (map['${startPositionX - 1}${startPositionY - 2}'] == 0)) currentRating++;
  if ((startPositionX - 2 > -1) &&
      (startPositionY - 1 > -1) &&
      (map['${startPositionX - 2}${startPositionY - 1}'] == 0)) currentRating++;

  return currentRating;
}

Map computeRoute(Map map) {
  Map oldMap = Map<String, int>();
  oldMap.addAll(map[1]);
  Map tempMap = Map<String, int>();
  final Map param = Map<String, int>();
  param.addAll(map[0]);
  final int columnCount = param['columnCount'];
  final int rowCount = param['rowCount'];
  int startPositionX = param['startPositionX'];
  int startPositionY = param['startPositionY'];
  int tempPositionX = 0;
  int tempPositionY = 0;
  int currentRating = 0;

  oldMap['$startPositionX$startPositionY'] = 1;

  for (int currentStep = 0;
      currentStep < (columnCount * rowCount) - 1;
      currentStep++) {
    int oldRating = 9;

    if ((startPositionX - 1 > -1) &&
        (startPositionY + 2 < rowCount) &&
        (oldMap['${startPositionX - 1}${startPositionY + 2}'] == 0)) {
      currentRating = rating(oldMap, startPositionX - 1, startPositionY + 2,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX - 1;
        tempPositionY = startPositionY + 2;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX - 1}${startPositionY + 2}'] = currentStep + 2;
      }
    }

    if ((startPositionX - 2 > -1) &&
        (startPositionY + 1 < rowCount) &&
        (oldMap['${startPositionX - 2}${startPositionY + 1}'] == 0)) {
      currentRating = rating(oldMap, startPositionX - 2, startPositionY + 1,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX - 2;
        tempPositionY = startPositionY + 1;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX - 2}${startPositionY + 1}'] = currentStep + 2;
      }
    }

    if ((startPositionX + 1 < columnCount) &&
        (startPositionY + 2 < rowCount) &&
        (oldMap['${startPositionX + 1}${startPositionY + 2}'] == 0)) {
      currentRating = rating(oldMap, startPositionX + 1, startPositionY + 2,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX + 1;
        tempPositionY = startPositionY + 2;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX + 1}${startPositionY + 2}'] = currentStep + 2;
      }
    }

    if ((startPositionX + 2 < columnCount) &&
        (startPositionY + 1 < rowCount) &&
        (oldMap['${startPositionX + 2}${startPositionY + 1}'] == 0)) {
      currentRating = rating(oldMap, startPositionX + 2, startPositionY + 1,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX + 2;
        tempPositionY = startPositionY + 1;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX + 2}${startPositionY + 1}'] = currentStep + 2;
      }
    }

    if ((startPositionX + 2 < columnCount) &&
        (startPositionY - 1 > -1) &&
        (oldMap['${startPositionX + 2}${startPositionY - 1}'] == 0)) {
      currentRating = rating(oldMap, startPositionX + 2, startPositionY - 1,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX + 2;
        tempPositionY = startPositionY - 1;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX + 2}${startPositionY - 1}'] = currentStep + 2;
      }
    }

    if ((startPositionX + 1 < columnCount) &&
        (startPositionY - 2 > -1) &&
        (oldMap['${startPositionX + 1}${startPositionY - 2}'] == 0)) {
      currentRating = rating(oldMap, startPositionX + 1, startPositionY - 2,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX + 1;
        tempPositionY = startPositionY - 2;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX + 1}${startPositionY - 2}'] = currentStep + 2;
      }
    }

    if ((startPositionX - 1 > -1) &&
        (startPositionY - 2 > -1) &&
        (oldMap['${startPositionX - 1}${startPositionY - 2}'] == 0)) {
      currentRating = rating(oldMap, startPositionX - 1, startPositionY - 2,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX - 1;
        tempPositionY = startPositionY - 2;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX - 1}${startPositionY - 2}'] = currentStep + 2;
      }
    }

    if ((startPositionX - 2 > -1) &&
        (startPositionY - 1 > -1) &&
        (oldMap['${startPositionX - 2}${startPositionY - 1}'] == 0)) {
      currentRating = rating(oldMap, startPositionX - 2, startPositionY - 1,
          columnCount, rowCount);
      if (currentRating < oldRating) {
        tempPositionX = startPositionX - 2;
        tempPositionY = startPositionY - 1;
        oldRating = currentRating;
        tempMap.clear();
        tempMap.addAll(oldMap);
        tempMap['${startPositionX - 2}${startPositionY - 1}'] = currentStep + 2;
      }
    }
    if (oldRating == 9) return null;

    startPositionX = tempPositionX;
    startPositionY = tempPositionY;

    oldMap.clear();
    oldMap.addAll(tempMap);
  }
  return oldMap;
}
