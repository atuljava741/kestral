import 'package:flutter/material.dart';
import 'package:kestral/utils/utils.dart';


class kestralPagePro extends StatefulWidget {
  @override
  State<kestralPagePro> createState() => kestralPageProState();
}

class kestralPageProState extends State<kestralPagePro> {
  String selectedText = '';

  List<String> texts = ['Text 1', 'Text 2', 'Text 3', 'Text 4', 'Text 5'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContainerButton(texts[0]),
              ContainerButton(texts[1]),
              ContainerButton(texts[2]),
              ContainerButton(texts[3]),
              ContainerButton(texts[4]),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Selected Text: $selectedText',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle button click, update the selectedText state
              setState(() {
                // Do any additional processing if needed
              });
            },
            child: Text('Show Selected Text'),
          ),
        ],
      ),
    );
  }

  // Custom container button widget
  Widget ContainerButton(String text) {
    return GestureDetector(
      onTap: () {
        // Handle container selection, update the selectedText state
        setState(() {
          selectedText = text;
        });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: selectedText == text ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}