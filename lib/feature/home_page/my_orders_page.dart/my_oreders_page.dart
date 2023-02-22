import 'package:driver/core_data/theme/app_fonts.dart';
import 'package:driver/feature/home_page/drivers_page/bloc/get_drivers_order_bloc.dart';
import 'package:driver/feature/home_page/drivers_page/models/order_model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../drivers_page/models/order_model/user_info.dart';
import 'edit_order_page/bloc/edit_order_bloc.dart';
import 'edit_order_page/edit_order_screen.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDriversOrderBloc>(context).add(GetAllOrdersEvent());
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
                if (state is GetAllOrderSuccess) {
                  return ListView.builder(
                    itemCount: state.model.orderInfo?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: state.model.orderInfo?[index].type == 'driver'
                              ? Colors.green
                              : Colors.red,
                          border: Border.all(width: 5),
                        ),
                        child: Column(
                          children: [
                            Text(
                                state.model.orderInfo?[index].user?.name ?? ''),
                            Text(state.model.orderInfo?[index].getCityFrom
                                    ?.name ??
                                ''),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditOrder(
                                          model:
                                              state.model.orderInfo?[index] ??
                                                  OrderInfo(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text('Edit'),
                                ),
                                IconButton(
                                  onPressed: () {
                                    BlocProvider.of<EditOrderBloc>(context).add(
                                      DeleteOrder(
                                          id: state
                                                  .model.orderInfo?[index].id ??
                                              ''),
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                )
                              ],
                            )
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
