import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:kestral/apicalls/add_time_to_kestral.dart';

import '../utils/utils.dart';

class TaskQueue {
  static List<Map<String, dynamic>> get queue => getQueue();

  static List<Map<String, dynamic>> getQueue() {
    final jsonString = Utils.getPreference().getString('queue');
    if (jsonString != null) {
      final List<dynamic> decodedList = json.decode(jsonString);
      return decodedList.cast<Map<String, dynamic>>();
    } else {
      return [];
    }
  }

  static Future<void> addToQueue(Map<String, dynamic> element) async {
    List<Map<String, dynamic>> newQueue = [...queue, element];
    await Utils.getPreference().setString('queue', jsonEncode(newQueue));
  }

  static Future<void> sinkQueueToServer(BuildContext context) async {
    List<int> indicesToRemove = [];
    String errorMessage = "";
    for (int i = 0; i < queue.length; i++) {
      Map<String, dynamic> data = queue.elementAt(i);
      print("inkQueueToServer   :" +
          data["durationFrom"] +
          " - " +
          data["durationTo"]);
      String b = await addTimeToKestral(data);
      if (b == "true") {
        indicesToRemove.add(i);
      } else {
        errorMessage = b;
      }
    }
    await removeElementsAtIndex(indicesToRemove);

    if (Utils.errorCode == "PROCESS_CACHE_AND_LOGOUT" && errorMessage.length > 5) {
      Utils.showLogoutDialog(context, "Alert", errorMessage, () => {},
          hideLaterButton: true);
    } else {
      if (errorMessage.length > 5) {
        Utils.showCustomDialog(context, "Alert", errorMessage);
      }
    }

  }

  static Future<void> removeElementsAtIndex(List<int> indicesToRemove) async {
    indicesToRemove.sort((a, b) => b.compareTo(a));

    for (var index in indicesToRemove) {
      if (index >= 0 && index < queue.length) {
        await _removeElement(index);
      }
    }
  }

  static Future<void> _removeElement(int index) async {
    List<Map<String, dynamic>> newQueue = [...queue];
    newQueue.removeAt(index);
    await Utils.getPreference().setString('queue', jsonEncode(newQueue));
  }

  static Future<void> clearQueue() async {
    await Utils.getPreference().remove('queue');
    print("Queue Cleared $queue");
  }

  static Future<void> _setQueue(List<Map<String, dynamic>> newQueue) async {
    await Utils.getPreference().setString('queue', jsonEncode(newQueue));
  }
}
