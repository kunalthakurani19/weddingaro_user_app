// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';


// class SmallGridView extends StatelessWidget {
//   const SmallGridView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // Set the default number of columns to 3.
//     int columnsCount = 2;

//     // Define the icon size based on the screen width

//     // Use the ResponsiveUtils class to determine the device's screen size.
//     if (ResponsiveWidget.isSmallScreen(context)) {
//       columnsCount = 2;
//     } else if (ResponsiveWidget.isLargeScreen(context)) {
//       columnsCount = 4;
//     }

//     // Build the grid view using the number of columns.
//     return GridView.builder(
//       // Set padding and spacing between cards.
//       padding: const EdgeInsets.all(10),
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         // Set the number of columns based on the device's screen size.
//         crossAxisCount: columnsCount,
//         // Set the aspect ratio of each card.
//         childAspectRatio: 1,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       // Set the number of items in the grid view.
//       itemCount: 1,
//       // Set the grid view to shrink wrap its contents.
//       shrinkWrap: true,
//       // Disable scrolling in the grid view.
//       physics: const NeverScrollableScrollPhysics(),
//       itemBuilder: (BuildContext context, int index) {
//         // Build each card in the grid view.
//         index += 10;

//         return GridView.builder(
//           shrinkWrap:
//               true, // Important: Use shrinkWrap to make it work inside ListView
//           physics:
//               const NeverScrollableScrollPhysics(), // Disable GridView scrolling
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: columnsCount,
//             crossAxisSpacing: 15.0,
//             mainAxisSpacing: 8.0,

//             // childAspectRatio: 3 / 2,
//           ),
//           itemCount: 4,
//           itemBuilder: (BuildContext context, int index) {
//             return InkWell(
//               onTap: () => Navigator.pushNamed(context, RoutesName.createStore),
//               child: Container(
//                   decoration: BoxDecoration(
//                     border: Border.all(
//                         color: Colors.black.withOpacity(0.1),
//                         width: 2.0,
//                         style: BorderStyle.solid), //Border.all

//                     borderRadius: BorderRadius.circular(8),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.grey.withOpacity(0.5),
//                         offset: const Offset(
//                           5.0,
//                           5.0,
//                         ),
//                         blurRadius: 8.0,
//                         // spreadRadius: 1.0,
//                       ),
//                       const BoxShadow(
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // SizedBox(
//                       //   height: .h,
//                       // ),
//                       Row(
//                         // crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             ImageRes.phoneIcon,
//                             height: 35,
//                             width: 35,
//                           ),
//                           SizedBox(
//                             width: 1.w,
//                           ),
//                           WaText(
//                             "10",
//                             fontsize: 25.dp,
//                             // textAlignment: Alignment.center,
//                             fontWeight: FontWeight.w400,
//                             // textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 2.h,
//                       ),
//                       WaText(
//                         "Analytics",
//                         fontsize: 15.dp,
//                         // textAlignment: Alignment.,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ],
//                   )),
//             );
//           },
//         );
//       },
//     );
//   }
// }


//   // GridView.builder(
//   //                     shrinkWrap:
//   //                         true, // Important: Use shrinkWrap to make it work inside ListView
//   //                     physics:
//   //                         const NeverScrollableScrollPhysics(), // Disable GridView scrolling
//   //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   //                       crossAxisCount: crossAxisCount,
//   //                       crossAxisSpacing: 15.0,
//   //                       mainAxisSpacing: 8.0,

//   //                       // childAspectRatio: 3 / 2,
//   //                     ),
//   //                     itemCount: 4,
//   //                     itemBuilder: (BuildContext context, int index) {
//   //                       return InkWell(
//   //                         onTap: () => Navigator.pushNamed(
//   //                             context, RoutesName.createStore),
//   //                         child: Container(
//   //                             decoration: BoxDecoration(
//   //                               border: Border.all(
//   //                                   color: Colors.black.withOpacity(0.1),
//   //                                   width: 2.0,
//   //                                   style: BorderStyle.solid), //Border.all

//   //                               borderRadius: BorderRadius.circular(8),
//   //                               boxShadow: [
//   //                                 BoxShadow(
//   //                                   color: Colors.grey.withOpacity(0.5),
//   //                                   offset: const Offset(
//   //                                     5.0,
//   //                                     5.0,
//   //                                   ),
//   //                                   blurRadius: 8.0,
//   //                                   // spreadRadius: 1.0,
//   //                                 ),
//   //                                 const BoxShadow(
//   //                                   color: Colors.white,
//   //                                 ),
//   //                               ],
//   //                             ),
//   //                             child: Column(
//   //                               crossAxisAlignment: CrossAxisAlignment.center,
//   //                               mainAxisAlignment: MainAxisAlignment.center,
//   //                               children: [
//   //                                 // SizedBox(
//   //                                 //   height: .h,
//   //                                 // ),
//   //                                 Row(
//   //                                   // crossAxisAlignment: CrossAxisAlignment.center,
//   //                                   mainAxisAlignment: MainAxisAlignment.center,
//   //                                   crossAxisAlignment:
//   //                                       CrossAxisAlignment.center,
//   //                                   children: [
//   //                                     Image.asset(
//   //                                       ImageRes.phoneIcon,
//   //                                       height: 35,
//   //                                       width: 35,
//   //                                     ),
//   //                                     SizedBox(
//   //                                       width: 1.w,
//   //                                     ),
//   //                                     WaText(
//   //                                       "10",
//   //                                       fontsize: 25.dp,
//   //                                       // textAlignment: Alignment.center,
//   //                                       fontWeight: FontWeight.w400,
//   //                                       // textAlign: TextAlign.center,
//   //                                     ),
//   //                                   ],
//   //                                 ),
//   //                                 SizedBox(
//   //                                   height: 2.h,
//   //                                 ),
//   //                                 WaText(
//   //                                   "Analytics",
//   //                                   fontsize: 15.dp,
//   //                                   // textAlignment: Alignment.,
//   //                                   fontWeight: FontWeight.w400,
//   //                                 ),
//   //                               ],
//   //                             )),
//   //                       );
//   //                     },
//   //                   ),
                 