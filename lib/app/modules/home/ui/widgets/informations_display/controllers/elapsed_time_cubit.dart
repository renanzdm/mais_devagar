import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'elapsed_time_state.dart';

class ElapsedTimeCubit extends Cubit<ElapsedTimeState> {
  ElapsedTimeCubit(ElapsedTimeState initialState)
      : super(ElapsedTimeState.initialState());

  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void initTimeWatch() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (time) {
      emit(ElapsedTimeState.watchRunning(
          milliseconds: _stopwatch.elapsedMilliseconds));
    });
  }

  void stopWatch() {
    _stopwatch.stop();
    _timer?.cancel();
    emit(ElapsedTimeState.stopWatch(finalMilliseconds: 0));
  }

  bool isRunnig() {
    return _stopwatch.isRunning;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}















// class ElapsedTimeBloc extends Bloc<ElapsedTimeEvent, ElapsedTimeState> {
//   ElapsedTimeBloc(ElapsedTimeState initialState)
//       : super(ElapsedTimeStateInitial());
//   final Stopwatch _stopwatch = Stopwatch();
//   Timer? _timer;

//   @override
//   Stream<ElapsedTimeState> mapEventToState(ElapsedTimeEvent event) async* {
//     var state = ElapsedTimeState();
//     if (event is ElapsedTimeEventStart) {
//       state = _mapStartWatch();
//     } else if (event is ElapsedTimeEventGetTime) {
//       yield* _fetchEventsTime();
//     } else if (event is ElapsedTimeEventStop) {
//       state = _mapStopWatch();
//     }
//     yield state;
//   }

//   Stream<ElapsedTimeState> _fetchEventsTime() async* {
//     _timer = Timer.periodic(Duration(seconds: 1), (a) {
//       add(ElapsedTimeEventStart());
//     });
//   }

//   ElapsedTimeState _mapStartWatch() {
//     _stopwatch.start();
//     return ElapsedTimeStateWatchRunning(_stopwatch.elapsedMilliseconds);
//   }

//   bool verifyWatchIsRunnig() {
//     return _stopwatch.isRunning;
//   }

//   ElapsedTimeState _mapStopWatch() {
//     _stopwatch.reset();
//     _timer?.cancel();
//     return ElapsedTimeStateWatchStopped(finalMilliseconds: 0);
//   }

//   @override
//   Future<void> close() {
//     _timer?.cancel();
//     return super.close();
//   }
// }
