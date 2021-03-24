import 'package:chessboard/chessboard.dart';
import 'package:chessboard/models/chessboard_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chessboard/configureBoardSizeBox.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chessboard'),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              ConfigureBoardSizeBox(),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Chessboard(),
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Время решения: ${context.watch<ChessboardData>().getComputeTime} мс',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ), Center(
            child: context.watch<ChessboardData>().getIsFinished == false
                ? CircularProgressIndicator()
                : Center(),
          ),
        ],
      ),
    );
  }
}
