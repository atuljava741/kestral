import 'package:flutter/material.dart';
import 'package:kestral/utils/utils.dart';


class KestralScreen extends StatefulWidget {
  @override
  State<KestralScreen> createState() => KestralScreenState();
}

class KestralScreenState extends State<KestralScreen> {
  final items = ["Item 1", "Item 2", "Item 3", "Item 4"];
  final selectItems = ["Kestrel Pro Dev","Healthy Lives","Project Firefly","Tracker Mobile App","Lorem Ipsum","New Project"];
  final setectTask = ["Tasks","Dev pro","Dashboard","Presentation Creation","AI Feature","Drag & Drop Functionality","Payment Gateway"];
  String? value;
  String?selectValue;
  bool showCheckIcon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F5F0),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: MediaQuery.of(context).size.height / 2,
            left: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.only(left: 10,right: 10),
              padding: EdgeInsets.only(top:50),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [Color(0xFFF7F4EF), Color(0xFFFFE7A0)],
                ),
              ),
              child: Column(
                children: [
                  Utils.getIcon("assets/logo.png", 72, 64),
                  SizedBox(height: 60),
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
                    'Select a task or create one to start',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  ),
                  SizedBox(height: 20,),
                  const Text(
                    'tracking',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF252525),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      height: 0.10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
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
                          GestureDetector( // Wrap the Container with a GestureDetector
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true, // Allow for custom height
                                  builder: (context) {
                                    return Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 470,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFFF8F5F0),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16),
                                                topRight: Radius.circular(16),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
                                          child: Container(
                                            width: double.infinity,
                                            height: 312,
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
                                            child: Stack(
                                              children: [
                                                Column( // Arrange rows vertically
                                                  crossAxisAlignment: CrossAxisAlignment.start, // Align rows to the left
                                                  children: [
                                                    SizedBox(height: 12,),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 48,
                                                      decoration: const BoxDecoration(color: Color(0xFFDDF3FF),
                                                      ),
                                                      child:  Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            selectItems[0],
                                                            textAlign: TextAlign.center, // Center text horizontally
                                                            style: const TextStyle(
                                                              color: Color(0xFF252525),
                                                              fontSize: 15,
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w400,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 48,
                                                      decoration: const BoxDecoration(color: Colors.white,
                                                      ),
                                                      child:  Padding(
                                                        padding: EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            selectItems[1],
                                                            textAlign: TextAlign.center, // Center text horizontally
                                                            style: const TextStyle(
                                                              color: Color(0xFF252525),
                                                              fontSize: 15,
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w400,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 48,
                                                      decoration: const BoxDecoration(color: Colors.white,
                                                      ),
                                                      child:  Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            selectItems[2],
                                                            textAlign: TextAlign.center, // Center text horizontally
                                                            style: const TextStyle(
                                                              color: Color(0xFF252525),
                                                              fontSize: 15,
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w400,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 48,
                                                      decoration: const BoxDecoration(color: Colors.white,
                                                      ),
                                                      child:  Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            selectItems[3],
                                                            textAlign: TextAlign.center, // Center text horizontally
                                                            style: const TextStyle(
                                                              color: Color(0xFF252525),
                                                              fontSize: 15,
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w400,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 48,
                                                      decoration: const BoxDecoration(color: Colors.white,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            selectItems[4],
                                                            textAlign: TextAlign.center, // Center text horizontally
                                                            style: const TextStyle(
                                                              color: Color(0xFF252525),
                                                              fontSize: 15,
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w400,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 48,
                                                      decoration: const BoxDecoration(color: Colors.white,
                                                      ),
                                                      child:  Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            selectItems[5],
                                                            textAlign: TextAlign.center, // Center text horizontally
                                                            style: const TextStyle(
                                                              color: Color(0xFF252525),
                                                              fontSize: 15,
                                                              fontFamily: 'Poppins',
                                                              fontWeight: FontWeight.w400,
                                                              height: 0.11,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 20,right: 20,top: 401,bottom: 20),
                                          child: Container(
                                              width: double.infinity,
                                              height: 48,
                                              decoration: ShapeDecoration(
                                                color: const Color(0xFF1589CA),
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Continue',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w500,
                                                    height: 0,
                                                  ),
                                                ),
                                              )
                                          ),
                                        ),
                                        const Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 23,bottom: 21),
                                              child: Text(
                                                'Select Project',
                                                style: TextStyle(
                                                  color: Color(0xFF252525),
                                                  fontSize: 16,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.06,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  }
                              );
                            },
                            child: Container(
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
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 13,top: 14),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'PROJECT',
                                              style: TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Kestrel pro dev',
                                              style: TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                                height: 0.05,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(right: 18),
                                              child: Icon(Icons.arrow_drop_down,color: Colors.black),
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
                padding: EdgeInsets.only(left: 265, top: 10),
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return Container(
                            width: double.infinity,
                            height: 96,
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                showCheckIcon
                                    ? const Icon(Icons.check, size: 32, color: Colors.green)
                                    : const CircularProgressIndicator(color: Colors.black,),
                              const SizedBox(width: 13,),
                              const Text(
                                'Refreshing Project List',
                                style: TextStyle(
                                  color: Color(0xFF252525),
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 0.06,
                                ),
                              )
                          ],
                          ),
                              ],
                            ),
                          );
                        },
                      ),
                    );

                    // Simulate loading for 2 seconds
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        showCheckIcon = true;
                      });
                    });
                  },
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
                      child: Utils.getIcon("assets/refresh_image.png.png", 72, 64),
                    ),
                  ),
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
                          GestureDetector( // Wrap the Container with a GestureDetector
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => Stack( // Wrap the bottom sheet content with a Stack
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 475,
                                      decoration: const ShapeDecoration(
                                        color: Color(0xFFF8F5F0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
                                      child: Container(
                                        width: double.infinity,
                                        height: 333,
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
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 25),
                                              child: Column( // Arrange rows vertically
                                                crossAxisAlignment: CrossAxisAlignment.start, // Align rows to the left
                                                children: [
                                                  const SizedBox(height: 12,),
                                                   Padding(
                                                    padding: const EdgeInsets.only(left: 16),
                                                    child: Text(
                                                      setectTask[0],
                                                      style: const TextStyle(
                                                        color: Color(0xFF848484),
                                                        fontSize: 14,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w600,
                                                        height: 0.08,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5,),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 48,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 16),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          setectTask[1],
                                                          textAlign: TextAlign.center, // Center text horizontally
                                                          style: const TextStyle(
                                                            color: Color(0xFF252525),
                                                            fontSize: 15,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            height: 0.11,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 48,
                                                    decoration: const BoxDecoration(color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(left: 16),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          setectTask[2],
                                                          textAlign: TextAlign.center, // Center text horizontally
                                                          style: const TextStyle(
                                                            color: Color(0xFF252525),
                                                            fontSize: 15,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            height: 0.11,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 48,
                                                    decoration: const BoxDecoration(color: Color(0xFFDDF3FF),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 16),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          setectTask[3],
                                                          textAlign: TextAlign.center, // Center text horizontally
                                                          style: const TextStyle(
                                                            color: Color(0xFF252525),
                                                            fontSize: 15,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            height: 0.11,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 48,
                                                    decoration: const BoxDecoration(color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 16),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          setectTask[4],
                                                          textAlign: TextAlign.center, // Center text horizontally
                                                          style: const TextStyle(
                                                            color: Color(0xFF252525),
                                                            fontSize: 15,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            height: 0.11,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 48,
                                                    decoration: const BoxDecoration(color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 16),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          setectTask[5],
                                                          textAlign: TextAlign.center, // Center text horizontally
                                                          style: const TextStyle(
                                                            color: Color(0xFF252525),
                                                            fontSize: 15,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            height: 0.11,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    height: 48,
                                                    decoration: const BoxDecoration(color: Colors.white,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 16),
                                                      child: Align(
                                                        alignment: Alignment.centerLeft,
                                                        child: Text(
                                                          setectTask[6],
                                                          textAlign: TextAlign.center, // Center text horizontally
                                                          style: const TextStyle(
                                                            color: Color(0xFF252525),
                                                            fontSize: 15,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w400,
                                                            height: 0.11,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20,right: 20,top: 410,bottom: 20),
                                      child: Container(
                                          width: double.infinity,
                                          height: 48,
                                          decoration: ShapeDecoration(
                                            color: const Color(0xFF1589CA),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Continue',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                                height: 0,
                                              ),
                                            ),
                                          )
                                      ),
                                    ),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 23,bottom: 21),
                                          child: Text(
                                            'Project Firefly ',
                                            style: TextStyle(
                                              color: Color(0xFF252525),
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              height: 0.08,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Container(
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
                              child:  Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 13,top: 14),
                                    child: Column(
                                      children: [
                                       const Row(
                                          children: [
                                            Text(
                                              'TASK',
                                              style: TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 12,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.11,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Dashboard Module',
                                              style: TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                                height: 0.11,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(right: 28),
                                              child: Utils.getIcon("assets/dropdown.png", 18, 18),
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
                            padding: EdgeInsets.only(left: 265, top: 10),
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true, // Allow for custom height
                                    builder: (context) {
                                      return Stack(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context).size.height * 0.9,
                                            decoration: const ShapeDecoration(
                                              color: Color(0xFFF8F5F0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,right: 20,top: 137),
                                            child: Container(
                                              width: double.infinity,
                                              height: 255,
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
                                              child: Stack(
                                                children: [
                                                  Column( // Arrange rows vertically
                                                    crossAxisAlignment: CrossAxisAlignment.start, // Align rows to the left
                                                    children: [
                                                      SizedBox(height: 12,),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 48,
                                                        decoration: const BoxDecoration(color: Color(0xFFDDF3FF),
                                                        ),
                                                        child: const Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              'Development',
                                                              textAlign: TextAlign.center, // Center text horizontally
                                                              style: TextStyle(
                                                                color: Color(0xFF252525),
                                                                fontSize: 15,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w400,
                                                                height: 0.11,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 48,
                                                        decoration: const BoxDecoration(color: Colors.white,
                                                        ),
                                                        child: const Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              'Testing',
                                                              textAlign: TextAlign.center, // Center text horizontally
                                                              style: TextStyle(
                                                                color: Color(0xFF252525),
                                                                fontSize: 15,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w400,
                                                                height: 0.11,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 48,
                                                        decoration: const BoxDecoration(color: Colors.white,
                                                        ),
                                                        child: const Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              'Project Management',
                                                              textAlign: TextAlign.center, // Center text horizontally
                                                              style: TextStyle(
                                                                color: Color(0xFF252525),
                                                                fontSize: 15,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w400,
                                                                height: 0.11,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 48,
                                                        decoration: const BoxDecoration(color: Colors.white,
                                                        ),
                                                        child: const Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              'Backend',
                                                              textAlign: TextAlign.center, // Center text horizontally
                                                              style: TextStyle(
                                                                color: Color(0xFF252525),
                                                                fontSize: 15,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w400,
                                                                height: 0.11,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: 48,
                                                        decoration: const BoxDecoration(color: Colors.white,
                                                        ),
                                                        child: const Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Align(
                                                            alignment: Alignment.centerLeft,
                                                            child: Text(
                                                              'Front end',
                                                              textAlign: TextAlign.center, // Center text horizontally
                                                              style: TextStyle(
                                                                color: Color(0xFF252525),
                                                                fontSize: 15,
                                                                fontFamily: 'Poppins',
                                                                fontWeight: FontWeight.w400,
                                                                height: 0.11,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(top: 56),
                                              child: Container(
                                                width: double.infinity,
                                                height: 1,
                                                decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                              )
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(top: 78,left: 24),
                                              child:  Container(
                                                child: const Text(
                                                  'Kestrel pro dev',
                                                  style: TextStyle(
                                                    color: Color(0xFF252525),
                                                    fontSize: 14,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.08,
                                                  ),
                                                ),
                                              )
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(top: 97),
                                              child: Container(
                                                width: double.infinity,
                                                height: 1,
                                                decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                                              ),
                                          ),
                                          const Padding(
                                              padding: const EdgeInsets.only(top: 120,left: 24),
                                              child:Text(
                                                'CATEGORY',
                                                style: TextStyle(
                                                  color: Color(0xFF848484),
                                                  fontSize: 14,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w600,
                                                  height: 0.08,
                                                ),
                                              )
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 410,left: 20,right: 20),
                                            child: Container(
                                              width: double.infinity,
                                              height: 93,
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
                                              child: const Padding(
                                                padding: const EdgeInsets.only(right: 16,left: 16,top: 20),
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    labelText: 'Task',
                                                    labelStyle:TextStyle(
                                                      color: Color(0xFF848484),
                                                      fontSize: 14,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w400,
                                                      height: 0.08,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 20,right: 20,top: 535,bottom: 20),
                                            child: Container(
                                                width: double.infinity,
                                                height: 48,
                                                decoration: ShapeDecoration(
                                                  color: const Color(0xFF1589CA),
                                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Add Task',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Poppins',
                                                      fontWeight: FontWeight.w500,
                                                      height: 0,
                                                    ),
                                                  ),
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 24,top: 14),
                                            child: Utils.getIcon("assets/rong.png.png", 28, 28),
                                          ),
                                          const Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 23,bottom: 21),
                                                child: Text(
                                                  'Create Task',
                                                  style: TextStyle(
                                                    color: Color(0xFF252525),
                                                    fontSize: 16,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0.06,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    }
                                );
                              },
                              child: Container(
                                width: 48,
                                height: 48,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF1589CA),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                ),
                                child: const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Icon(Icons.add_circle_outline, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Circular Play Button
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
              child:   Center(
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
                                        side: BorderSide(width: 8, color: Color(0XFFFFFFFF)),
                                      ),
                                      shadows: [
                                        BoxShadow(
                                          color: Color(0x3F000000),
                                          blurRadius: 50,
                                          offset: Offset(0, 8),
                                          spreadRadius: 3,
                                        )
                                      ],
                                    ),
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
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                height: 64,
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
                     Row( // Nested Row to group left-side elements
                      children: [
                        Utils.getIcon("assets/contact.png", 24, 24),
                        const SizedBox(width: 8), // Adjust spacing as needed
                        const Text(
                          'Adam Lang',
                          style: TextStyle(
                            color: Color(0xFF252525),
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0.06,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => Stack( // Wrap the bottom sheet content with a Stack
                            children: [
                              Container( // Background container
                                width: double.infinity,
                                height: 200,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFFF8F5F0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned( // Position the second container within the Stack
                                top: 20, // Adjust positioning as needed
                                left: 20,
                                right: 20,
                                child: Container(
                                  width: 320,
                                  height: 167,
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
                                    child: Column( // Arrange rows vertically
                                      crossAxisAlignment: CrossAxisAlignment.start, // Align rows to the left
                                      children: [
                                        Row(
                                          children: [
                                            Utils.getIcon("assets/watch.png", 24, 24),
                                            const SizedBox(width: 11),
                                            const Text(
                                              'Sync Time',
                                              style: TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24), // Add spacing between rows
                                        Row(
                                          children: [
                                            // Add widgets for the second row here
                                            Utils.getIcon("assets/delete.png", 24, 24),
                                            const SizedBox(width: 11),
                                            const Text(
                                              'Clear Cache',
                                              style: TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24), // Add spacing between rows
                                        Row(
                                          children: [
                                            // Add widgets for the second row here
                                            Utils.getIcon("assets/logout.png", 24, 24),
                                            const SizedBox(width: 11),
                                            const Text(
                                              'Logout',
                                              style: TextStyle(
                                                color: Color(0xFF252525),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Utils.getIcon("assets/threepoints.png", 24, 24),
                    ),// Right-side icon
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  DropdownMenuItem<String> buildMenuSelectItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(
          fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}