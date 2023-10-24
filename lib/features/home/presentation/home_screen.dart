import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/config/app_const.dart';
import '../../../components/config/app_style.dart';
import '../../../components/widget/app_shimmer.dart';
import '../../../components/widget/card_saldo_home.dart';
import '../../../components/widget/title_home.dart';
import '../homepage_state.dart';
import './home_controller.dart';
import './widget_home_page/loading_balance.dart';
import 'widget_home_page/loading_banner.dart';
import 'widget_home_page/widget_banner.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (ctrl) {
        final profile = ctrl.profile;

        return Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
              title: ctrl.profileState is ProfileSuccess
                  ? TitleHome(
                      imageLink: profile?.data?.profileImage ??
                          'https://www.iconsdb.com/icons/preview/dark-gray/user-xxl.png',
                    )
                  : const TitleHome(
                      imageLink:
                          'https://www.iconsdb.com/icons/preview/dark-gray/user-xxl.png',
                    )),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  if (ctrl.balanceState is BalanceSuccess) ...[
                    CardSaldoHome(
                      controller: ctrl.saldo,
                      obscureText: ctrl.isObscureText,
                      readOnly: false,
                      onTap: () {
                        ctrl.isObscureText == true
                            ? ctrl.updateIsObscureText(false)
                            : ctrl.updateIsObscureText(true);
                      },
                      assetIcon: ctrl.isObscureText == true
                          ? AppConst.assetEyeVisibilityOff
                          : AppConst.assetEyeVisibility,
                    ),
                  ] else if (ctrl.balanceState is BalanceLoading) ...[
                    const BalanceShimmer()
                  ] else ...[
                    CardSaldoHome(
                      controller: ctrl.saldo,
                      obscureText: ctrl.isObscureText,
                      readOnly: false,
                      onTap: () {
                        ctrl.isObscureText == true
                            ? ctrl.updateIsObscureText(false)
                            : ctrl.updateIsObscureText(true);
                      },
                      assetIcon: ctrl.isObscureText == true
                          ? AppConst.assetEyeVisibilityOff
                          : AppConst.assetEyeVisibility,
                    ),
                  ],
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Tentukan promo menarik',
                      style: MontserratFont.style14SemiBold(
                          textColor: AppStyle.black)),
                  const SizedBox(
                    height: 10,
                  ),
                  _services(context),
                  _banner(context),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget _services(BuildContext context) {
  return GetBuilder<HomeController>(builder: (ctrl) {
    final services = ctrl.services;
    final double width = MediaQuery.of(context).size.width;

    var count = services?.data?.length ?? 0;
    const itemsPerRow = 6;
    const ratio = 1 / 1.4;
    const horizontalPadding = 0.0;
    final calcHeight = ((width / itemsPerRow) - (horizontalPadding)) *
        (count / itemsPerRow).ceil() *
        (1 / ratio);

    if (ctrl.servicesState is ServicesSuccess) {
      return SizedBox(
        width: width,
        height: calcHeight,
        child: GridView.builder(
          itemCount: count,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 10,
              crossAxisSpacing: 0,
              crossAxisCount: itemsPerRow,
              childAspectRatio: ratio),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.network(services?.data?[index].serviceIcon ?? ''),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  services?.data?[index].serviceCode ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:
                      MontserratFont.style7SemiBold(textColor: AppStyle.black),
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      );
    }

    if (ctrl.servicesState is ServicesLoading) {
      return SizedBox(
        width: width,
        height: 180,
        child: GridView.builder(
          itemCount: 12,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 30,
              crossAxisSpacing: 10,
              crossAxisCount: itemsPerRow,
              childAspectRatio: ratio),
          itemBuilder: (context, index) {
            return Column(
              children: [
                AppShimmer(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    height: 70,
                  ),
                ),
              ],
            );
          },
        ),
      );
    }

    return const SizedBox();
  });
}

Widget _banner(BuildContext context) {
  return GetBuilder<HomeController>(builder: (ctrl) {
    final banner = ctrl.banner;

    if (ctrl.bannerState is BannerSuccess) {
      List<Widget> res = [];
      if (banner!.data!.isNotEmpty) {
        res.add(CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            height: 200.0,
            onPageChanged: (index, reason) {
              ctrl.changeIndexCarrousel(index);
            },
          ),
          carouselController: ctrl.carouselController,
          items: banner.data?.map((idx) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: WidgetBanner(
                    name: idx.bannerName,
                    image: idx.bannerImage,
                    description: idx.description,
                  ),
                );
              },
            );
          }).toList(),
        ));
        res.add(Obx(() => AnimatedSmoothIndicator(
              activeIndex: ctrl.current.value,
              count: banner.data!.length,
              effect: const ScrollingDotsEffect(
                dotWidth: 22.0,
                dotHeight: 8.0,
                activeDotColor: AppStyle.lightGrey,
                dotColor: AppStyle.lightGrey,
              ),
            )));
      }

      return Column(mainAxisAlignment: MainAxisAlignment.center, children: res);
    }

    if (ctrl.bannerState is BannerLoading) {
      return const BannerShimmer();
    }

    return const SizedBox();
  });
}
