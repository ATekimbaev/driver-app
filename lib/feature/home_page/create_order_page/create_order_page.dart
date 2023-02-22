import 'package:driver/core_data/theme/app_fonts.dart';
import 'package:driver/core_data/ui/widgets/custom_button.dart';
import 'package:driver/core_data/ui/widgets/custom_text_field.dart';
import 'package:driver/feature/home_page/create_order_page/create_order_bloc/create_order_bloc.dart';
import 'package:driver/feature/home_page/create_order_page/models/city_model/city_details.dart';
import 'package:driver/feature/home_page/create_order_page/models/city_model/city_model.dart';
import 'package:driver/feature/home_page/create_order_page/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'get_city_bloc/get_city_bloc.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  final controller = ScrollController();
  DateTime date = DateTime.now();
  List<String> values = ['driver', 'passenger'];
  String dropdownValue = 'driver';
  CityDetails? cityFrom;
  CityDetails? cityTo;
  TextEditingController controllerFrom = TextEditingController(text: '');
  TextEditingController controllerTo = TextEditingController();
  TextEditingController controllerPrice = TextEditingController(text: '0');
  TextEditingController controllerNote = TextEditingController();
  bool isLoading = false;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      pagination(context);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Создать заказ'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    BlocProvider.of<GetCityBloc>(context)
                        .add(GetCityListEvent(cityName: controllerFrom.text));
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  onChanged: (val) {
                                    BlocProvider.of<GetCityBloc>(context).add(
                                      GetCityListEvent(cityName: val),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: BlocBuilder<GetCityBloc, GetCityState>(
                                    builder: (context, state) {
                                      if (state is GetCityLoading) {
                                        return const CircularProgressIndicator
                                            .adaptive();
                                      }
                                      if (state is GetCitySucces) {
                                        if (state.model.isNotEmpty) {
                                          return ListView.builder(
                                            controller: controller,
                                            shrinkWrap: true,
                                            itemCount: state.model.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                cityFrom = state.model[index];
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(25.0),
                                                child: Text(
                                                  state.model[index].name ??
                                                      'Ничго нет',
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return const Text('Пусто');
                                        }
                                      }
                                      return const Text('Пусто');
                                    },
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Back'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    cityFrom == null ? 'Откуда' : cityFrom?.name ?? '',
                    style: AppFonts.w700s25.copyWith(color: Colors.black),
                  ),
                );
              }),
              CustomTextField(
                hintText: 'Точный Адрес',
                controller: controllerFrom,
              ),
              Builder(builder: (context) {
                return TextButton(
                  onPressed: () {
                    BlocProvider.of<GetCityBloc>(context)
                        .add(GetCityListEvent(cityName: controllerFrom.text));
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomTextField(
                                  onChanged: (val) {
                                    BlocProvider.of<GetCityBloc>(context).add(
                                      GetCityListEvent(cityName: val),
                                    );
                                  },
                                ),
                                Expanded(
                                  child: BlocBuilder<GetCityBloc, GetCityState>(
                                    builder: (context, state) {
                                      if (state is GetCitySucces) {
                                        if (state.model.isNotEmpty) {
                                          return ListView.builder(
                                            controller: controller,
                                            shrinkWrap: true,
                                            itemCount: state.model.length,
                                            itemBuilder: (context, index) =>
                                                InkWell(
                                              onTap: () {
                                                cityTo = state.model[index];
                                                Navigator.pop(context);
                                                setState(() {});
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(25.0),
                                                child: Text(
                                                  state.model[index].name ??
                                                      'Ничго нет',
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return const Text('Пусто');
                                        }
                                      }
                                      return const Text('Пусто');
                                    },
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Back'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    cityTo == null ? 'Куда' : cityTo?.name ?? '',
                    style: AppFonts.w700s25.copyWith(color: Colors.black),
                  ),
                );
              }),
              CustomTextField(
                hintText: 'Точный Адрес',
                controller: controllerTo,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'Цена',
                keyboardType: TextInputType.number,
                controller: controllerPrice,
              ),
              const SizedBox(height: 25),
              CustomTextField(
                hintText: 'Заметки',
                keyboardType: TextInputType.number,
                controller: controllerNote,
              ),
              DropdownButton(
                value: dropdownValue,
                items: [
                  DropdownMenuItem(
                    value: values.first,
                    child: const Text('Водитель'),
                  ),
                  DropdownMenuItem(
                    value: values.last,
                    child: const Text('Пассажир'),
                  ),
                ],
                onChanged: (val) {
                  dropdownValue = val!;
                  setState(() {});
                },
              ),
              TextButton(
                onPressed: () {
                  DatePicker.showDateTimePicker(context,
                      currentTime: date,
                      minTime: DateTime.now(),
                      maxTime: DateTime.now().add(const Duration(days: 10)),
                      onConfirm: (selectedDate) {
                    date = selectedDate;
                    setState(() {});
                  });
                },
                child: Text(
                  date.toString(),
                  style: AppFonts.w700s25.copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(height: 25),
              BlocListener<CreateOrderBloc, CreateOrderState>(
                listener: (context, state) {
                  String message = 'message';
                  if (state is CreateOrderError) {
                    message = state.errorMessage;
                  }
                  if (state is CreateOrderSuccess) {
                    message = 'Succes';
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                },
                child: CustomButton(
                    onPressed: () {
                      BlocProvider.of<CreateOrderBloc>(context).add(
                        CreateNewOrederEvent(
                          model: SendOrderModel(
                            note: controllerNote.text,
                            addressFrom: controllerFrom.text,
                            addressTo: controllerTo.text,
                            price: int.parse(controllerPrice.text),
                            date: date.toString(),
                            type: dropdownValue,
                            cityFrom: cityTo?.id ?? '',
                            cityTo: cityFrom?.id ?? '',
                          ),
                        ),
                      );
                    },
                    title: 'Создать'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void pagination(BuildContext context) {
    if (isLoading) {
      return;
    }

    isLoading = true;

    if (controller.position.pixels == controller.position.maxScrollExtent) {
      page++;
      BlocProvider.of<GetCityBloc>(context).add(
        GetCityListEvent(
          page: page,
          cityName: controllerFrom.text,
        ),
      );
    } else {}

    isLoading = false;
  }

  @override
  void dispose() {
    controller.removeListener(() {});
    controllerFrom;
    controllerNote;
    controllerPrice;
    controllerTo;

    super.dispose();
  }
}
