import 'package:bloc/bloc.dart';
import 'package:driver/feature/home_page/drivers_page/models/order_model/order_model.dart';
import 'package:driver/feature/home_page/drivers_page/repository/oreders_repository.dart';
import 'package:meta/meta.dart';

part 'get_drivers_order_event.dart';
part 'get_drivers_order_state.dart';

class GetDriversOrderBloc
    extends Bloc<GetDriversOrderEvent, GetDriversOrderState> {
  GetDriversOrderBloc({required this.repository})
      : super(GetDriversOrderInitial()) {
    on<GetNewDriversOrderEvent>(
      (event, emit) async {
        try {
          final model = await repository.getDriversOrder();
          emit(GetDriversOrderSuccess(model: model));
        } catch (e) {
          emit(GetDriversOrderError());
        }
      },
    );
    on<GetNewPassengersOrderEvent>(
      (event, emit) async {
        try {
          final model = await repository.getPassangersOrder();
          emit(GetPassengersOrderSuccess(model: model));
        } catch (e) {
          emit(GetDriversOrderError());
        }
      },
    );
    on<GetAllOrdersEvent>(
      (event, emit) async {
        try {
          final model = await repository.getAllOrders();
          emit(GetAllOrderSuccess(model: model));
        } catch (e) {
          emit(GetDriversOrderError());
        }
      },
    );
  }
  final GetOrederRepository repository;
}
