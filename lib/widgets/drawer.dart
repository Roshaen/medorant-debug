import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medorant/pages/favourite_screen.dart';
import 'package:medorant/pages/profile_screen.dart';
import 'package:medorant/pages/reward_screen.dart';
import 'package:medorant/pages/search_screen.dart';

import '../pages/home.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);
  final url =
      'https://wellgroomedgentleman.com/media/images/Tony_Stark_Beard_with_Quiff_Hairstyle.width-800.jpg';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              accountName: const Text('Roshan'),
              accountEmail: const Text('roshaen09@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
            leading: const Icon(CupertinoIcons.home),
            title: const Text(
              'Home',
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const FavouriteScreen(),
                ),
              );
            },
            leading: const Icon(CupertinoIcons.square_favorites),
            title: const Text(
              'Favourites',
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            leading: const Icon(CupertinoIcons.search),
            title: const Text(
              'Recent Search',
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },
            leading: const Icon(CupertinoIcons.profile_circled),
            title: const Text(
              'Profile',
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const RewardScreen(),
                ),
              );
            },
            leading: const Icon(CupertinoIcons.gift),
            title: const Text(
              'Rewards',
              textScaleFactor: 1.2,
            ),
          )
        ],
      ),
    );
  }
}
