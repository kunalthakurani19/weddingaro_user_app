import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weddingaro_user_app/resources/common_components/common_appbar.dart';
import 'package:weddingaro_user_app/resources/common_components/navigation_drawer_component.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/common_components/watextformfeild.dart';

import '../../../resources/color.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({super.key});

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
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
                      Text('Group'),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Menu'),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: WAButton(
                                      'Guest',
                                      height: 4.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  Expanded(
                                    child: WAButton(
                                      'Group',
                                      height: 4.h,
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        guestGroup("hello", "guest"),
                        guestGroup("Patner family", "4 guest"),
                        guestGroup("Mutaul Friends", "no guest"),
                        guestGroup("college friends", "6 guest"),
                        guestGroup("Family ", "10 guest"),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: WAButton(
                                      'Menu',
                                      height: 4.h,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3.w,
                                  ),
                                  const Spacer(),
                                ],
                              )
                            ],
                          ),
                        ),
                        const Divider(),
                        guestGroup("hello", "guest"),
                        guestGroup("Patner family", "4 guest"),
                        guestGroup("Mutaul Friends", "no guest"),
                        guestGroup("college friends", "6 guest"),
                        guestGroup("Family ", "10 guest"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget guestGroup(String title, String guestCount) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                useSafeArea: true,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(children: [
                        const WaText(
                          "Group Name",
                          fontWeight: FontWeight.bold,
                          textAlignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        WATextFormField(
                          controller: TextEditingController(),
                          hintText: "Name of Guest",
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        const WAButton("Save")
                      ]),
                    ),
                  );
                });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.group_outlined,
                  color: AppColors.blackColor50,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Expanded(
                    child: Column(
                  children: [
                    WaText(
                      title,
                      fontsize: 15,
                      textAlignment: Alignment.centerLeft,
                    ),
                    WaText(
                      guestCount,
                      fontsize: 15,
                      textAlignment: Alignment.centerLeft,
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
