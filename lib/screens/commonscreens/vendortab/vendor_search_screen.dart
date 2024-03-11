import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weddingaro_user_app/resources/common_components/venue_card_component.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';

import '../../../resources/color.dart';

class VendorSearchScreen extends StatefulWidget {
  const VendorSearchScreen({super.key});

  @override
  State<VendorSearchScreen> createState() => _VendorSearchScreenState();
}

class _VendorSearchScreenState extends State<VendorSearchScreen> {
  String selectedCategory = '';
  String selectedLocation = '';
  String categorySearchQuery = '';
  String locationSearchQuery = '';

  List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  List<String> locations = ['Location 1', 'Location 2', 'Location 3'];

  void _openCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      categorySearchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    if (categorySearchQuery.isEmpty ||
                        categories[index].toLowerCase().contains(categorySearchQuery.toLowerCase())) {
                      return ListTile(
                        title: Text(categories[index]),
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[index];
                          });
                          Navigator.pop(context);
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          );
        });
  }

  void _openLocationBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    setState(() {
                      locationSearchQuery = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    if (locationSearchQuery.isEmpty ||
                        locations[index].toLowerCase().contains(locationSearchQuery.toLowerCase())) {
                      return ListTile(
                        title: Text(locations[index]),
                        onTap: () {
                          setState(() {
                            selectedLocation = locations[index];
                          });
                          Navigator.pop(context);
                        },
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wedding Venues'),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            searchBar(),
            SizedBox(
              height: 1.h,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WaText(
                '55 result',
                baskerville: false,
                textcolor: AppColors.blackColor50,
                textAlignment: Alignment.centerLeft,
              ),
            ),
            const SizedBox(height: 500, child: VenueCardInDetailComponent()),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Material(
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.red),
          ),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 100, // adjust the max width as needed
                    minHeight: 40, // adjust the max height as needed
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: InkWell(
                    onTap: () {
                      _openCategoryBottomSheet(context);
                    },
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.search_outlined),
                        ),
                        Center(
                          child: Text(
                            // controller: TextEditingController(),

                            selectedCategory,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 100,
                    minHeight: 40,
                  ),
                  height: 40,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 1,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _openLocationBottomSheet(context);
                            },
                            child: Center(
                              child: Text(
                                selectedLocation,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
