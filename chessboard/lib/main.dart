import 'package:flutter/material.dart';
import 'package:chessboard/homePage.dart';
import 'package:provider/provider.dart';
import 'package:chessboard/models/chessboard_data.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChessboardData>(
      create: (context) => ChessboardData(),
      child: MaterialApp(title: 'Chessboard',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
