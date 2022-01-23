class task {
  int isDone;
  final text;
  task({required this.text, this.isDone = 0});
  void toogleisDone() {
    isDone = (isDone + 1) % 2;
  }
}
