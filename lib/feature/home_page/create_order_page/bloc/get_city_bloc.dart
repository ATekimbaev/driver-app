import 'package:bloc/bloc.dart';
import 'package:driver/feature/home_page/create_order_page/models/city_model.dart';
import 'package:driver/feature/home_page/create_order_page/repositories/get_city_repo.dart';
import 'package:meta/meta.dart';

part 'get_city_event.dart';
part 'get_city_state.dart';

class GetCityBloc extends Bloc<GetCityEvent, GetCityState> {
  GetCityBloc({required this.repo}) : super(GetCityInitial()) {
    on<GetCityListEvent>(
      (event, emit) async {
        try {
          final model = await repo.getCityList(event.cityName);
          emit(
            GetCitySucces(model: model),
          );
        } catch (e) {
          emit(GetCityError());
        }
      },
    );
  }

  final GetCityRepo repo;
}
