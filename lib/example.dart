import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> texts = ["Text 1", "Text 2", "Text 3", "Text 4", "Text 5"];
  TextEditingController textFieldController = TextEditingController();

  String selectedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Selection and TextField"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (String text in texts)
                ContainerButton(
                  text,
                  onTap: () {
                    setState(() {
                      selectedText = text;
                    });
                  },
                ),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Selected Text: $selectedText',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: textFieldController,
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Handle button click, print the selected text and the text in the TextField
              print('Selected Text: $selectedText');
              print('Entered Text: ${textFieldController.text}');
            },
            child: Text('Print Texts'),
          ),
        ],
      ),
    );
  }

  Widget ContainerButton(String text, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
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
