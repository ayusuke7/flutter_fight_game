import 'package:flutter/material.dart';
import 'package:flutter_flight_game/game_board.dart';
import 'package:flutter_flight_game/utils/assets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AssetsUtil.loadAllImages();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GameBoard(),
    );
  }
}
