import 'package:flutter/material.dart';

class KestralPage extends StatefulWidget {
  @override
  KestralPageState createState() => KestralPageState();
}

class KestralPageState extends State<KestralPage> {
  TextEditingController passwordController = TextEditingController();
  var valueChoose;
  var _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView( // Add this to enable scrolling
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: ShapeDecoration(
                  color: Color(0xFFF6F3EE),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                  children: [
                    SizedBox(height: 20,),
                    Image.asset("assets/Group 934.png"),
                    SizedBox(height: 30,),
                    Text(
                      'Hey! Good Morning',
                      style: TextStyle(
                        color: Color(0xFF252525),
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        height: 0.06,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(right: 280),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally within Row
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xFF252525),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(right: 240),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally within Row
                  children: [
                    Text(
                      'Email Address',
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
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 320,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child:TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: '',
                    ),
                  ),
                  ),
                ),
        SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.only(right: 260),
            child: Text(
              'Password',
              style: TextStyle(
                color: Color(0xFF252525),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0.11,
              ),
            )
        ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  width: 320,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    obscureText: _obscureText, // Initially obscure text
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '',
                      suffixIcon: IconButton(
                        icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 320,
                height: 48,
                decoration: ShapeDecoration(
                  color: Color(0xFF1589CA),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: ElevatedButton( // Replace with your preferred button type if needed
                  onPressed: () {
                    // Code to execute when button is pressed
                  },
                  child: Text('Log in'), // Adjust text as needed
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF1589CA), // Match the Container's color
                    onPrimary: Colors.white, // Set text color
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), // Match shape
                  ),
                ),
              ),
              SizedBox(height: 30,),
            /* Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
             Container(
               width: 64,
               height: 64,
               decoration: ShapeDecoration(
                 color: Color(0xFFF6F3EE),
                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
               ),
             child: Image.asset("assets/image 6.png"),
             ),
                 SizedBox(width: 15,),
                 Container(
                   width: 64,
                   height: 64,
                   decoration: ShapeDecoration(
                     color: Color(0xFFF6F3EE),
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                   ),
                   child: Image.asset("assets/image 7.png"),
                 ),
        ],
             ),*/
            ],
          ),
        ),
    );
  }
}