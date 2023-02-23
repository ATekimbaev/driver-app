import 'package:driver/core_data/theme/app_fonts.dart';
import 'package:driver/core_data/ui/widgets/custom_button.dart';
import 'package:driver/core_data/ui/widgets/custom_text_field.dart';
import 'package:driver/feature/home_page/home_page.dart';
import 'package:driver/feature/home_page/settings_page/bloc/settings_bloc.dart';
import 'package:driver/feature/registration/models/user_info_model.dart';
import 'package:driver/feature/registration/registration_screen.dart';
import 'package:driver/feature/registration/repositories/registration_repository.dart';
import 'package:driver/feature/set_users_data/bloc/set_users_data_bloc.dart';
import 'package:driver/feature/set_users_data/repositories/set_user_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeUsersDataScreen extends StatefulWidget {
  const ChangeUsersDataScreen({super.key});

  @override
  State<ChangeUsersDataScreen> createState() => _ChangeUsersDataScreenState();
}

class _ChangeUsersDataScreenState extends State<ChangeUsersDataScreen> {
  String? errorText;

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLogin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SettingsBloc>(context).add(GetUserInfoEvent());
    return BlocListener<SettingsBloc, SettingsState>(
      listener: (context, state) {
        if (state is SettingsSuccess) {
          controllerName.text = state.model.name ?? '';
          controllerLogin.text = state.model.username ?? '';
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Изменить данные'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Изменить данные',
                  style: AppFonts.w700s25,
                  textAlign: TextAlign.center,
                ),
                CustomTextField(
                  controller: controllerLogin,
                  hintText: 'userName',
                ),
                CustomTextField(
                  controller: controllerName,
                  hintText: 'name',
                  errorText: errorText,
                ),
                CustomButton(
                    onPressed: () {
                      try {
                        RepositoryProvider.of<SetUsersDataRepository>(context)
                            .setUserName(
                                name: controllerName.text,
                                userName: controllerName.text);
                        errorText = null;
                      } catch (e) {
                        errorText = e.toString();
                      }
                      setState(() {});
                    },
                    title: 'Изменить'),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
