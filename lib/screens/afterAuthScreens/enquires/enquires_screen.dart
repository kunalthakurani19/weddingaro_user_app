// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
// import 'package:provider/provider.dart';
// import 'package:wedding_planner_app/data/response/status.dart';
// import 'package:wedding_planner_app/res/color.dart';
// import 'package:wedding_planner_app/res/common_components/common_appbar.dart';
// import 'package:wedding_planner_app/res/common_components/navigation_drawer_component.dart';
// import 'package:wedding_planner_app/res/common_components/nothing_message_component.dart';
// import 'package:wedding_planner_app/res/common_components/watext.dart';
// import 'package:wedding_planner_app/res/common_components/watextformfeild.dart';
// import 'package:wedding_planner_app/res/img_res.dart';
// import 'package:wedding_planner_app/screens/afterAuthScreens/enquires/enquire_of_each_store.dart';
// import 'package:wedding_planner_app/screens/home_screen.dart';
// import 'package:wedding_planner_app/utils/routes/routes_name.dart';
// import 'package:wedding_planner_app/view_model/enquires_view_model.dart';

// class EnquiresScreen extends StatefulWidget {
//   const EnquiresScreen({super.key});

//   @override
//   State<EnquiresScreen> createState() => _EnquiresScreenState();
// }

// class _EnquiresScreenState extends State<EnquiresScreen> {
//   EnquiryViewModel enquiryViewModel = EnquiryViewModel();
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     enquiryViewModel.fetchEnquires();
//     super.initState();
//   }

//   Future<void> _refreshEnquires() async {
//     await enquiryViewModel.fetchEnquires();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: _refreshEnquires,
//       child: Scaffold(
//         appBar: const CommonAppBar(),
//         drawer: const NavigatorDrawerComponent(),
//         body: SingleChildScrollView(
//           physics: const AlwaysScrollableScrollPhysics(),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: WATextFormField(
//                     onChanged: (value) {
//                       setState(() {});
//                     },
//                     validator: (value) {
//                       return null;
//                     },
//                     controller: _searchController,
//                     hintText: "Search Stores for Enquires"),
//               ),
//               const HeadingText(
//                 heading: 'Inbox',
//               ),
//               ChangeNotifierProvider<EnquiryViewModel>(
//                 create: (BuildContext context) => enquiryViewModel,
//                 child: Consumer<EnquiryViewModel>(builder: (context, value, _) {
//                   switch (value.enquiryList.status!) {
//                     case Status.loading:
//                       return const Center(child: CircularProgressIndicator());
//                     case Status.error:
//                       return Text(value.enquiryList.message.toString());
//                     case Status.completed:
//                       final requests = value.enquiryList.data?.requests;
//                       if (requests == null || requests.isEmpty) {
//                         return const NothingMessageComponent(
//                           message: "You do not have any enquiries ",
//                           imgUrl: ImageRes.messengerIcon,
//                         );
//                       }

//                       // Filter stores based on search query
//                       final filteredStores = requests.where((request) {
//                         final query = _searchController.text.toLowerCase();
//                         return request.store!.businessdetails!.businessName!
//                             .toLowerCase()
//                             .contains(query);
//                       }).toList();
//                       if (filteredStores.isEmpty) {
//                         return const Center(child: Text("No Enquires found"));
//                       }
//                       return Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 15, vertical: 15),
//                             child: Column(
//                               children: [
//                                 // main content
//                                 Row(
//                                   children: [
//                                     WaText(
//                                       "${filteredStores.length} stores",
//                                       textcolor:
//                                           AppColors.blackColor.withOpacity(0.5),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           ListView.separated(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount: filteredStores.length,
//                             separatorBuilder: (BuildContext context,
//                                     int index) =>
//                                 const SizedBox(height: 8), // Adjust as needed
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                     horizontal: 8, vertical: 4),
//                                 child: InkWell(
//                                   onTap: () {
//                                     pushNewScreenWithRouteSettings(
//                                       context,
//                                       settings: const RouteSettings(
//                                           name: RoutesName.enquireOfEachStore),
//                                       screen: EnquryOfEachStore(
//                                           requests:
//                                               filteredStores[index].request!),
//                                       pageTransitionAnimation:
//                                           PageTransitionAnimation.cupertino,
//                                     );
//                                   },
//                                   child: Card(
//                                     child: ListTile(
//                                       title: WaText(
//                                         filteredStores[index]
//                                             .store
//                                             ?.businessdetails!
//                                             .businessName!,
//                                         fontsize: 17,
//                                         textAlignment: Alignment.centerLeft,
//                                       ),
//                                       subtitle: Column(
//                                         children: [
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.phone,
//                                                 size: 13,
//                                                 color: AppColors.darkRed,
//                                               ),
//                                               SizedBox(
//                                                 width: 2.w,
//                                               ),
//                                               WaText(
//                                                 filteredStores[index]
//                                                         .store
//                                                         ?.businessdetails
//                                                         ?.mobile ??
//                                                     'mobile is not provided',
//                                                 fontsize: 12,
//                                                 textAlignment:
//                                                     Alignment.centerLeft,
//                                                 maxCharactersToShow: 30,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 0.2.h,
//                                           ),
//                                           Row(
//                                             children: [
//                                               const Icon(
//                                                 Icons.email,
//                                                 size: 13,
//                                                 color: AppColors.darkRed,
//                                               ),
//                                               SizedBox(
//                                                 width: 2.w,
//                                               ),
//                                               WaText(
//                                                 filteredStores[index]
//                                                         .store
//                                                         ?.businessdetails
//                                                         ?.email ??
//                                                     'email is not provided',
//                                                 fontsize: 12,
//                                                 textAlignment:
//                                                     Alignment.centerLeft,
//                                                 maxCharactersToShow: 30,
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 0.2.h,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ],
//                       );
//                   }
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


// // future used UI

//             // const NothingMessageComponent(
//             //   message: "No Message have been Found in this Folder",
//             //   imgUrl: ImageRes.messengerIcon,
//             // ),
//             // const DividerComponent(),

//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: [
//             //     const Icon(Icons.arrow_upward_rounded),
//             //     SizedBox(
//             //       width: 1.h,
//             //     ),
//             //     WaText(
//             //       "Go back up",
//             //       textcolor: AppColors.blackColor.withOpacity(0.5),
//             //     ),
//             //   ],
//             // )
