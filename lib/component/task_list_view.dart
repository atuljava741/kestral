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
  Function callback;

  SubTaskListView(this.subTaskList, this.viewModel,this.callback);

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
            Utils.taskPriority = widget.subTaskList.elementAt(index).taskPriority;
            Utils.dueDate = widget.subTaskList.elementAt(index).dueDate;
            Utils.selectedSubTask =
                widget.subTaskList.elementAt(index).taskName;
            Utils.selectedCategoryId =
                widget.subTaskList.elementAt(index).taskCategoryId;
            await Utils.getPreference()
                .setString(Utils.taskName, Utils.selectedSubTask);
            await Utils.getPreference()
                .setString("dueDate",Utils.dueDate) ;
                await Utils.getPreference()
                .setString("taskPriority",Utils.taskPriority) ;
            setState(() {
              selectedIndex = index;
            });
            widget.callback.call(index);

          },
          child: Container(
            margin: EdgeInsets.only(top: 10.Sh,bottom: 10.Sh),
            color: index == selectedIndex
                ? Utils.highlightColor
                : Colors.white, // Highlight selected item

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            padding: EdgeInsets.only( left : 16),
                            child: Text(
                              widget.subTaskList.elementAt(index).taskName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyle.textStylePoppins15w400,
                            ),
                          )),
                    ),
                    Expanded(
                      flex:1,
                      child: Container(
                        margin: EdgeInsets.only(top: 5.Sh, right: 20.Sw),
                        alignment: Alignment.centerRight,
                        child: Visibility(
                          visible: index == selectedIndex,
                          child: SvgPicture.asset(
                            'assets/images/select_icon.svg',
                            height: 25.Sw,
                            width:
                                25.Sw, // Replace 'my_icon.svg' with your SVG file path
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
                          padding: EdgeInsets.only(top: 5.0, left : 16, right : 10, bottom : 10),
                          child: Text(
                            "Due on: "+ (widget.subTaskList.elementAt(index).dueDate ?? ""),
                            style: const TextStyle(
                              color: Color(0xFF252525),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                          ),
                        )),
                    Utils.getChip(widget.subTaskList.elementAt(index).taskPriority)
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


}
