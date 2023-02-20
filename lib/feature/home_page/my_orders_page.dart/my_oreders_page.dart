import 'package:driver/core%20/theme/app_fonts.dart';
import 'package:driver/feature/home_page/drivers_page/bloc/get_drivers_order_bloc.dart';
import 'package:driver/feature/home_page/drivers_page/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    itemCount: state.model.userInfo?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: state.model.userInfo?[index].type == 'driver'
                              ? Colors.green
                              : Colors.red,
                          border: Border.all(width: 5),
                        ),
                        child: Column(
                          children: [
                            Text(state.model.userInfo?[index].user?.name ?? ''),
                            Text(state
                                    .model.userInfo?[index].getCityFrom?.name ??
                                ''),
                            Text(
                                state.model.userInfo?[index].addressFrom ?? ''),
                            Text(state.model.userInfo?[index].getCityto?.name ??
                                ''),
                            Text(state.model.userInfo?[index].addressTo ?? ''),
                            Text(
                                state.model.userInfo?[index].price.toString() ??
                                    ''),
                            Text(state.model.userInfo?[index].note ?? ''),
                            Text(state.model.userInfo?[index].date ?? ''),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditOrder(
                                      model: state.model.userInfo?[index] ??
                                          UserInfo(),
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Edit'),
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
