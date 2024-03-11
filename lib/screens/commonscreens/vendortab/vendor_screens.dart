import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:weddingaro_user_app/resources/common_components/banner_component.dart';
import 'package:weddingaro_user_app/resources/common_components/common_appbar.dart';
import 'package:weddingaro_user_app/resources/common_components/custom_bottomsheet.dart';
import 'package:weddingaro_user_app/resources/common_components/divider.dart';
import 'package:weddingaro_user_app/resources/common_components/navigation_drawer_component.dart';
import 'package:weddingaro_user_app/resources/common_components/text.dart';
import 'package:weddingaro_user_app/resources/common_components/venue_card_component.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/screens/commonscreens/vendortab/vendor_search_screen.dart';
import 'package:weddingaro_user_app/utils/routes/routes_name.dart';

import '../../../resources/color.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key});

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Wedding Vendors'),
      drawer: const NavigatorDrawerComponent(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TabBar(
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Discover'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Favroites'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              BannerComponent(
                                  title: 'Find Your Vendor',
                                  description: 'All the Wedding Services You need in one place',
                                  color: AppColors.lighCream),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [],
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        const DividerComponent(),
                        const HeadingText(
                          heading: 'See Venue Collections',
                          isline: false,
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        venueCollectionCard(),
                        SizedBox(
                          height: 2.h,
                        ),
                        const DividerComponent(),
                        const HeadingText(
                          heading: 'Our Venues',
                          isline: false,
                        ),
                        const SizedBox(height: 370, child: VenueCardComponent()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WAButton(
                            'Explore the venues',
                            onPressed: () {
                              // Use the CustomBottomSheet to show a bottom sheet
                              pushNewScreenWithRouteSettings(
                                context,
                                settings: const RouteSettings(name: RoutesName.login),
                                screen: const VendorSearchScreen(),
                                pageTransitionAnimation: PageTransitionAnimation.sizeUp,
                              );
                            },
                          ),
                        ),
                        const DividerComponent(),
                        const HeadingText(
                          heading: 'Our Vendors',
                          isline: false,
                        ),
                        const SizedBox(height: 370, child: VenueCardComponent()),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WAButton(
                            'Explore winner in your area',
                            onPressed: () {
                              // Use the CustomBottomSheet to show a bottom sheet
                              CustomBottomSheet.show(
                                context,
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('This is some content'),
                                    SizedBox(height: 8.0),
                                    Text('You can add any widgets here'),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Center(
                    child: Text("comming soon"),
                  )
                ],
              ),
            ),
          ],
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
            child: CircleAvatar(
              backgroundColor: AppColors.blackColor50.withOpacity(0.3),
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

  Widget venueCollectionCard({
    String? title,
  }) {
    return SizedBox(
      height: 200,
      child: InkWell(
        onTap: () {
          // Add your onTap functionality here
          pushNewScreenWithRouteSettings(
            context,
            settings: const RouteSettings(name: RoutesName.login),
            screen: const VendorSearchScreen(),
            pageTransitionAnimation: PageTransitionAnimation.sizeUp,
          );
        },
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10, // Change this to the number of cards you want
          itemBuilder: (context, index) {
            return SizedBox(
              width: MediaQuery.of(context).size.width * 0.4, // Adjust the width as needed
              child: Card(
                elevation: 4.0,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4, // Adjust the height as needed
                  child: Stack(
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
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const Positioned(
                          bottom: 10,
                          left: 10,
                          child: WaText(
                            'FarmHouses',
                            textcolor: AppColors.whiteColor,
                            // fontWeight: FontWeight.bold,
                            maxCharactersToShow: 15,
                            baskerville: true,
                            fontsize: 15,
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
