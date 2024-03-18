import 'package:flutter/material.dart';
import 'package:kestral/dashboard/dashboard_viewmodel.dart';
import 'package:kestral/datamodal/task_category.dart';

import '../utils/appt_text_style.dart';
import '../utils/utils.dart';

class TaskCategoriesListView extends StatefulWidget {

  List<TaskCategories> categoryList;
  DashboardViewModel viewModel;

  TaskCategoriesListView(this.categoryList, this.viewModel, {super.key});

  @override
  _MyListViewState createState() => _MyListViewState();
}

class _MyListViewState extends State<TaskCategoriesListView> {
  int selectedIndex = -1; // Initially, no item is selected

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.categoryList.length, // Replace with your actual item count
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Utils.selectedCategoryId = widget.categoryList.elementAt(index).id;
            widget.viewModel.selectCategory(widget.categoryList.elementAt(index).taskCategoryTitle);
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            color: index == selectedIndex ? Utils.highlightColor : Colors.white, // Highlight selected item
            padding: EdgeInsets.all(16.0),
            child: Text(widget.categoryList.elementAt(index).taskCategoryTitle, style: AppTextStyle.textStylePoppins15w400,),
          ),
        );
      },
    );
  }
}