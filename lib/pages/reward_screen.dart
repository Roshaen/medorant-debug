import 'package:flutter/material.dart';
import 'package:medorant/widgets/drawer.dart';

class RewardScreen extends StatelessWidget {
  const RewardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Rewards'),
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}
