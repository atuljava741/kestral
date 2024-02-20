import 'package:flutter/material.dart';
import 'package:kestral/apicalls/get_projects.dart';
import 'package:kestral/component/category_list_view.dart';
import 'package:kestral/task_queue/task_queue.dart';
import 'package:kestral/utils/appt_text_style.dart';
import 'package:kestral/utils/size_ext.dart';
import 'package:kestral/utils/utils.dart';
import 'package:stacked/stacked.dart';
import '../apicalls/add_task.dart';
import '../apicalls/get_task.dart';
import '../component/project_list_view.dart';
import '../component/task_list_view.dart';
import '../component/toggle_button.dart';
import '../datamodal/incomplete_task.dart';
import 'dashboard_viewmodel.dart';
import 'package:timezone/data/latest.dart' as tz;

class KestralScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    apiTest();
    Utils.deviceHeight = MediaQuery.of(context).size.height;
    Utils.deviceWidth = MediaQuery.of(context).size.width;
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(context),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: const Color(0xFFF8F5F0),
            body: Stack(
              children: [
                getTopLogoAndText(context, viewModel),
                getProjectAndTaskUI(context, viewModel),
                Positioned(
                  top: (MediaQuery.of(context).size.height - 100) / 2,
                  left: (MediaQuery.of(context).size.width - 100) / 2,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue, // Change color as needed
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          onStartButtonClicked(viewModel);
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Center(
                                  child: Utils.getIcon(
                                      "assets/images/bottom_layer.png",
                                      120,
                                      120)),
                              Center(
                                child: Opacity(
                                  opacity: 1,
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: 85,
                                          height: 85,
                                          decoration: ShapeDecoration(
                                            color: viewModel.getColor(),
                                            shape: const OvalBorder(
                                              side: BorderSide(
                                                  width: 8,
                                                  color: Color(0XFFFFFFFF)),
                                            ),
                                            shadows: const [
                                              BoxShadow(
                                                color: Color(0x3F000000),
                                                blurRadius: 50,
                                                offset: Offset(0, 8),
                                                spreadRadius: 3,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child:
                                    Utils.getIcon(viewModel.getImage(), 60, 60),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    height: 64.Sw,
                    decoration: const BoxDecoration(
                      color: Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // Nested Row to group left-side elements
                          children: [
                            Utils.getIcon(
                                "assets/images/contact.png", 24, 24),
                            SizedBox(width: 8.Sw), // Adjust spacing as needed
                            Text(
                              viewModel.getUserNameText(),
                              style: AppTextStyle.textStylePoppins21w600,
                            ),
                          ],
                        ),
                        GestureDetector(
                            onTap: () {
                              openBottomOptions(context,viewModel);
                            },
                            child: Utils.getIcon(
                                "assets/images/threepoints.png", 24, 24))
                        // Right-side icon
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  /*List<Widget> projectContainer(DashboardViewModel viewModel) {
    List<Widget> list = [];
    for (var i = 0; i < viewModel.projectList.length; i++) {
      Widget w = GestureDetector(s
        onTap: () {
          // view model me jo selectProject varaible me uska naam likhna hai jisko tap kiya
          viewModel.seletedProject = viewModel.projectList.elementAt(i).projectName;
          viewModel.getSubTask(viewModel.projectList.elementAt(i).projectId);
          viewModel.refreshUI();
        },
        child: Container(
          width: double.infinity,
          height: 48.Sh,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                viewModel.projectList.elementAt(i).projectName,
                textAlign: TextAlign.center, // Center text horizontally
                style: AppTextStyle.textStylePoppins15w400,
              ),
            ),
          ),
        ),
      );
      list.add(w);
    }
    return list;
  }*/

  /*List<Widget> taskContainer(DashboardViewModel viewModel) {
    List<Widget> list = [];
    for (var j = 0; j < viewModel.taskList.length; j++) {
      Widget x = GestureDetector(
        onTap: () {
          viewModel.selectedTask = viewModel.taskList.elementAt(j).taskName;
          viewModel.refreshUI();
        },
        child: Container(
          width: double.infinity,
          height: 48.Sh,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                viewModel.taskList.elementAt(j).taskName,
                textAlign: TextAlign.center, // Center text horizontally
                style: AppTextStyle.textStylePoppins15w400,
              ),
            ),
          ),
        ),
      );
      list.add(x);
    }
    return list;
  }*/

  Widget CreateTask(DashboardViewModel viewModel, String text,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: () {
        // Call onTap callback if it is not null
        onTap?.call();
        // Print the text when tapped
        //print(text);
      },
      child: Container(
        width: double.infinity,
        height: 48.Sh,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              textAlign: TextAlign.center, // Center text horizontally
              style: AppTextStyle.textStylePoppins15w400,
            ),
          ),
        ),
      ),
    );
  }

  getTopLogoAndText(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 10.Sw, right: 10.Sw),
      padding: EdgeInsets.only(top: 50.Sh),
      decoration: BoxDecoration(
        gradient: viewModel.getLinearGradient(),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.Sh),
          Utils.getIcon("assets/images/logo.png", 72, 64),
          SizedBox(height: 25.Sh),
          Text(
            viewModel.currentDuration,
            textAlign: TextAlign.right,
            style: AppTextStyle.textStylePoppins72w600,
          ),
          SizedBox(height: 25.Sh),
          Text(
            viewModel.getcurrentText(),
            textAlign: TextAlign.center,
            style: AppTextStyle.textStylePoppins14w400,
          ),
          SizedBox(height: 20.Sh),
          Text(
            viewModel.getCurrent2Text(),
            textAlign: TextAlign.center,
            style: AppTextStyle.textStylePoppins14w400,
          ),
        ],
      ),
    );
  }

  getProjectAndTaskUI(BuildContext context, DashboardViewModel viewModel) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 2,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.00, -1.00),
            end: Alignment(0, 5),
            colors: [Color(0xFFF7F4EF), Color(0xFFFFE7A0)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 320.Sw,
                      height: 64.Sh,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFFBFAFA),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x1E343330),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      // Wrap the Container with a GestureDetector
                      onTap: () {
                        if(Utils.projectList != null && Utils.projectList.length > 0 ) {
                          showProjectBottomSheet(context, viewModel);
                        } else {
                          Utils.showBottomSheet(context, Icons.error, Colors.red, "Your Project List is Empty");
                        }
                      },
                      child: Container(
                        width: 256.Sw,
                        decoration: AppTextStyle.getShapeDecoration3(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 13.Sw, top: 10.Sh),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        viewModel.getProjectText(),
                                        style:
                                            AppTextStyle.textStylePoppins12w400,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.Sh,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          Utils.selectProjectText,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style:
                                              AppTextStyle.textStylePoppins18w600,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10.Sw),
                                        child: const Icon(Icons.arrow_drop_down,
                                            size: 35,
                                            color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 265.Sw, top: 10.Sh),
                      child: GestureDetector(
                        onTap: () {
                          if(!viewModel.refreshButtonClicked) {
                            viewModel.refreshButtonClicked = true;
                            viewModel.getProjects().then((value) {
                              if (viewModel.bottomNavVisible) {
                                viewModel.bottomNavVisible = false;
                                Future.delayed(Duration(seconds: 2), () {
                                  viewModel.refreshButtonClicked = false;
                                  Navigator.pop(context);
                                  Utils.showBottomSheet(context, Icons.done, Colors.green, "Project list refreshed");

                                });
                              }
                            });
                            viewModel.bottomNavVisible = true;
                            Utils.showProgressBottomSheet(
                                context, "Refreshing Project List", false);
                          }

                        },
                        child: Container(
                          width: 48.Sw,
                          height: 48.Sh,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF1589CA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: Utils.getIcon(
                                "assets/images/refresh_image.png.png", 72, 64),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 18.Sh,
            ),
        Container(
          width: 320.Sw,
          decoration: ShapeDecoration(
            color: const Color(0xFFFBFAFA),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)),
            shadows: const [
              BoxShadow(
                color: Color(0x1E343330),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      GestureDetector(
                        // Wrap the Container with a GestureDetector
                        onTap: () async{
                          if(viewModel.getSelectProjectText() != "" && viewModel.getSelectProjectText() != "Select Project") {
                           print("callll");
                            InCompleteTaskList incompleteTashList = await getMyTaskList(
                                Utils.selectedProjectId,
                                Utils.userInformation!.data.userAuthentication
                                    .employeeId);
                            Utils.taskList =
                                incompleteTashList.data.getInCompleteTasks;
                          showTaskBottomSheet(context, viewModel);
                          } else {
                            Utils.showBottomSheet(context, Icons.error, Colors.red, "Please Select A Project First");
                          }
                        },
                        child: Container(
                          width: Utils.showAddButton ? 256.Sw : 320.Sw,
                          //height: 64.Sh,
                          decoration: AppTextStyle.getBoxDecoration(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 13.Sw, top: 10.Sh),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Task",
                                          style:
                                              AppTextStyle.textStylePoppins12w400,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.Sh,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            Utils.selectedSubTask,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                AppTextStyle.textStylePoppins15w400,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(right: 10.Sw),
                                          child: const Icon(Icons.arrow_drop_down,
                                              size: 35,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height : 12.Sh),
                              Visibility(
                                visible: Utils.selectedSubTaskId != 0,
                                child: Container(
                                  width: Utils.showAddButton ? 245.Sw : 305.Sw,
                                  height: 37.Sh,
                                  padding: EdgeInsets.only(left:5.Sw, right: 10.Sw),
                                  decoration: ShapeDecoration(
                                    color: Color(0xFFF1F1F1),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  ),
                                  child : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            padding: EdgeInsets.only(top: 5.0, left : 16, right : 16, bottom : 15),
                                            child: Text(
                                              "Due on: "+ (Utils.dueDate),
                                              style: const TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.14,
                                              ),
                                            ),
                                          )),
                                      Utils.getChip(Utils.taskPriority)
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height : 12.Sh)

                            ],
                          ),
                        ),
                      ),
                      Utils.showAddButton ? Padding(
                        padding: EdgeInsets.only(left: 265.Sw, top: 10.Sh),
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                // Allow for custom height
                                builder: (context) {
                                  return getCategoryList(context, viewModel);
                                });
                          },
                          child: Container(
                            width: 48.Sw,
                            height: 48.Sh,
                            decoration: ShapeDecoration(
                              color: const Color(0xFF1589CA),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            child: SizedBox(
                              width: 24.Sw,
                              height: 24.Sh,
                              child: const Icon(Icons.add_circle_outline,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void apiTest() async {
    //await customLoginMutation("sanyam.sharma@47billion.com", "Test@123");
    //await getProjectList(Utils.userInformation!.data.userAuthentication.employeeId);
    //await getMyTaskList(327,560);
    //await getTaskCategoryList();
  }

  getCategoryList(BuildContext context, DashboardViewModel viewModel) {
    return SingleChildScrollView(
          child: Container(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
        //height: MediaQuery.of(context).size.height * 0.9,
        decoration: const ShapeDecoration(
          color: Color(0xFFF8F5F0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Added to space items
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, top: 14, bottom: 14),
                          child:
                              Utils.getIcon("assets/images/rong.png.png", 30, 30),
                        ),
                      ),
                      Text(
                        viewModel.getCreateTask(),
                        style: AppTextStyle.textStylePoppins16w600,
                      ),
                      const SizedBox(width: 54),
                      // Added space between the image and text
                    ],
                  ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 24),
              child: Text(
                viewModel.getKestrelText(),
                style: AppTextStyle.textStylePoppins20w600,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 1,
              decoration: const BoxDecoration(color: Color(0xFFD9D9D9)),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 22),
              child: Text(
                'CATEGORY',
                style: AppTextStyle.textStylePoppins14w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 255.Sh,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19CDBFB2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x16CDBFB2),
                    blurRadius: 11,
                    offset: Offset(0, 11),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x0CCDBFB2),
                    blurRadius: 15,
                    offset: Offset(0, 25),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x02CDBFB2),
                    blurRadius: 18,
                    offset: Offset(0, 45),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x00CDBFB2),
                    blurRadius: 20,
                    offset: Offset(0, 71),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: TaskCategoriesListView(Utils.categoryList, viewModel),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              //height: 93.Sh,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19CDBFB2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x16CDBFB2),
                    blurRadius: 11,
                    offset: Offset(0, 11),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x0CCDBFB2),
                    blurRadius: 15,
                    offset: Offset(0, 25),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x02CDBFB2),
                    blurRadius: 18,
                    offset: Offset(0, 45),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x00CDBFB2),
                    blurRadius: 20,
                    offset: Offset(0, 71),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 16.Sw,
                  left: 16.Sw,
                  top: 5.Sh,
                  bottom: 15,
                ),
                child: TextField(
                  controller: viewModel.textFieldController,
                  decoration: InputDecoration(
                    labelText: viewModel.getTaskText(),
                    labelStyle: AppTextStyle.textStylePoppins19w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            TButtons((index) {
              print(index);
              viewModel.newTaskPriority = index;


            }),
            Padding(
              padding: EdgeInsets.only(
                  top: 120.Sh, left: 20.Sw, right: 20.Sw, bottom: 20.Sh),
              child: GestureDetector(
                onTap: () async {
                  //int projectId, int taskCategoryId, int employeeId, String taskName, String dueDate,String taskPriority
                  await addTask(
                      Utils.selectedProjectId,
                      Utils.selectedCategoryId,
                      Utils.userInformation!.data.userAuthentication.employeeId,
                      viewModel.textFieldController.text,
                      viewModel.getDueDate(),
                      viewModel.newTaskPriority);
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: 48.0,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF1589CA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Center(
                    child: Text(
                      'Add Task',
                      style: AppTextStyle.textStylePoppins16w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ))));
  }

  Future<void> onStartButtonClicked(DashboardViewModel viewModel) async {
    // viewModel.toggleState();
    viewModel.handleTimer();
    viewModel.refreshUI();
    // getTimezone();
    // final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    // print("currentTimeZone $currentTimeZone");
  }

  void showProjectBottomSheet(
      BuildContext context, DashboardViewModel viewModel) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allow for custom height
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) {
              return Container(
                decoration: const ShapeDecoration(
                    color: Color(0xFFF8F5F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 23.Sh),
                    Text(
                      "Select Project",
                      style: AppTextStyle.textStylePoppins16w600,
                    ),
                    SizedBox(height: 10.Sh),
                    Container(
                        margin: EdgeInsets.all(20),
                        width: double.infinity,
                        height:
                            300.Sh, //MediaQuery.of(context).size.height/2 - 80.Sh,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19CDBFB2),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x16CDBFB2),
                              blurRadius: 11,
                              offset: Offset(0, 11),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x0CCDBFB2),
                              blurRadius: 15,
                              offset: Offset(0, 25),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x02CDBFB2),
                              blurRadius: 18,
                              offset: Offset(0, 45),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x00CDBFB2),
                              blurRadius: 20,
                              offset: Offset(0, 71),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: ProjectsListView(Utils.projectList, viewModel,
                            (index) async {
                          Utils.selectedProjectId =
                              Utils.projectList.elementAt(index).projectId;
                          Utils.selectProjectText =
                              Utils.projectList.elementAt(index).projectName;
                          await Utils.getPreference().setString(
                              Utils.projectName, Utils.selectProjectText);
                          print(Utils.selectProjectText);
                          Utils.selectedSubTask = "";
                          Utils.selectedSubTaskId = 0;
                          setState(() {});
                            })),
                    GestureDetector(
                      onTap: () async {
                       // if (Utils.selectedProjectId == 0) {
                          InCompleteTaskList incompleteTashList = await getMyTaskList(
                              Utils.selectedProjectId,
                              Utils.userInformation!.data.userAuthentication
                                  .employeeId);
                          Utils.taskList =
                              incompleteTashList.data.getInCompleteTasks;
                          if (viewModel.timerState) viewModel.handleStopTimer();
                          Navigator.pop(context);
                          viewModel.refreshUI();
                       // }
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          width: double.infinity,
                          height: 48.Sh,
                          decoration: ShapeDecoration(
                            color: Utils.selectedProjectId != 0 ? Color(0xFF1589CA) : Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: AppTextStyle.textStylePoppins16w500,
                            ),
                          )),
                    ),
                  ],
                ),
              );
            }
          );
        });
  }

  void showTaskBottomSheet(BuildContext context, DashboardViewModel viewModel) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true, // Allow for custom height
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) {
              return Container(
                decoration: const ShapeDecoration(
                    color: Color(0xFFF8F5F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 23.Sh),
                    Flexible(
                      child: Text(
                        Utils.selectProjectText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyle.textStylePoppins16w600,
                      ),
                    ),
                    SizedBox(height: 10.Sh),
                    Container(
                        margin: EdgeInsets.all(20),
                        width: double.infinity,
                        height:
                            300.Sh, //MediaQuery.of(context).size.height/2 - 80.Sh,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x19CDBFB2),
                              blurRadius: 6,
                              offset: Offset(0, 3),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x16CDBFB2),
                              blurRadius: 11,
                              offset: Offset(0, 11),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x0CCDBFB2),
                              blurRadius: 15,
                              offset: Offset(0, 25),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x02CDBFB2),
                              blurRadius: 18,
                              offset: Offset(0, 45),
                              spreadRadius: 0,
                            ),
                            BoxShadow(
                              color: Color(0x00CDBFB2),
                              blurRadius: 20,
                              offset: Offset(0, 71),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: SubTaskListView(Utils.taskList, viewModel,(index) async {
                          setState(() {});
                        })),
                    GestureDetector(
                      onTap: () async {
                       // if(Utils.selectedSubTaskId != 0 ) {
                          print("Utils.selectedSubTaskId  ${Utils
                              .selectedSubTaskId }");
                          InCompleteTaskList incompleteTashList = await getMyTaskList(
                              Utils.selectedProjectId,
                              Utils.userInformation!.data.userAuthentication
                                  .employeeId);
                          Utils.taskList =
                              incompleteTashList.data.getInCompleteTasks;
                          Navigator.pop(context);
                          viewModel.refreshUI();
                       // }
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                          width: double.infinity,
                          height: 48.Sh,
                          decoration: ShapeDecoration(
                            color: Utils.selectedSubTaskId != 0 ? Color(0xFF1589CA) : Colors.grey,                        shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: AppTextStyle.textStylePoppins16w500,
                            ),
                          )),
                    ),
                  ],
                ),
              );
            }
          );
        });
  }

  void openBottomOptions(BuildContext context, DashboardViewModel viewModel) {
    showModalBottomSheet(
        context: context,
        builder: (context) => IntrinsicHeight(
          child: Container(
            // Background container
            width: double.infinity,
            decoration: const ShapeDecoration(
              color: Color(0xFFF8F5F0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
            child: Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19CDBFB2),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x16CDBFB2),
                    blurRadius: 11,
                    offset: Offset(0, 11),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x0CCDBFB2),
                    blurRadius: 15,
                    offset: Offset(0, 25),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x02CDBFB2),
                    blurRadius: 18,
                    offset: Offset(0, 45),
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: Color(0x00CDBFB2),
                    blurRadius: 20,
                    offset: Offset(0, 71),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // Arrange rows vertically
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  // Align rows to the left
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.pop(context);
                        Utils.showProgressBottomSheet(context, "Syncing Time to Server", false);
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.pop(context);
                          Utils.showBottomSheet(context, Icons.done, Colors.green, "Sync time");

                        });

                        TaskQueue.sinkQueueToServer(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: 5),
                        child: Row(
                          children: [
                            Utils.getIcon(
                                "assets/images/watch.png",
                                24,
                                24),
                            const SizedBox(width: 11),
                            Text(
                              viewModel.getSyncTimeText(),
                              style: AppTextStyle
                                  .textStylePoppins22w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Add spacing between rows
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        Utils.showBottomSheet(context, Icons.done, Colors.green, "Cleared Task Queue");
                        TaskQueue.clearQueue();
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: 5),
                        child: Row(
                          children: [
                            // Add widgets for the second row here
                            Utils.getIcon(
                                "assets/images/delete.png",
                                24,
                                24),
                            const SizedBox(width: 11),
                            Text(
                              viewModel
                                  .getClearCacheText(),
                              style: AppTextStyle
                                  .textStylePoppins22w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Add spacing between rows
                    GestureDetector(
                      onTap: () {
                        print("logout");
                        Navigator.pop(context);
                        viewModel.logout(context);
                      },
                      child: Container(
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric(
                            vertical: 5),
                        child: Row(
                          children: [
                            // Add widgets for the second row here
                            Utils.getIcon(
                                "assets/images/logout.png",
                                24,
                                24),
                            const SizedBox(width: 11),
                            Text(
                              viewModel.getLogOutText(),
                              style: AppTextStyle
                                  .textStylePoppins22w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
