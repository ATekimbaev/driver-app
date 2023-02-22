import 'package:driver/core_data/theme/app_fonts.dart';
import 'package:driver/core_data/ui/widgets/custom_button.dart';
import 'package:driver/core_data/ui/widgets/custom_text_field.dart';
import 'package:driver/feature/home_page/home_page.dart';
import 'package:driver/feature/registration/registration_screen.dart';
import 'package:driver/feature/set_users_data/bloc/set_users_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetUsersDataScreen extends StatefulWidget {
  const SetUsersDataScreen({super.key});

  @override
  State<SetUsersDataScreen> createState() => _SetUsersDataScreenState();
}

class _SetUsersDataScreenState extends State<SetUsersDataScreen> {
  String? errorText;
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerLogin = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Введите логин и пароль'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Введите логин и пароль',
                style: AppFonts.w700s25,
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                controller: controllerLogin,
                hintText: 'Login',
              ),
              CustomTextField(
                controller: controllerName,
                hintText: 'name',
              ),
              CustomTextField(
                errorText: errorText,
                controller: controllerPassword,
                hintText: 'Password',
              ),
              CustomTextField(
                onChanged: (value) {
                  if (controllerConfirmPassword.text !=
                      controllerPassword.text) {
                    errorText = 'Пароли должны совпадать';
                  } else {
                    errorText = null;
                  }
                  setState(() {});
                },
                errorText: errorText,
                controller: controllerConfirmPassword,
                hintText: 'Confirm Password',
              ),
              BlocListener<SetUsersDataBloc, SetUsersDataState>(
                listener: (context, state) {
                  if (state is SetUsersDataSucces) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                },
                child: CustomButton(
                    onPressed: controllerConfirmPassword.text ==
                                controllerPassword.text &&
                            controllerConfirmPassword.text.isNotEmpty
                        ? sendDataEvent
                        : null,
                    title: 'Войти'),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendDataEvent() {
    BlocProvider.of<SetUsersDataBloc>(context).add(
      SendDataEvent(
          password: controllerPassword.text, login: controllerLogin.text),
    );
  }
}
