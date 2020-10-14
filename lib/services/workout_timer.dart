import 'dart:async';

class WorkoutTimer{

  Stopwatch stopwatch = Stopwatch();


  void startTimer(){
    stopwatch.start();
  }

  int getElapsedTime(){
    return stopwatch.elapsed.inSeconds;
  }


}