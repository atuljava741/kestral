import 'dart:async';
import '../utils/utils.dart';
class TimeTracker{

  late DateTime startTime;
  late Timer timer;
  int elapsedSeconds = 0;

  Future<void> loadTimerFromSharedPreference() async {
    int storedTimestamp = Utils.getPreference().getInt(Utils.startTimestamp) ?? 0;
    startTime = storedTimestamp != 0 ? DateTime.fromMillisecondsSinceEpoch(storedTimestamp) : DateTime.now();
  }

  void startTimer(Null Function() function) {
    timer = Timer.periodic(Duration(minutes: 1), (Timer timer) {
      print("Sync To server according to timer");
      function.call();
    });
  }

  void stopTimer() {
    timer.cancel();
  }

  void _resetTimer() async {
    timer.cancel();
    elapsedSeconds = 0;
    startTime = DateTime.now();
    await Utils.getPreference().setInt(Utils.startTimestamp, startTime.millisecondsSinceEpoch);
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
