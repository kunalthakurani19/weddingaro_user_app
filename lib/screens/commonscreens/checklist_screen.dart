import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:weddingaro_user_app/data/response/status.dart';
import 'package:weddingaro_user_app/resources/color.dart';
import 'package:weddingaro_user_app/resources/common_components/common_appbar.dart';
import 'package:weddingaro_user_app/resources/common_components/navigation_drawer_component.dart';
import 'package:weddingaro_user_app/resources/common_components/nothing_message_component.dart';
import 'package:weddingaro_user_app/resources/common_components/outline_dropdown_button.dart';
import 'package:weddingaro_user_app/resources/common_components/wa_button.dart';
import 'package:weddingaro_user_app/resources/common_components/watext.dart';
import 'package:weddingaro_user_app/resources/common_components/watextformfeild.dart';
import 'package:weddingaro_user_app/resources/img_res.dart';
import 'package:weddingaro_user_app/view_model/checklist_view_model.dart';

class CheckListScreen extends StatefulWidget {
  const CheckListScreen({super.key});

  @override
  State<CheckListScreen> createState() => _CheckListScreenState();
}

class _CheckListScreenState extends State<CheckListScreen> {
  CheckListViewModel checkListViewModel = CheckListViewModel();

  @override
  void initState() {
    checkListViewModel.fetchCheckList();
    super.initState();
  }

  Future<void> _refreshEnquires() async {
    await checkListViewModel.fetchCheckList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'CheckList'),
      drawer: const NavigatorDrawerComponent(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WAButton(
                "Add new Task",
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
                                "New Task",
                                fontWeight: FontWeight.bold,
                                textAlignment: Alignment.centerLeft,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              WATextFormField(
                                controller: TextEditingController(),
                                hintText: "Name Of The Tasks",
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              WATextFormField(
                                controller: TextEditingController(),
                                hintText: "Description of task",
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              WATextFormField(
                                controller: TextEditingController(),
                                hintText: "Start Date",
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                              const WAButton("Create")
                            ]),
                          ),
                        );
                      });
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              const WaText(
                "You have Completed 0 out of 112 tasks",
                fontsize: 16,
                textAlignment: Alignment.centerLeft,
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
                progressColor: AppColors.lightRed,
                padding: const EdgeInsets.all(0),
              ),
              SizedBox(
                height: 4.h,
              ),
              WaText(
                "Filter By:",
                fontsize: 16,
                textAlignment: Alignment.centerLeft,
              ),

              // checklist
              ChangeNotifierProvider<CheckListViewModel>(
                create: (BuildContext context) => checkListViewModel,
                child: Consumer<CheckListViewModel>(builder: (context, value, _) {
                  switch (value.enquiryList.status!) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());
                    case Status.error:
                      return Text(value.enquiryList.message.toString());
                    case Status.completed:
                      final tasks = value.enquiryList.data?.tasks;
                      if (tasks == null || tasks.isEmpty) {
                        return const NothingMessageComponent(
                          message: "You do not have any checkList ",
                          imgUrl: ImageRes.messengerIcon,
                        );
                      }

                      // Filter stores based on search query

                      return ListView.builder(
                        itemCount: tasks.length, // Change this to the desired number of items
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            // width: MediaQuery.of(context).size.width * 0.8,
                            child: Column(
                              children: [
                                Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline_rounded,
                                      color: AppColors.blackColor50,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Expanded(
                                        child: Column(
                                      children: [
                                        WaText(
                                          tasks[index].name ?? 'NA',
                                          fontsize: 15,
                                          maxCharactersToShow: 20,
                                          textAlignment: Alignment.centerLeft,
                                        ),
                                        WaText(
                                          tasks[index].description ?? 'NA',
                                          fontsize: 13,
                                          maxCharactersToShow: 30,
                                          textAlignment: Alignment.centerLeft,
                                          textcolor: AppColors.blackColor50,
                                        ),
                                      ],
                                    )),
                                    // Spacer(),
                                    WaText(
                                      tasks[index].startdate ?? 'NA',
                                      fontsize: 15,
                                      maxCharactersToShow: 20,
                                      textAlignment: Alignment.centerLeft,
                                    ),
                                  ],
                                ),
                                const Divider()
                              ],
                            ),
                          );
                        },
                      );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
