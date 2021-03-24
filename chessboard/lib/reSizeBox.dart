import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/chessboard_data.dart';

class ReSizeBox extends StatefulWidget {
  final Function _canReSizeChessboard;
  final int _defaultSelectedIndex;
  final IconData _icon;

  @override
  ReSizeBox(this._defaultSelectedIndex, this._canReSizeChessboard, this._icon);

  @override
  _ReSizeBoxState createState() =>
      _ReSizeBoxState(_defaultSelectedIndex, _canReSizeChessboard, _icon);
}

class _ReSizeBoxState extends State<ReSizeBox> {
  Function _canReSizeChessboard;
  int _defaultSelectedIndex;
  IconData _icon;

  @override
  _ReSizeBoxState(
      int defaultSelectedIndex, this._canReSizeChessboard, IconData icon) {
    _defaultSelectedIndex = defaultSelectedIndex;
    _icon = icon;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      iconSize: 50,
      value: _defaultSelectedIndex,
      onChanged: (int countNewData) {
        if (context.read<ChessboardData>().getIsFinished)
          setState(() {
            _defaultSelectedIndex = countNewData;
            _canReSizeChessboard(countNewData);
          });
      },
      icon: Icon(_icon),
      items: [
        DropdownMenuItem(
          child: Text(
            '1',
            style: TextStyle(fontSize: 20),
          ),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text('2'),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text('3'),
          value: 3,
        ),
        DropdownMenuItem(
          child: Text('4'),
          value: 4,
        ),
        DropdownMenuItem(
          child: Text('5'),
          value: 5,
        ),
        DropdownMenuItem(
          child: Text('6'),
          value: 6,
        ),
        DropdownMenuItem(
          child: Text('7'),
          value: 7,
        ),
        DropdownMenuItem(
          child: Text('8'),
          value: 8,
        ),
        DropdownMenuItem(
          child: Text('9'),
          value: 9,
        )
      ],
    );
  }
}
