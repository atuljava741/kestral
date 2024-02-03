import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

class TaskQueue{
  List<Map<String, dynamic>> queue = [];

  Future<void> _initQueue() async {
    _loadQueue();
  }

  void _loadQueue() {
    // Load the queue from SharedPreferences
    final jsonString = Utils.getPreference().getString('queue');
    if (jsonString != null) {
      final List<dynamic> decodedList = json.decode(jsonString);
      queue = decodedList.cast<Map<String, dynamic>>();
    }
  }

  void _saveQueue() {
    // Save the queue to SharedPreferences
    final jsonString = json.encode(queue);
    Utils.getPreference().setString('queue', jsonString);
  }

  void _addToQueue(Map<String, dynamic> element) {
    queue.add(element);
    _saveQueue();
    _loadQueue(); // Refresh the UI
  }

  Map<String, dynamic>? _getFromQueue() {
    if (queue.isNotEmpty) {
      final element = queue.removeAt(0);
      _saveQueue();
      _loadQueue(); // Refresh the UI
      return element;
    }
    return null;
  }

  int _getQueueSize() {
    return queue.length;
  }

  void _clearQueue() {
    queue.clear();
    _saveQueue();
    _loadQueue(); // Refresh the UI
  }

}