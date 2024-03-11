// import 'package:flutter/material.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';

// class GridViewComponent extends StatelessWidget {
//   const GridViewComponent({Key? key, this.itemCount, this.imageContainer, this.onPressedDelete, this.indexcount})
//       : super(key: key);
//   final int? itemCount;
//   final int? indexcount;
//   final Widget? imageContainer;
//   final void Function()? onPressedDelete;
//   @override
//   Widget build(BuildContext context) {
//     // Set the default number of columns to 3.
//     int columnsCount = 2;

//     // Use the ResponsiveUtils class to determine the device's screen size.
//     if (ResponsiveWidget.isSmallScreen(context)) {
//       columnsCount = 2;
//     } else if (ResponsiveWidget.isLargeScreen(context)) {
//       columnsCount = 4;
//     }

//     // Build the grid view using the number of columns.
//     return SingleChildScrollView(
//       child: GridView.builder(
//         // Set padding and spacing between cards.
//         padding: const EdgeInsets.all(10),
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           // Set the number of columns based on the device's screen size.
//           crossAxisCount: columnsCount,
//           // Set the aspect ratio of each card.
//           childAspectRatio: 2 / 3,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//         ),
//         // Set the number of items in the grid view.
//         itemCount: itemCount ?? 0,
//         // Set the grid view to shrink wrap its contents.
//         shrinkWrap: true,
//         // Disable scrolling in the grid view.
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (BuildContext context, int indexcount) {
//           // Build each card in the grid view.
//           return Card(
//             child: Column(
//               // crossAxisAlignment: CrossAxisAlignment.,
//               children: [
//                 Expanded(
//                     // Add an image to each card.
//                     child: imageContainer ?? const Center(child: Text("No Image Availble"))),
//                 const SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Column(
//                     children: [
//                       WATextFormField(
//                         controller: TextEditingController(),
//                         hintText: 'Description...',
//                         maxlines: 2,
//                         showBorder: false,
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.bookmark_outline),
//                           WaText(
//                             "Main photo",
//                             fontsize: 13.dp,
//                             // textAlignment: Alignment.,
//                             fontWeight: FontWeight.w400,
//                           ),
//                           const Spacer(),
//                           IconButton(
//                               icon: const Icon(
//                                 Icons.delete_outline,
//                                 color: AppColors.darkRed,
//                               ),
//                               onPressed: onPressedDelete),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
