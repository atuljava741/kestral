import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kestral/dashboard/dashboard_viewmodel.dart';
import 'package:kestral/datamodal/task_category.dart';

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
      itemCount: widget.subTaskList.length, // Replace with your actual item count
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            widget.viewModel.selectedSubTaskId = widget.subTaskList.elementAt(index).id;
            widget.viewModel.selectedSubTask = widget.subTaskList.elementAt(index).taskName;
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            color: index == selectedIndex ? Utils.highlightColor : Colors.white, // Highlight selected item
            padding: EdgeInsets.all(16.0),
            child: Text(widget.subTaskList.elementAt(index).taskName, style: AppTextStyle.textStylePoppins15w400,),
          ),
        );
      },
    );
  }
}