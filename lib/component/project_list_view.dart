import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kestral/dashboard/dashboard_viewmodel.dart';
import 'package:kestral/datamodal/task_category.dart';
import 'package:kestral/utils/size_ext.dart';

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
      itemCount:
          widget.projectList.length, // Replace with your actual item count
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
            widget.callback.call(index);
          },
          child: Container(
            height: 48.Sh,
            color: index == selectedIndex
                ? Utils.highlightColor
                : Colors.white, // Highlight selected item
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 4,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            widget.projectList.elementAt(index).projectName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.textStylePoppins15w400,
                          ),
                        ))),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 10.0,
                      right: 20.Sw,
                      bottom: 10.0,
                    ),
                    alignment: Alignment.centerRight,
                    child: Visibility(
                      visible: index == selectedIndex,
                      child: SvgPicture.asset(
                        'assets/images/select_icon.svg',
                        height: 28.Sw,
                        width: 28
                            .Sw, // Replace 'my_icon.svg' with your SVG file path
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
