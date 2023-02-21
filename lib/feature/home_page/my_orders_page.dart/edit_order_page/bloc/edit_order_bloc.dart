import 'package:bloc/bloc.dart';
import 'package:driver/feature/home_page/my_orders_page.dart/edit_order_page/repo/edit_order_repo.dart';
import 'package:meta/meta.dart';

import '../../../create_order_page/models/order_model.dart';

part 'edit_order_event.dart';
part 'edit_order_state.dart';

class EditOrderBloc extends Bloc<EditOrderEvent, EditOrderState> {
  EditOrderBloc({required this.repo}) : super(EditOrderInitial()) {
    on<SendNewDataEvent>((event, emit) async {
      try {
        await repo.editOrder(id: event.id, model: event.model);
        emit(EditOrderSucces());
      } catch (e) {
        print(e);
        emit(EditOrderError());
      }
    });
    on<DeleteOrder>((event, emit) async {
      try {
        await repo.deleteOrder(
          id: event.id,
        );
        emit(EditOrderSucces());
      } catch (e) {
        print(e);
        emit(EditOrderError());
      }
    });
  }
  final EditOredrRepo repo;
}
