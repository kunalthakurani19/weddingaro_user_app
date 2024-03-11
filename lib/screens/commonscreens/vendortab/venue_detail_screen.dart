
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:weddingaro_user_app/resources/common_components/favroute_screen_component.dart';
import 'package:weddingaro_user_app/resources/common_components/text.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/common_components/watextformfeild.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../resources/color.dart';

class VenueDetailScreen extends StatefulWidget {
  const VenueDetailScreen({super.key});

  @override
  State<VenueDetailScreen> createState() => _VenueDetailScreenState();
}

class _VenueDetailScreenState extends State<VenueDetailScreen> {
  String selectedCategory = '';
  String selectedLocation = '';
  String categorySearchQuery = '';
  String locationSearchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('The Grand Ambience'),
        ),
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
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
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WaText(
                      "The Grand Ambiems",
                      textAlignment: Alignment.centerLeft,
                      fontsize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 4.6,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          // itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.amber.withAlpha(50),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        WaText(
                          '4.6'.toString(),
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.pin_drop,
                          size: 24,
                          color: AppColors.darkRed,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        const WaText(
                          'Indore, Madhya Pradesh',
                          fontsize: 17,
                          textAlignment: Alignment.centerLeft,
                          maxCharactersToShow: 30,
                        ),
                      ],
                    ),
                    Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.dining_outlined),
                            SizedBox(
                              width: 3.w,
                            ),
                            const WaText(
                              'Price per plate ₹ 350',
                              fontsize: 17,
                              textAlignment: Alignment.centerLeft,
                              maxCharactersToShow: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.people_outline),
                            SizedBox(
                              width: 3.w,
                            ),
                            const WaText(
                              '50 to 10000 guests',
                              fontsize: 17,
                              textAlignment: Alignment.centerLeft,
                              maxCharactersToShow: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const HeadingText(
                      heading: 'About',
                      isline: false,
                      horizontalPadding: 0,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const WaText(
                        fontsize: 15,
                        "Welcome to Luxury Oasis Resort & Spa, where indulgence meets tranquility amidst the breathtaking backdrop of pristine beaches and lush tropical gardens. Nestled along the azure coastline of [insert location], our resort offers a perfect blend of opulence, relaxation, and personalized service to elevate your holiday experience to new heights."),
                    SizedBox(
                      height: 2.h,
                    ),
                    const HeadingText(
                      heading: 'Frequently asked questions',
                      isline: false,
                      horizontalPadding: 0,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const WaText(
                      fontsize: 15,
                      "What is the rental rincing excluding catering ?",
                      textAlignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 1.h),
                    const WaText(
                      '₹ 50000',
                      fontsize: 15,
                      textAlignment: Alignment.centerLeft,
                    ),
                    const Divider(),
                    const WaText(
                      fontsize: 15,
                      "What is menus options you have ?",
                      textAlignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 1.h),
                    menuCheckAndName("North Indian / mughlai"),
                    menuCheckAndName("South Indian"),
                    menuCheckAndName("Chinese /thai / oriental"),
                    menuCheckAndName("Live food counter"),
                    menuCheckAndName("Drinks "),
                    menuCheckAndName("Chaat "),
                    const Divider(),
                    const WaText(
                      fontsize: 15,
                      "How you describe your event spaces ?",
                      textAlignment: Alignment.centerLeft,
                    ),
                    SizedBox(height: 1.h),
                    menuCheckAndName("Banquet"),
                    menuCheckAndName("Hotel"),
                    menuCheckAndName("Lawn"),
                    menuCheckAndName("Resort"),
                    menuCheckAndName("Palace "),
                    menuCheckAndName("Mandapan"),
                    SizedBox(
                      height: 3.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Expanded(
                          child: HeadingText(
                            heading: 'Reviews',
                            isline: false,
                            horizontalPadding: 0,
                          ),
                        ),
                        Expanded(
                            child: WAButton(
                          'Write a review',
                          height: 5.h,
                          fontsize: 13,
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          rating: 4.6,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          // itemCount: 5,
                          itemSize: 20.0,
                          unratedColor: Colors.amber.withAlpha(50),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        WaText(
                          '1 Review'.toString(),
                          fontsize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const ReviewRow(
                      text: 'Quality of service:',
                      rating: 5,
                      barColor: AppColors.grey,
                    ),
                    const ReviewRow(
                      text: 'Responsiveness:',
                      rating: 4,
                      barColor: AppColors.yellow,
                    ),
                    const ReviewRow(
                      text: 'Value:',
                      rating: 3,
                      barColor: AppColors.orange,
                    ),
                    const ReviewRow(
                      text: 'Flexibility:',
                      rating: 2,
                      barColor: AppColors.lightGreen,
                    ),
                    const ReviewRow(
                      text: 'Professionalism:',
                      rating: 4,
                      barColor: AppColors.darkgreen,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WAButton(
            'Request Pricing',
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
                            hintText: "Hi we  love to learan more about your venue kindle share your contact",
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
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked);
  }

  Widget menuCheckAndName(String text) {
    return Row(
      children: [
        const Icon(
          Icons.done,
          color: AppColors.darkgreen,
        ),
        SizedBox(
          width: 3.w,
        ),
        WaText(
          text,
          fontsize: 13,
        )
      ],
    );
  }
}

class ReviewRow extends StatelessWidget {
  final String text;
  final int rating;
  final Color barColor;

  const ReviewRow({
    Key? key,
    required this.text,
    required this.rating,
    required this.barColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WaText(
          text,
          fontsize: 15,
          maxCharactersToShow: 20,
          textAlignment: Alignment.centerLeft,
        ),
        const Spacer(),
        RatingBarIndicator(
          rating: rating.toDouble(),
          itemBuilder: (context, index) => Icon(Icons.rectangle, color: barColor),
          itemSize: MediaQuery.of(context).size.width * 0.08,
          unratedColor: barColor.withAlpha(75),
        ),
      ],
    );
  }
}
