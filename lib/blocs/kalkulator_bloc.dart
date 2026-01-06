import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/kalkulator_event.dart';
import '../states/kalkulator_state.dart';

class KalkulatorBloc extends Bloc<KalkulatorEvent, KalkulatorState> {
  KalkulatorBloc() : super(KalkulatorState(0)) {

    on<HitungEvent>((event, emit) {
      double result = 0;

      switch (event.operator) {
        case '+':
          result = event.angka1 + event.angka2;
          break;
        case '-':
          result = event.angka1 - event.angka2;
          break;
        case 'x':
          result = event.angka1 * event.angka2;
          break;
        case ':':
          result = event.angka2 == 0 ? 0 : event.angka1 / event.angka2;
          break;
      }

      emit(KalkulatorState(result));
    });

    on<ResetEvent>((event, emit) {
      emit(KalkulatorState(0));
    });
  }
}
