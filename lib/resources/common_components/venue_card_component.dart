import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:weddingaro_user_app/resources/common_components/favroute_screen_component.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/common_components/watextformfeild.dart';
import 'package:weddingaro_user_app/screens/commonscreens/vendortab/venue_detail_screen.dart';

import '../color.dart';

class VenueCardComponent extends StatelessWidget {
  const VenueCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10, // Change this to the number of cards you want
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7, // Adjust the width as needed
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.darken,
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                            ).createShader(bounds);
                          },
                          child: Image.network(
                            'https://weddingaro.s3.ap-south-1.amazonaws.com/side-images/wedding-banner.png',
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.20,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [FavoriteIconComponent()],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                const WaText(
                                  "The Grand Ambience by baba",
                                  baskerville: true,
                                  fontsize: 20,
                                  maxLines: 2,
                                  fontWeight: FontWeight.bold,
                                  textAlignment: Alignment.centerLeft,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: AppColors.yellow,
                                    ),
                                    const WaText(
                                      "5.0",
                                      fontsize: 13,
                                      fontWeight: FontWeight.bold,
                                      textAlignment: Alignment.centerLeft,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    const WaText(
                                      "New Industrial i dont' know the address",
                                      baskerville: true,
                                      fontsize: 13,
                                      maxCharactersToShow: 24,
                                      fontWeight: FontWeight.bold,
                                      textAlignment: Alignment.centerLeft,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                eachRowWidget(icon: Icons.dining_outlined, rupess: '1,500'),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.people_alt_outlined),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    const WaText(
                                      "100",
                                      fontsize: 13,
                                      textAlignment: Alignment.centerLeft,
                                      // textcolor: AppColors.blackColor50,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    const WaText(
                                      "to",
                                      fontsize: 13,
                                      textAlignment: Alignment.centerLeft,
                                      // textcolor: AppColors.blackColor50,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    const WaText(
                                      "₹ 2,000",
                                      fontsize: 13,
                                      textAlignment: Alignment.centerLeft,
                                      // textcolor: AppColors.blackColor50,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget eachRowWidget({
    required IconData icon,
    required String rupess,
  }) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 2.w,
        ),
        const WaText(
          "From",
          fontsize: 13,
          textAlignment: Alignment.centerLeft,
          // textcolor: AppColors.blackColor50,
        ),
        SizedBox(
          width: 2.w,
        ),
        WaText(
          "₹ $rupess",
          fontsize: 13,
          textAlignment: Alignment.centerLeft,
          // textcolor: AppColors.blackColor50,
        ),
      ],
    );
  }
}

class VenueCardInDetailComponent extends StatelessWidget {
  const VenueCardInDetailComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      // scrollDirection: Axis.vertical,
      itemCount: 10, // Change this to the number of cards you want
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              pushNewScreenWithRouteSettings(
                context,
                settings: const RouteSettings(name: ''),
                screen: const VenueDetailScreen(),
                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
              );
            },
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.5, // Adjust the height as needed
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        ShaderMask(
                          blendMode: BlendMode.darken,
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                            ).createShader(bounds);
                          },
                          child: Image.network(
                            'https://weddingaro.s3.ap-south-1.amazonaws.com/side-images/wedding-banner.png',
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const Positioned(
                          top: 10,
                          right: 10,
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [FavoriteIconComponent()],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                const WaText(
                                  "The Grand Ambience by baba",
                                  baskerville: true,
                                  fontsize: 15,
                                  maxCharactersToShow: 25,
                                  fontWeight: FontWeight.bold,
                                  textAlignment: Alignment.centerLeft,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                WaText('Indore , Madhya Pradesh',
                                    fontsize: 13, textcolor: AppColors.blackColor50, textAlignment: Alignment.centerLeft),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Expanded(
                                  child: WaText(
                                      'The Grand Ambience by baba is a nice hotel is a preminim banquest hall located near main road in indore. A wedding venue is a tremedous',
                                      fontsize: 15,
                                      textcolor: AppColors.blackColor50,
                                      maxLines: 3,
                                      textAlignment: Alignment.centerLeft),
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(child: eachRowWidget(icon: Icons.dining_outlined, rupess: '1,500')),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          const Icon(Icons.people_alt_outlined),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          const WaText(
                                            "100",
                                            fontsize: 13,
                                            textAlignment: Alignment.centerLeft,
                                            // textcolor: AppColors.blackColor50,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          const WaText(
                                            "to",
                                            fontsize: 13,
                                            textAlignment: Alignment.centerLeft,
                                            // textcolor: AppColors.blackColor50,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          const WaText(
                                            "₹ 2,000",
                                            fontsize: 13,
                                            textAlignment: Alignment.centerLeft,
                                            // textcolor: AppColors.blackColor50,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                WAButton(
                                  'Request Pricing',
                                  height: 4.h,
                                  fontsize: 13,
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        useSafeArea: true,
                                        builder: (BuildContext context) {
                                          return SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.all(12.0),
                                              child: Column(children: [
                                                const WaText(
                                                  "Request Pricing",
                                                  fontWeight: FontWeight.bold,
                                                  textAlignment: Alignment.centerLeft,
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),
                                                WATextFormField(
                                                  controller: TextEditingController(),
                                                  maxlines: 2,
                                                  hintText:
                                                      "Hi we  love to learan more about your venue kindle share your contact",
                                                ),
                                                WATextFormField(
                                                  controller: TextEditingController(),
                                                  hintText: "Name and Surname",
                                                ),
                                                WATextFormField(
                                                  controller: TextEditingController(),
                                                  hintText: "Email",
                                                ),
                                                WATextFormField(
                                                  controller: TextEditingController(),
                                                  hintText: "Mobile number",
                                                ),
                                                WATextFormField(
                                                  controller: TextEditingController(),
                                                  hintText: "Event date",
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                const WAButton("Send")
                                              ]),
                                            ),
                                          );
                                        });
                                  },
                                )
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget eachRowWidget({
    required IconData icon,
    required String rupess,
  }) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 2.w,
        ),
        const WaText(
          "From",
          fontsize: 13,
          textAlignment: Alignment.centerLeft,
          // textcolor: AppColors.blackColor50,
        ),
        SizedBox(
          width: 2.w,
        ),
        WaText(
          "₹ $rupess",
          fontsize: 13,
          textAlignment: Alignment.centerLeft,
          // textcolor: AppColors.blackColor50,
        ),
      ],
    );
  }
}
