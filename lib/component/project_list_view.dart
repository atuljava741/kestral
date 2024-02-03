import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kestral/dashboard/dashboard_viewmodel.dart';
import 'package:kestral/datamodal/task_category.dart';

import '../datamodal/project_detail.dart';
import '../utils/appt_text_style.dart';
import '../utils/utils.dart';

class ProjectsListView extends StatefulWidget {

  List<Projects> projectList;
  DashboardViewModel viewModel;
  Function callback;

  ProjectsListView(this.projectList, this.viewModel, this.callback);

  @override
  ProjectsListViewState createState() => ProjectsListViewState();
}

class ProjectsListViewState extends State<ProjectsListView> {
  int selectedIndex = -1; // Initially, no item is selected

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.projectList.length, // Replace with your actual item count
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.callback.call(index);
          },
          child: Container(
            color: index == selectedIndex ? Utils.highlightColor : Colors.white, // Highlight selected item
            padding: EdgeInsets.all(16.0),
            child: Text(widget.projectList.elementAt(index).projectName, style: AppTextStyle.textStylePoppins15w400,),
          ),
        );
      },
    );
  }
}