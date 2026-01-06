abstract class KalkulatorEvent {}

class HitungEvent extends KalkulatorEvent {
  final double angka1;
  final double angka2;
  final String operator;

  HitungEvent(this.angka1, this.angka2, this.operator);
}

class ResetEvent extends KalkulatorEvent {}
