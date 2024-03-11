// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';
// import 'package:intl/intl.dart';
// import 'package:wedding_planner_app/model/response/enquires_model.dart';
// import 'package:wedding_planner_app/res/color.dart';
// import 'package:wedding_planner_app/res/common_components/common_appbar.dart';
// import 'package:wedding_planner_app/res/common_components/watext.dart';

// class EnquryOfEachStore extends StatelessWidget {
//   final List<Request> requests;

//   const EnquryOfEachStore({Key? key, required this.requests}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CommonAppBar(),
//       body: ListView.builder(
//         itemCount: requests.length,
//         itemBuilder: (context, index) {
//           final request = requests[index];
//           return Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             child: Card(
//               child: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.8,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Add your card content here
//                     ListTile(
//                       title: Text(request.name!),
//                       subtitle: WaText(
//                         request.email!,
//                         textcolor: AppColors.blackColor50,
//                         textAlignment: Alignment.centerLeft,
//                         fontsize: 13,
//                       ),
//                       leading: const CircleAvatar(
//                         backgroundImage: NetworkImage(
//                             'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 8),
//                       child: Column(
//                         children: [
//                           WaText(
//                             request.message!,
//                             textcolor: AppColors.blackColor.withOpacity(0.7),
//                             textAlignment: Alignment.centerLeft,
//                             fontsize: 13,
//                           ),
//                           SizedBox(height: 2.h),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.groups,
//                                 color: AppColors.blackColor.withOpacity(0.7),
//                               ),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               WaText(
//                                 '0 - ${request.totalguest} Guests',
//                                 textcolor:
//                                     AppColors.blackColor.withOpacity(0.7),
//                                 textAlignment: Alignment.centerLeft,
//                                 fontsize: 13,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 1.h,
//                           ),
//                           Row(
//                             children: [
//                               Icon(
//                                 Icons.calendar_month,
//                                 color: AppColors.blackColor.withOpacity(0.7),
//                               ),
//                               SizedBox(
//                                 width: 4.w,
//                               ),
//                               WaText(
//                                 DateFormat('d MMMM yyyy')
//                                     .format(DateTime.parse(request.evendate!)),
//                                 textcolor:
//                                     AppColors.blackColor.withOpacity(0.7),
//                                 textAlignment: Alignment.centerLeft,
//                                 fontsize: 13,
//                               ),
//                               // const Spacer(),
//                               // Expanded(
//                               //   child: WAButton(
//                               //     "Reply",
//                               //     height: 4.h,
//                               //     fontsize: 11,
//                               //     // width: 100,
//                               //     onPressed: () =>
//                               //         Navigator.pushNamed(context,
//                               //             RoutesName.createStore),
//                               //   ),
//                               // ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),

//                     // Additional widgets if needed
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
