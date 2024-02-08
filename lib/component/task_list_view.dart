import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kestral/dashboard/dashboard_viewmodel.dart';
import 'package:kestral/datamodal/task_category.dart';
import 'package:kestral/utils/size_ext.dart';

import '../datamodal/incomplete_task.dart';
import '../utils/appt_text_style.dart';
import '../utils/utils.dart';

class SubTaskListView extends StatefulWidget {
  List<GetInCompleteTasks> subTaskList;
  DashboardViewModel viewModel;

  SubTaskListView(this.subTaskList, this.viewModel);

  @override
  CategoriesListViewState createState() => CategoriesListViewState();
}

class CategoriesListViewState extends State<SubTaskListView> {
  int selectedIndex = -1; // Initially, no item is selected

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:
          widget.subTaskList.length, // Replace with your actual item count
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            Utils.selectedSubTaskId = widget.subTaskList.elementAt(index).id;
            Utils.selectedSubTask =
                widget.subTaskList.elementAt(index).taskName;
            Utils.selectedCategoryId =
                widget.subTaskList.elementAt(index).taskCategoryId;
            await Utils.getPreference()
                .setString(Utils.taskName, Utils.selectedSubTask);
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            color: index == selectedIndex
                ? Utils.highlightColor
                : Colors.white, // Highlight selected item

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.only(top: 12.0, left : 16, right : 25),
                          child: Text(
                            widget.subTaskList.elementAt(index).taskName,
                            style: AppTextStyle.textStylePoppins15w400,
                          ),
                        )),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0, right: 20.Sw),
                        alignment: Alignment.centerRight,
                        child: Visibility(
                          visible: index == selectedIndex,
                          child: SvgPicture.asset(
                            'assets/images/select_icon.svg',
                            height: 28.Sw,
                            width:
                                28.Sw, // Replace 'my_icon.svg' with your SVG file path
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.only(top: 5.0, left : 16, right : 10, bottom : 15),
                          child: Text(
                            "Due on: "+ (widget.subTaskList.elementAt(index).dueDate ?? ""),
                            style: const TextStyle(
                              color: Color(0xFF252525),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0.14,
                        ),
                          ),
                        )),
                    getChip(widget.subTaskList.elementAt(index).taskPriority)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  getChip(String priority) {
    return Container(
      decoration: BoxDecoration(
        borderRadius:
        BorderRadius.circular(20), // Set border radius here
        color: getColorOfPriority(priority), // Set background color
      ),
      margin: EdgeInsets.only(bottom: 10, left: 5),
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
      child: Text(
        priority,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  getColorOfPriority(String priority) {
    if(priority.toLowerCase() == "high"){
      return Color(0xFFF72828);
    }
    if(priority.toLowerCase() == "medium"){
      return Color(0xffF7A428);
    }
    return Color(0xFF27CE38);
  }
}
