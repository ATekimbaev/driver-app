import 'package:driver/core%20/theme/app_fonts.dart';
import 'package:driver/feature/home_page/drivers_page/bloc/get_drivers_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PassengersPage extends StatelessWidget {
  const PassengersPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDriversOrderBloc>(context)
        .add(GetNewPassengersOrderEvent());
    return Center(
      child: Column(
        children: [
          const Text(
            'Доступные заказы',
            style: AppFonts.w700s25,
          ),
          Expanded(
            child: BlocBuilder<GetDriversOrderBloc, GetDriversOrderState>(
              builder: (context, state) {
                if (state is GetPassengersOrderSuccess) {
                  return ListView.builder(
                    itemCount: state.model.orderInfo?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(width: 5),
                        ),
                        child: Column(
                          children: [
                            Text(
                                state.model.orderInfo?[index].user?.name ?? ''),
                            Text(state.model.orderInfo?[index].getCityFrom
                                    ?.name ??
                                'userInfo'),
                            Text(state.model.orderInfo?[index].addressFrom ??
                                ''),
                            Text(
                                state.model.orderInfo?[index].getCityto?.name ??
                                    ''),
                            Text(state.model.orderInfo?[index].addressTo ?? ''),
                            Text(state.model.orderInfo?[index].price
                                    .toString() ??
                                ''),
                            Text(state.model.orderInfo?[index].note ?? ''),
                            Text(state.model.orderInfo?[index].date ?? ''),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }
}
