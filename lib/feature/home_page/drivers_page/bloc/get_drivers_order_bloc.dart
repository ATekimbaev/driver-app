import 'package:bloc/bloc.dart';
import 'package:driver/feature/home_page/drivers_page/models/order_model.dart';
import 'package:driver/feature/home_page/drivers_page/repository/get_oreder_repository.dart';
import 'package:meta/meta.dart';

part 'get_drivers_order_event.dart';
part 'get_drivers_order_state.dart';

class GetDriversOrderBloc
    extends Bloc<GetDriversOrderEvent, GetDriversOrderState> {
  GetDriversOrderBloc({required this.repository})
      : super(GetDriversOrderInitial()) {
    on<GetNewDriversOrderEvent>((event, emit) async {
      try {
        final model = await repository.getDriversOrder();
        emit(GetDriversOrderSuccess(model: model));
      } catch (e) {
        emit(GetDriversOrderError());
      }
    });
  }
  final GetOrederRepository repository;
}
