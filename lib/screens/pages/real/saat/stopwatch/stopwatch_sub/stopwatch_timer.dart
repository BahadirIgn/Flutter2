import 'dart:async';

class StopwatchTimerService {
  late Stopwatch _stopwatch;
  Timer? _timer;
  Duration currentDuration = Duration.zero;
  final void Function() onTick;
  final List<Duration> laps = [];

  StopwatchTimerService({required this.onTick}) {
    _stopwatch = Stopwatch();
  }

  void start() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      currentDuration = _stopwatch.elapsed;
      onTick();
    });
  }

  void stop() {
    _stopwatch.stop();
    _timer?.cancel();
  }

  void reset() {
    stop();
    _stopwatch.reset();
    currentDuration = Duration.zero;
    laps.clear();
    onTick();
  }

  void lap() {
    laps.add(currentDuration);
    onTick();
  }

  bool get isRunning => _stopwatch.isRunning;
}
