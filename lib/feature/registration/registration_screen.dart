import 'package:driver/core_data/theme/app_fonts.dart';
import 'package:driver/core_data/ui/widgets/custom_button.dart';
import 'package:driver/core_data/ui/widgets/custom_text_field.dart';
import 'package:driver/feature/auth/auth_screen.dart';
import 'package:driver/feature/registration/bloc/registration_bloc.dart';
import 'package:driver/feature/set_users_data/set_user_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerOtp = TextEditingController();
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
                'Введите код подтверждения ',
                style: AppFonts.w700s25,
                textAlign: TextAlign.center,
              ),
              CustomTextField(
                controller: controllerOtp,
                maxLength: 4,
                onChanged: (val) {},
              ),
              BlocConsumer<RegistrationBloc, RegistrationState>(
                listener: (context, state) {
                  if (state is RegistrationSucces) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SetUsersDataScreen(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RegistrationLoading) {
                    return const CircularProgressIndicator.adaptive();
                  }
                  return CustomButton(
                      onPressed: () {
                        BlocProvider.of<RegistrationBloc>(context)
                            .add(SendCodeEvent(otp: controllerOtp.text));
                      },
                      title: 'Войти');
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthScreen(),
                    ),
                  );
                },
                child: const Text('Войти'),
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
}
