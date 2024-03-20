import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kestral/dashboard/dashboard_viewmodel.dart';
import 'package:kestral/utils/size_ext.dart';

import '../datamodal/incomplete_task.dart';
import '../utils/appt_text_style.dart';
import '../utils/utils.dart';

class SubTaskListView extends StatefulWidget {
  final List<GetInCompleteTasks> subTaskList;
  final DashboardViewModel viewModel;
  final Function callback;

  const SubTaskListView(this.subTaskList, this.viewModel,this.callback, {super.key});

  @override
  CategoriesListViewState createState() => CategoriesListViewState();
}

class CategoriesListViewState extends State<SubTaskListView> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    setSelectedIndex();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.Sh, horizontal: 16.Sh),
          child: Text(
            "Tasks",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.textStylePoppins14w600,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount:
            widget.subTaskList.length, // Replace with your actual item count
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.callback.call(index);
          
                },
                child: Container(
                  margin:  EdgeInsets.only(top: 5.Sh,bottom: 5.Sh),
                  color: index == selectedIndex
                      ? Utils.highlightColor
                      : Colors.white, // Highlight selected item
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
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
                                    padding: EdgeInsets.only( left : 16.Sw),
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
                        Visibility(
                          visible : widget.subTaskList.elementAt(index).dueDate != "",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width : 16.Sw),
                              Text(
                                "Due on : ${widget.subTaskList.elementAt(index).dueDate}",
                                style: const TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width : 10.Sw),
                              Utils.getChip(widget.subTaskList.elementAt(index).taskPriority)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  void setSelectedIndex(){
    int id = Utils.selectedSubTaskId;
    int index = widget.subTaskList.indexWhere((test) => test.id == id);
    if (index != -1) {
      setState(() {
        selectedIndex = index;
      });
    }
  }
}
