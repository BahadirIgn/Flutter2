import 'dart:async';

class TimerService {
  late Timer _timer;
  Duration remainingTime;
  final Duration initialDuration;
  final void Function() onTick;
  final void Function() onComplete;

  bool isRunning = false;

  TimerService({
    required this.initialDuration,
    required this.onTick,
    required this.onComplete,
  }) : remainingTime = initialDuration;

  void start() {
    if (isRunning) return;
    isRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (remainingTime > Duration.zero) {
        remainingTime -= const Duration(seconds: 1);
        onTick();
      } else {
        stop();
        onComplete();
      }
    });
  }

  void stop() {
    if (!isRunning) return;
    _timer.cancel();
    isRunning = false;
  }

  void pause() {
    if (isRunning) {
      _timer.cancel();
      isRunning = false;
    }
  }

  void reset() {
    stop();
    remainingTime = initialDuration;
    onTick();
  }

  void increaseDuration(Duration duration) {
    remainingTime += duration;
    onTick();
  }

  void decreaseDuration(Duration duration) {
    if (remainingTime > duration) {
      remainingTime -= duration;
    } else {
      remainingTime = Duration.zero;
    }
    onTick();
  }

  void dispose() {
    if (isRunning) {
      _timer.cancel();
    }
  }
}
