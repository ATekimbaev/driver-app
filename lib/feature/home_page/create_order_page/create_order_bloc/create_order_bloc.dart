import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:driver/feature/home_page/create_order_page/repositories/send_order_repo.dart';
import 'package:meta/meta.dart';

import '../models/order_model.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  CreateOrderBloc({required this.repository}) : super(CreateOrderInitial()) {
    on<CreateNewOrederEvent>(
      (event, emit) async {
        try {
          await repository.sendNewOrder(model: event.model);
          emit(CreateOrderSuccess());
        } on DioError catch (e) {
          emit(
            CreateOrderError(errorMessage: e.response?.data.toString() ?? ''),
          );
        } catch (e) {
          emit(CreateOrderError(errorMessage: 'Error'));
        }
      },
    );
  }
  final SendOrderRepository repository;
}
