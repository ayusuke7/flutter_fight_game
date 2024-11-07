import 'package:flutter/material.dart';
import 'package:flutter_flight_game/game/game.dart';
import 'package:flutter_flight_game/game/utils/assets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AssetsUtil.loadAllImages();
  runApp(const Game());
}
