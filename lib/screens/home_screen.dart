import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:weddingaro_user_app/resources/common_components/divider.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/screens/afterAuthScreens/main_screen.dart';
import 'package:weddingaro_user_app/screens/commonscreens/checklist_screen.dart';
import 'package:weddingaro_user_app/screens/commonscreens/guest_screen.dart';
import 'package:weddingaro_user_app/screens/commonscreens/vendortab/vendor_screens.dart';

import '../resources/color.dart';
import '../resources/common_components/common_appbar.dart';
import '../resources/common_components/navigation_drawer_component.dart';
import '../resources/common_components/text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      drawer: const NavigatorDrawerComponent(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    height: MediaQuery.of(context).size.height * 0.30,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WaText(
                        'A.',
                        fontsize: 24.dp,
                        baskerville: true,
                        textcolor: AppColors.whiteColor,
                        // textAlignment: Alignment.centerLeft,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      WAButton('Upload photo',
                          buttonColor: AppColors.transparent, borderColor: AppColors.whiteColor, width: 45.w),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _buildCard(
                            icon: Icons.storefront_outlined,
                            title: "Vendors",
                            subTitle: "0 of 19",
                            contentScreen: const VendorScreen()),
                        _buildCard(
                            icon: Icons.checklist_outlined,
                            title: "Checklist",
                            subTitle: "0 of 19",
                            contentScreen: const CheckListScreen()),
                        _buildCard(
                            icon: Icons.groups_2_outlined,
                            title: "Guest",
                            subTitle: "0 of 19",
                            contentScreen: const GuestScreen()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const DividerComponent(),
            const HeadingText(heading: 'Vendor Manager'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        addCard(title: 'Venues'),
                        addCard(title: 'Photography and video'),
                        addCard(title: 'Cateres'),
                        addCard(title: 'Wedding planners')
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            const TextWithAroow(
              heading: 'View All Vendors',
              textAlignment: Alignment.center,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.h,
            ),
            const DividerComponent(),
            const HeadingText(heading: 'Upcoming Task'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                children: [
                  const HeadingText(
                    heading: '2 of 110 task completed ',
                    fontsize: 15,
                    isline: false,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  LinearPercentIndicator(
                    // width: 140.0,
                    lineHeight: 9.0,
                    percent: 0.4,
                    barRadius: const Radius.circular(10),
                    backgroundColor: Colors.grey,
                    progressColor: AppColors.supergreen,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        upcomingTask(title: 'To-Dos Done', percentage: 0.4),
                        SizedBox(
                          height: 2.h,
                        ),
                        upcomingTask(title: 'Guest Lists', percentage: 0.6),
                        SizedBox(
                          height: 2.h,
                        ),
                        upcomingTask(title: 'Wedding vendors', percentage: 0.8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const DividerComponent(),
            const HeadingText(
              heading: 'Guest List ',
              isline: false,
            ),
            NormalText(
              text: 'Your Guest Overview',
              color: AppColors.blackColor50,
              fontsize: 13,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: guestwidgetContainer(icon: Icons.groups, title: 'Guests', value: 10),
                      ),
                      Flexible(
                        flex: 2,
                        child: guestwidgetContainer(icon: Icons.done, title: 'Attending', value: 10),
                      ),
                      Flexible(
                        flex: 2,
                        child: guestwidgetContainer(icon: Icons.pending, title: 'Pending', value: 10),
                      )
                    ],
                  ),
                  WAButton(
                    "Add Guest",
                    fontsize: 15,
                    height: 5.h,
                    onPressed: () {
                      (context as Element).findAncestorStateOfType<MainScreenState>()?.controller.jumpToTab(3);
                    },
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
            const DividerComponent(),
            const HeadingText(
              heading: 'CheckList',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  checkListWidget(title: 'Gather My vendor for Visit'),
                  checkListWidget(title: 'Check Invitations and Designs'),
                  checkListWidget(title: 'Follow up with the unconfirmed guests through weddingaro guest list tool'),
                  WAButton(
                    "See All CheckList",
                    height: 5.h,
                    fontsize: 15,
                    onPressed: () {
                      (context as Element).findAncestorStateOfType<MainScreenState>()?.controller.jumpToTab(2);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({required IconData icon, required String title, required String subTitle, required Widget contentScreen}) {
    return InkWell(
      onTap: () {
        // Add your onTap functionality here
        pushNewScreen(
          context,
          screen: contentScreen,
          pageTransitionAnimation: PageTransitionAnimation.sizeUp,
        );
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(minWidth: 130),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon),
                SizedBox(
                  height: 1.h, // Assuming this is a custom height unit
                ),
                WaText(title),
                WaText(
                  subTitle,
                  textcolor: AppColors.blackColor50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addCard({
    String? title,
  }) {
    return InkWell(
      onTap: () {
        // Add your onTap functionality here
      },
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 130, minHeight: 90),
            child: Card(
              elevation: 2,
              color: AppColors.blackColor50.withOpacity(0.3),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.add_outlined)],
                ),
              ),
            ),
          ),
          NormalText(
            text: title ?? '',
            fontsize: 13,
            textAlignment: Alignment.center,
          )
        ],
      ),
    );
  }

  Widget upcomingTask({
    // IconData? icon,
    String? title,
    double? percentage,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HeadingText(
                      heading: title ?? '',
                      fontsize: 15,
                      horizontalPadding: 0,
                    ),
                    const Spacer(),
                    NormalText(text: percentage.toString()),
                  ],
                ),
              ),
              LinearPercentIndicator(
                // width: 140.0,
                lineHeight: 9.0,
                percent: percentage ?? 0.0,
                barRadius: const Radius.circular(10),
                backgroundColor: Colors.grey,
                progressColor: AppColors.darkRed,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget guestwidgetContainer({
    IconData? icon,
    String? title,
    int? value,
  }) {
    return SizedBox(
      width: 100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icon),
                    const Spacer(),
                    NormalText(
                      text: value.toString(),
                      textAlignment: Alignment.center,
                      fontsize: 14,
                    ),
                  ],
                ),
                NormalText(
                  text: title ?? '',
                  textAlignment: Alignment.center,
                  fontsize: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget checkListWidget({required String title}) {
    return Column(
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done_all_outlined,
              color: AppColors.blackColor50,
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
                child: WaText(
              title,
              fontsize: 15,
              textAlignment: Alignment.centerLeft,
            )),
          ],
        ),
        const Divider()
      ],
    );
  }
}
