import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/chessboard_data.dart';
import 'chessMoveV2.dart' as v2;
import 'chessMove.dart';

class Chessboard extends StatelessWidget {
  Widget build(BuildContext context) {
    var _color = Colors.white;
    var line = List<Widget>();
    int currentColumn = 0;

    while (
        currentColumn <= context.watch<ChessboardData>().getColumnCount - 1) {
      int currentRow = 0;
      List<ChessPosition> row = List<ChessPosition>();
      while (currentRow <= context.watch<ChessboardData>().getRowCount - 1) {
        if (((currentColumn % 2) != 0) && (currentRow % 2) != 0) {
          _color = Colors.brown;
        } else {
          if (((currentColumn % 2) == 0) && (currentRow % 2) == 0) {
            _color = Colors.brown;
          } else
            _color = Colors.white;
        }
        row.add(ChessPosition(_color, '$currentColumn$currentRow'));
        currentRow++;
      }
      line.add(Row(
        children: row,
        mainAxisAlignment: MainAxisAlignment.center,
      ));
      currentColumn++;
    }
    return Card(
      child: Column(
        children: line,
      ),
    );
  }
}

class ChessPosition extends StatefulWidget {
  final _color;
  final _id;

  ChessPosition(this._color, this._id);

  @override
  ChessPositionState createState() => ChessPositionState(_color, _id);
}

class ChessPositionState extends State<ChessPosition> {
  static bool isSelected = false;

  var _color;
  var _id;
  Color _oldColor;

  ChessPositionState(this._color, this._id);

  @override
  void deactivate() {
    if ((isSelected == true) && (_color == Colors.red)) {
      isSelected = false;
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._color != Colors.red) _oldColor = widget._color;

    String caption = context.watch<ChessboardData>().getMap[_id] == null
        ? ('')
        : (context.watch<ChessboardData>().getMap[_id].toString());
    return SizedBox(
      width: 50,
      height: 50,
      child: RaisedButton(
        child: Text(caption),
        textColor: Colors.blue,
        onPressed: () {
          if (context.read<ChessboardData>().getIsFinished)
            setState(
              () async {
                if ((isSelected == false) &&
                    ((_color == Colors.white) || (_color == Colors.brown))) {
                  _color = Colors.red;
                  isSelected = true;

                  var myMap = Map<String, int>();
                  for (int column = 0;
                      column < context.read<ChessboardData>().getColumnCount;
                      column++) {
                    for (int row = 0;
                        row < context.read<ChessboardData>().getRowCount;
                        row++) {
                      myMap['$column$row'] = 0;
                    }
                  }

                  var beginDate = DateTime.now();

                  var paramCompute = Map<String, int>();

                  paramCompute['startPositionX'] = int.parse(_id[0]);
                  paramCompute['startPositionY'] = int.parse(_id[1]);
                  paramCompute['columnCount'] =
                      context.read<ChessboardData>().getColumnCount;
                  paramCompute['rowCount'] =
                      context.read<ChessboardData>().getRowCount;

                  var param = Map<int, Map>();

                  param[0] = paramCompute;
                  param[1] = myMap;

                  context.read<ChessboardData>().setIsFinished = false;
                  if ((context.read<ChessboardData>().getColumnCount *
                          context.read<ChessboardData>().getRowCount >
                      24)) {
                    myMap = await compute(v2.computeRoute, param)
                        as Map<String, int>;
                  } else
                    myMap =
                        await compute(computeRoute, param) as Map<String, int>;

                  context.read<ChessboardData>().setIsFinished = true;

                  var endDate = DateTime.now();

                  if (myMap != null) {
                    context.read<ChessboardData>().setMap = myMap;
                  }
                  context.read<ChessboardData>().setIsFinished = true;
                  context.read<ChessboardData>().setComputeTime =
                      endDate.difference(beginDate).inMilliseconds;
                  return null;
                }

                if ((isSelected == true) && (_color == Colors.red)) {
                  isSelected = false;
                  _color = _oldColor;

                  context.read<ChessboardData>().setMap = Map();
                  return null;
                }
              },
            );
        },
        color: _color,
      ),
    );
  }
}
