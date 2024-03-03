import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_generator/config/routes/routes.dart';
import 'package:yes_no_generator/features/yes_no_generator/data/datasources/remote_data_source/remote_data_source.dart';
import 'package:yes_no_generator/features/yes_no_generator/data/repositories/yes_no_repository_impl.dart';
import 'package:yes_no_generator/features/yes_no_generator/domain/usecases/get_random_yes_or_no.dart';
import 'package:yes_no_generator/features/yes_no_generator/presentation/cubit/yes_no_generator_cubit.dart';

class YesNoApp extends StatelessWidget {
  const YesNoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
    create: (context) => YesNoGeneratorCubit(
            getRandomYesOrNoUseCase: GetRandomYesOrNoUseCase(
                yesNoRepository:
                    YesNoRepositoryImpl(remoteDataSource: RemoteDataSource()))),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: (settings) => AppRoutes.onGenerateRoute(settings),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
