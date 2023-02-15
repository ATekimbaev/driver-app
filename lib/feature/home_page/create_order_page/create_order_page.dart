import 'package:driver/core%20/theme/app_fonts.dart';
import 'package:driver/core%20/ui/widgets/custom_text_field.dart';
import 'package:driver/feature/home_page/create_order_page/bloc/get_city_bloc.dart';
import 'package:driver/feature/home_page/create_order_page/models/city_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateOrder extends StatefulWidget {
  const CreateOrder({super.key});

  @override
  State<CreateOrder> createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  Results? cityFrom;
  Results? cityTo;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              BlocProvider.of<GetCityBloc>(context).add(GetCityListEvent());
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
                                  if (state.model.results!.isNotEmpty) {
                                    return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: state.model.results?.length,
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          cityFrom =
                                              state.model.results![index];
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(25.0),
                                          child: Text(
                                            state.model.results?[index].name ??
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
                          )
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
          ),
        ],
      ),
    );
  }
}
