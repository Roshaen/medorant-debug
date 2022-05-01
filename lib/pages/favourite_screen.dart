import 'package:flutter/material.dart';
import 'package:medorant/widgets/drawer.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Favourites'),
        ),
        drawer: AppDrawer(),
      ),
    );
  }
}
