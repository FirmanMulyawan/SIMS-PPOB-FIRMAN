import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/config/app_style.dart';
import '../../../components/widget/empty_data.dart';
import '../homepage_state.dart';
import './home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: AppStyle.white,
          appBar: _appBar(),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: GetBuilder<HomeController>(builder: (ctrl) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 80),
            );
          }),
          body: _productPrice(context)),
    );
  }

  _appBar() {
    return AppBar(
        centerTitle: true,
        elevation: 3,
        title: GetBuilder<HomeController>(builder: (ctx) {
          return Container();
        }));
  }

  Widget _productPrice(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      final state = ctrl.state;
      final listData = ctrl.list;
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      if (state is HomePageLoadSuccess) {
        List<Widget> output = [];
        output.add(const SizedBox(height: 5));
        for (var i = 0; i < listData.length; i++) {
          output.add(
            Container(),
          );
        }
        output.add(const SizedBox(height: 100));

        return Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(top: 5),
                child: RefreshIndicator(
                  onRefresh: () async =>
                      Future<void>.delayed(const Duration(seconds: 1)).then(
                    (value) => ctrl.onRefresh(),
                  ),
                  color: AppStyle.appthemeAccent,
                  backgroundColor: AppStyle.white,
                  strokeWidth: 4.0,
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: output,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
          ],
        );
      }

      if (state is HomePageEmpty) {
        return EmptyData(width: width * 0.5);
      }

      return Container();
    });
  }
}
