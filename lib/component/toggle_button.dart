import 'package:flutter/material.dart';

import '../utils/utils.dart';

const List<Widget> priorityItems = <Widget>[
  Text('Low'),
  Text('Medium'),
  Text('High')
];

class TButtons extends StatefulWidget {

  Function(dynamic index) callabck;

  TButtons(this.callabck, {super.key});

  @override
  State<TButtons> createState() => _ToggleButtonsSampleState();
}

class _ToggleButtonsSampleState extends State<TButtons> {
  final List<bool> _selectedPriority = <bool>[true, false, false];
  var priorityItemNames = ["Low", "Medium", "High"];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Center(
      child: ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    widget.callabck.call(priorityItemNames[index]);
                    setState(() {
                      // The button that is tapped is set to true, and the others to false.
                      for (int i = 0; i < _selectedPriority.length; i++) {
                        _selectedPriority[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: Utils.highlightColor,
                  selectedColor: Colors.black,
                  fillColor: Utils.highlightColor,
                  color: Colors.black,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  isSelected: _selectedPriority,
                  children: priorityItems,
                ),
    );
  }
}

