import 'package:driver/core%20/theme/app_fonts.dart';
import 'package:driver/feature/home_page/drivers_page/bloc/get_drivers_order_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DriversPage extends StatelessWidget {
  const DriversPage({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetDriversOrderBloc>(context)
        .add(GetNewDriversOrderEvent());
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
                if (state is GetDriversOrderSuccess) {
                  return ListView.builder(
                    itemCount: state.model.results?.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 5),
                        ),
                        child: Column(
                          children: [
                            Text(state.model.results?[index].user?.name ?? ''),
                            Text(state.model.results?[index].cityFrom?.name ??
                                ''),
                            Text(state.model.results?[index].addressFrom ?? ''),
                            Text(
                                state.model.results?[index].cityTo?.name ?? ''),
                            Text(state.model.results?[index].addressTo ?? ''),
                            Text(state.model.results?[index].price.toString() ??
                                ''),
                            Text(state.model.results?[index].note ?? ''),
                            Text(state.model.results?[index].date ?? ''),
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
