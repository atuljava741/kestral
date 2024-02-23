import 'package:flutter/material.dart';
import 'package:kestral/utils/utils.dart';

class NextPage extends StatefulWidget {
  @override
  KestrelProPageState createState() => KestrelProPageState();
}

class KestrelProPageState extends State<NextPage> {
  final items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
       child: Stack(
        children: [
          Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height/2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFFF7F4EF), Color(0xFFFFE7A0)],
                    ),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Utils.getIcon("assets/logo.png", 72, 56),
                      SizedBox(height: 70),
                      const Text(
                        '00:00',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF52452F),
                          fontSize: 72,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.02,
                        ),
                      ),
                      SizedBox(height: 60),
                      const Text(
                        'Select a task or create one to start tracking',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF252525),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          child: Stack(
                            children: [
                              Center(
                                  child:Utils.getIcon("assets/bottom_layer.png", 120, 120)),
                              Center(
                                child: Opacity(
                                  opacity: 0.20,
                                  child: Container(
                                    width: 85,
                                    height: 85,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          left: 0,
                                          top: 0,
                                          child: Container(
                                            width: 85,
                                            height: 85,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFF52452F),
                                              shape: OvalBorder(
                                                side: BorderSide(width: 5, color: Colors.white),
                                              ),
                                              shadows: [
                                                BoxShadow(
                                                  color: Color(0x3F000000),
                                                  blurRadius: 16,
                                                  offset: Offset(0, 8),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 20.92,
                                          top: 20.92,
                                          child: Container(
                                            width: 49.16,
                                            height: 49.16,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Stack(children: [

                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Center(child: Utils.getIcon("assets/play.png", 60, 60),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            SizedBox(
              height: 120,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                Container(
                  width: 320,
                  height: 64,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFBFAFA),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                    Container(
                      width: 256,
                      height: 64,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x19969696),
                            blurRadius: 3,
                            offset: Offset(2, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x16969696),
                            blurRadius: 6,
                            offset: Offset(6, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x0C969696),
                            blurRadius: 8,
                            offset: Offset(14, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x02969696),
                            blurRadius: 10,
                            offset: Offset(25, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x00969696),
                            blurRadius: 11,
                            offset: Offset(39, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'PROJECT',
                                style: TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0.11,
                                ),
                              )
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                iconSize: 25,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.black),
                                isExpanded: true,
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value = value),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 265,top: 10),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: ShapeDecoration(
                        color: Color(0xFF1589CA),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Utils.getIcon("assets/refresh_image.png.png", 72, 56),
                    ),
                    ),
            ],
                ),
            ],
            ),
            SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 320,
                      height: 64,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFBFAFA),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                    Container(
                      width: 256,
                      height: 64,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Color(0x19969696),
                            blurRadius: 3,
                            offset: Offset(2, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x16969696),
                            blurRadius: 6,
                            offset: Offset(6, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x0C969696),
                            blurRadius: 8,
                            offset: Offset(14, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x02969696),
                            blurRadius: 10,
                            offset: Offset(25, 0),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x00969696),
                            blurRadius: 11,
                            offset: Offset(39, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'TASK',
                                  style: TextStyle(
                                    color: Color(0xFF252525),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.11,
                                  ),
                                ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: value,
                                iconSize: 25,
                                icon: const Icon(Icons.arrow_drop_down,
                                    color: Colors.grey),
                                isExpanded: true,
                                items: items.map(buildMenuItem).toList(),
                                onChanged: (value) =>
                                    setState(() => this.value = value),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 265,top: 10),
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: ShapeDecoration(
                          color: Color(0xFF1589CA),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Icon(Icons.add_circle_outline,color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        ],
       ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(
              fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      );
}


/** Center(
    child: Container(
    width: 120,
    height: 120,
    child: Stack(
    children: [
    Center(
    child:Utils.getIcon("assets/bottom_layer.png", 120, 120)),
    Center(
    child: Opacity(
    opacity: 0.20,
    child: Container(
    width: 85,
    height: 85,
    child: Stack(
    children: [
    Positioned(
    left: 0,
    top: 0,
    child: Container(
    width: 85,
    height: 85,
    decoration: const ShapeDecoration(
    color: Color(0xFF52452F),
    shape: OvalBorder(
    side: BorderSide(width: 5, color: Colors.white),
    ),
    shadows: [
    BoxShadow(
    color: Color(0x3F000000),
    blurRadius: 16,
    offset: Offset(0, 8),
    spreadRadius: 0,
    )
    ],
    ),
    ),
    ),
    Positioned(
    left: 20.92,
    top: 20.92,
    child: Container(
    width: 49.16,
    height: 49.16,
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(),
    child: Stack(children: [

    ]),
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    Center(child: Utils.getIcon("assets/play.png", 60, 60),)
    ],
    ),
    ),
    ),**/