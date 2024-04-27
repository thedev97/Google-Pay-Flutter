import 'package:equatable/equatable.dart';
import 'package:g_pay/core/g_pay_export.dart';

part 'g_pay_event.dart';

part 'g_pay_state.dart';

class GPayBloc extends Bloc<GPayEvent, GPayState> {
  GPayBloc(super.initialState) {
    on<GPayInitialEvent>(_onInitialize);
  }

  void _onInitialize(
    GPayInitialEvent event,
    Emitter<GPayState> emit,
  ) async {
    emit(state.copyWith());
  }
}
