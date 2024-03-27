import 'package:flutter/material.dart';
import 'package:kestral/dashboard/dashboard_viewmodel.dart';
import 'package:kestral/datamodal/task_category.dart';
import 'package:kestral/utils/size_ext.dart';

import '../utils/appt_text_style.dart';
import '../utils/utils.dart';

class TaskCategoriesListView extends StatefulWidget {

  final List<TaskCategories> categoryList;
  final DashboardViewModel viewModel;

  const TaskCategoriesListView(this.categoryList, this.viewModel, {super.key});

  @override
  State<TaskCategoriesListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<TaskCategoriesListView> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.categoryList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Utils.categoryForAddTask = widget.categoryList.elementAt(index).id;
            widget.viewModel.selectCategory(widget.categoryList.elementAt(index).taskCategoryTitle);
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            color: index == selectedIndex ? Utils.highlightColor : Colors.white,
            padding:  EdgeInsets.symmetric(vertical: 10.Sh, horizontal: 10.Sh),
            child: Text(widget.categoryList.elementAt(index).taskCategoryTitle, style: AppTextStyle.textStylePoppins15w400,),
          ),
        );
      },
    );
  }
}