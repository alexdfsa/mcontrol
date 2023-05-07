import 'package:flutter/material.dart';
import 'package:mcontrol/core/shared/widgets/custom_drawer.dart';
import 'package:mcontrol/core/shared/widgets/user_image_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: UserImageButton(),
          ),
        ],
      ),
      drawer: const CustomDrawer(),
    );
  }
}
