import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './my_favorite_controller.dart';

class MyFavoriteScreen extends GetView<MyFavoriteController> {
  const MyFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Favorite Team'),
            centerTitle: true,
          ),
          body: SafeArea(child: Container()),
        );
      },
    );
  }
}
