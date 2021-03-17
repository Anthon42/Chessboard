import 'package:flutter/material.dart';
import 'package:chessboard/reSizeBox.dart';
import 'package:provider/provider.dart';

import 'models/chessboard_data.dart';

class ConfigureBoardSizeBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                'Количество строк',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: ReSizeBox(
                    context.read<ChessboardData>().getColumnCount,
                    context.read<ChessboardData>().changeWidthChessboard,
                    Icons.view_list_rounded),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                'Количество колонок',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: ReSizeBox(
                    context.read<ChessboardData>().getRowCount,
                    context.read<ChessboardData>().changeHeightChessboard,
                    Icons.view_column_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
