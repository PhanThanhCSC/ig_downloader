import 'package:base_project_getx/core/base/base_view.dart';
import 'package:base_project_getx/core/values/app_colors.dart';
import 'package:base_project_getx/core/values/styles.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../../core/base/mixin_base_page.dart';
import 'home_controller.dart';

class HomePage extends BaseView<HomeController> with BasePage {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    // TODO: implement body
    return Container(
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/home/bg_home.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 78,
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: _navigationBar(),
          ),
          SizedBox(height: 12,),
          Expanded(
              child: Stack(
                children: [
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 40,
                          height: 130,
                          padding: const EdgeInsets.fromLTRB(10, 11, 10, 8),
                          decoration: const BoxDecoration(
                            color: AppColors.bgBannerVionet,
                            borderRadius: BorderRadius.all(Radius.circular(20),),
                          ),
                          child: DottedBorder(
                            radius: Radius.circular(20),
                            color:AppColors.dottedColor,
                            strokeWidth: 1,
                            child: Container(),
                          ),
                        ),
                        SizedBox(height: 24,),
                        const Text('Instagram Story Downloader', style: Styles.styleTextKanitBigWhiteColor,),
                      ],
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      padding: EdgeInsets.fromLTRB(18, 8, 18, 52),
                      decoration: const BoxDecoration(
                        color: AppColors.bgAppColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32),
                        ),
                      ),
                      child: _textFieldDownload(),
                    ),
                  )
                ],
              )),
        ],
      ),)
    );
  }

  Widget _navigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: AppColors.bgButtonVionet,
            borderRadius: BorderRadius.circular(22),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
                height: 24, width: 24, "images/home/ic_history.png"),
          ),
        ),
        Image.asset(height: 78, width: 194, 'images/home/img_title.png'),
        Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: AppColors.bgButtonVionet,
            borderRadius: BorderRadius.circular(22),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
                height: 24, width: 24, "images/home/ic_history.png"),
          ),
        )
      ],
    );
  }

  Widget _textFieldDownload() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                child: TextField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: AppColors.borderTextFieldColor, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                          color: AppColors.borderTextFieldColor, width: 0.5),
                    ),
                    hintText: 'Past URL here',
                    hintStyle: Styles.styleTextSoraRegularGrayColor,
                  ),
                  controller: controller.textDownloadController,
                  style: Styles.styleTextSoraRegularDarkColor,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent)),
          child: Container(
              padding: EdgeInsets.fromLTRB(40,11, 40, 13),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/home/bg_button_download.png'),
                    fit: BoxFit.fill),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Download",
                    style: Styles.styleTextKanitMediumWhiteColor,
                  ),
                  Image.asset("images/home/ic_down.png",
                    width: 20,
                    height: 20,
                  ),
                ],
              )),
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          'IG reel is a short video format, you want to download instagram reel to watch later but the platform does not support that. We built igsnap.app to make it easy for you to save insta reel to your device.',
          textAlign: TextAlign.center,
          style: Styles.styleTextSoraRegularVioletColor,
        )
      ],
    );
  }

  Widget _carouselSlider(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: (MediaQuery.of(context).size.width/3) * (246 / 150) ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width/3,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.white70),
                child: Stack(
                  children: [
                    Image.asset('images/home/img_item_home_select.png')
                  ],
                ),
            );
          },
        );
      }).toList(),
    );
  }
}
