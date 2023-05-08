import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationDrawer(
      onDestinationSelected: (index) {
        Navigator.of(context).pop();
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed('/home');
            break;
          case 1:
            Navigator.of(context).pushNamed('/financial/bankOverview');
            break;
          case 2:
            Navigator.of(context).pushNamed('config');
            break;
          case 3:
            Navigator.of(context).pushNamed('/financial/financialAccount');
            break;
          default:
        }
      },
      children: const [
        Text('Opções'),
        NavigationDrawerDestination(
          icon: Icon(Icons.sync),
          label: Text('Home'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.accessibility_rounded),
          label: Text('Bank'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.settings),
          label: Text('Settings'),
        ),
        NavigationDrawerDestination(
          icon: Icon(Icons.account_balance_rounded),
          label: Text('Financial Account'),
        ),
      ],
    );
  }
}
