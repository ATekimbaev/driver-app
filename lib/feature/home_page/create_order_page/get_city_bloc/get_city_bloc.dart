import 'package:bloc/bloc.dart';
import 'package:driver/feature/home_page/create_order_page/models/city_model/city_model.dart';
import 'package:driver/feature/home_page/create_order_page/repositories/get_city_repo.dart';
import 'package:meta/meta.dart';

import '../models/city_model/city_details.dart';

part 'get_city_event.dart';
part 'get_city_state.dart';

class GetCityBloc extends Bloc<GetCityEvent, GetCityState> {
  GetCityBloc({required this.repo}) : super(GetCityInitial()) {
    on<GetCityListEvent>(
      (event, emit) async {
        emit(GetCityLoading());

        try {
          if (cityName != event.cityName) {
            cityName = event.cityName;
            items = [];
            page = 0;
            print('${event.cityName}, qweqwopeklajdfls');
          }
          page++;

          final model = await repo.getCityList(
            event.cityName,
            page,
          );

          totalPage = model.totalPages ?? 1;

          items.addAll(
            model.cityDetails?.toList() ?? [],
          );
          emit(
            GetCitySucces(model: items),
          );
        } catch (e) {
          print(e);
          emit(GetCityError());
        }
      },
    );
  }
  List<CityDetails> items = [];
  final GetCityRepo repo;
  int page = 0;
  int totalPage = 1;
  String cityName = '';
}
