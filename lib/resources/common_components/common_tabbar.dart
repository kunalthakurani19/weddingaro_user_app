
//  DefaultTabController(
//               length: 2,
//               child: Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const TabBar(
//                       tabs: [
//                         Tab(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.check_circle_outline_outlined,
//                                 color: AppColors.lightGreen,
//                               ),
//                               SizedBox(
//                                   width:
//                                       5), // Adjust spacing between icon and text
//                               Text('Complete'),
//                             ],
//                           ),
//                         ),
//                         Tab(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(Icons.cancel_outlined),
//                               SizedBox(
//                                   width:
//                                       5), // Adjust spacing between icon and text
//                               Text('Incomplete'),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         children: [
//                           RefreshIndicator(
//                             onRefresh: _refreshStores,
//                             child: Consumer<StoreViewModel>(
//                                 builder: (context, value, _) {
//                               switch (value.storeList.status!) {
//                                 case Status.loading:
//                                   return const Center(
//                                       child: CircularProgressIndicator());
//                                 case Status.error:
//                                   return Text(
//                                       value.storeList.message.toString());
//                                 case Status.completed:
//                                   if (value.storeList.data!.stores!.isEmpty) {
//                                     return const Center(
//                                         child: Text("No stores are available"));
//                                   }
//                                   // Filter stores based on search query
//                                   final filteredStores = value
//                                       .storeList.data!.stores!
//                                       .where((store) {
//                                     final query =
//                                         _searchController.text.toLowerCase();
//                                     return store.store?.businessdetails
//                                             ?.businessName
//                                             ?.toLowerCase()
//                                             ?.contains(query) ??
//                                         false;
//                                   }).toList();

//                                   if (filteredStores.isEmpty) {
//                                     return const Center(
//                                         child: Text("No stores found"));
//                                   }
//                                   return ListView.builder(
//                                     physics:
//                                         const AlwaysScrollableScrollPhysics(),
//                                     itemCount: filteredStores.length,
//                                     itemBuilder: (context, index) {
//                                       return Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 8, vertical: 4),
//                                         child: Card(
//                                           child: ListTile(
//                                             title: WaText(
//                                               filteredStores[index]
//                                                   .store!
//                                                   .businessdetails!
//                                                   .businessName!,
//                                               fontsize: 17,
//                                               textAlignment:
//                                                   Alignment.centerLeft,
//                                             ),
//                                             subtitle: Column(
//                                               children: [
//                                                 Row(
//                                                   children: [
//                                                     const Icon(
//                                                       Icons.phone,
//                                                       size: 13,
//                                                       color: AppColors.darkRed,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 2.w,
//                                                     ),
//                                                     WaText(
//                                                       filteredStores[index]
//                                                               .store
//                                                               ?.businessdetails
//                                                               ?.mobile ??
//                                                           'mobile is not provided',
//                                                       fontsize: 12,
//                                                       textAlignment:
//                                                           Alignment.centerLeft,
//                                                       maxCharactersToShow: 30,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.2.h,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     const Icon(
//                                                       Icons.email,
//                                                       size: 13,
//                                                       color: AppColors.darkRed,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 2.w,
//                                                     ),
//                                                     WaText(
//                                                       filteredStores[index]
//                                                               .store
//                                                               ?.businessdetails
//                                                               ?.email ??
//                                                           'email is not provided',
//                                                       fontsize: 12,
//                                                       textAlignment:
//                                                           Alignment.centerLeft,
//                                                       maxCharactersToShow: 30,
//                                                     ),
//                                                   ],
//                                                 ),
//                                                 SizedBox(
//                                                   height: 0.2.h,
//                                                 ),
//                                                 Row(
//                                                   children: [
//                                                     const Icon(
//                                                       Icons.pin_drop,
//                                                       size: 13,
//                                                       color: AppColors.darkRed,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 2.w,
//                                                     ),
//                                                     WaText(
//                                                       filteredStores[index]
//                                                               .store
//                                                               ?.location
//                                                               ?.formattedAddress ??
//                                                           'Address not available',
//                                                       fontsize: 12,
//                                                       textAlignment:
//                                                           Alignment.centerLeft,
//                                                       maxCharactersToShow: 30,
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ],
//                                             ),
//                                             trailing: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 InkWell(
//                                                   onTap: () {
//                                                     if (kDebugMode) {
//                                                       print(
//                                                           filteredStores[index]
//                                                               .storeToken);
//                                                     }
//                                                     pushNewScreenWithRouteSettings(
//                                                       context,
//                                                       settings:
//                                                           const RouteSettings(
//                                                               name: RoutesName
//                                                                   .storefront),
//                                                       screen: StoreFrontScreen(
//                                                         storeToken:
//                                                             filteredStores[
//                                                                     index]
//                                                                 .storeToken,
//                                                       ),
//                                                       pageTransitionAnimation:
//                                                           PageTransitionAnimation
//                                                               .sizeUp,
//                                                     );
//                                                   },
//                                                   child: const Icon(
//                                                     Icons.edit,
//                                                   ),
//                                                 ),
//                                                 const SizedBox(width: 8),
//                                                 InkWell(
//                                                   onTap: () {
//                                                     showDialog(
//                                                       context: context,
//                                                       builder: (BuildContext
//                                                           context) {
//                                                         return ConfirmationAlert(
//                                                           message:
//                                                               'Are you sure you want to delete the store?',
//                                                           onConfirm: () async {
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop(); // Close the dialog

//                                                             storeViewModel
//                                                                 .deleteStore(
//                                                               filteredStores[
//                                                                       index]
//                                                                   .store!
//                                                                   .id,
//                                                             );
//                                                             if (storeViewModel
//                                                                     .doneDelete ==
//                                                                 true) {
//                                                               Utils.flushBarSucessMessage(
//                                                                   'Store Delete Sucessful',
//                                                                   context);
//                                                               storeViewModel
//                                                                       .doneDelete =
//                                                                   false;
//                                                             }
//                                                           },
//                                                           onCancel: () {
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop(); // Close the dialog
//                                                           },
//                                                         );
//                                                       },
//                                                     );
//                                                   },
//                                                   child: const Icon(
//                                                     Icons.delete,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   );
//                               }
//                             }),
//                           ),
//                           const Center(
//                             child: Text("data"),
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
      