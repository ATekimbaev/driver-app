import 'package:driver/core%20/dio_settings.dart';
import 'package:driver/feature/auth/bloc/auth_bloc.dart';
import 'package:driver/feature/auth/repository/auth_repository.dart';
import 'package:driver/feature/home_page/create_order_page/bloc/get_city_bloc.dart';
import 'package:driver/feature/home_page/create_order_page/repositories/get_city_repo.dart';
import 'package:driver/feature/registration/bloc/registration_bloc.dart';
import 'package:driver/feature/registration/repositories/registration_repository.dart';
import 'package:driver/feature/set_users_data/bloc/set_users_data_bloc.dart';
import 'package:driver/feature/set_users_data/repositories/set_user_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import 'feature/auth/auth_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/splash_screen.dart/splash_screen.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => RegistrationRepository(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
        RepositoryProvider(
          create: (context) => SetUsersDataRepository(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
        RepositoryProvider(
          create: (context) => AuthRepository(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
        RepositoryProvider(
          create: (context) => GetCityRepo(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrationBloc(
              repository:
                  RepositoryProvider.of<RegistrationRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => AuthBloc(
              repository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider(
            create: (context) => GetCityBloc(
              repo: RepositoryProvider.of<GetCityRepo>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SetUsersDataBloc(
              repository:
                  RepositoryProvider.of<SetUsersDataRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.ibmPlexMonoTextTheme(),
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
