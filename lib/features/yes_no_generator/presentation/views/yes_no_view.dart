import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_generator/config/theme/theme.dart';
// import 'package:yes_no_generator/features/yes_no_generator/data/datasources/remote_data_source/remote_data_source.dart';
// import 'package:yes_no_generator/features/yes_no_generator/data/repositories/yes_no_repository_impl.dart';
// import 'package:yes_no_generator/features/yes_no_generator/domain/usecases/get_random_yes_or_no.dart';
import 'package:yes_no_generator/features/yes_no_generator/presentation/cubit/yes_no_generator_cubit.dart';

class YesNoView extends StatefulWidget {
  const YesNoView({super.key});

  @override
  State<YesNoView> createState() => _YesNoViewState();
}

class _YesNoViewState extends State<YesNoView> {
  getRandomYesOrNo() {
    BlocProvider.of<YesNoGeneratorCubit>(context).generateYesOrNo();
  }

  @override
  void initState() {
    super.initState();
    getRandomYesOrNo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<YesNoGeneratorCubit, YesNoGeneratorState>(
        builder: (context, state) {
          if (state is YesNoGeneratorLoaded) {
            return Container(
              decoration: const BoxDecoration(gradient: AppTheme.appGradient),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      padding: const EdgeInsets.all(
                        10,
                      ),
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        // gradient: const LinearGradient(colors: [
                        //   Colors.deepPurpleAccent,
                        //   Colors.purpleAccent,
                        //   // Colors.white,
                        // ])
                      ),
                      child: Text(
                        state.response.answer,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.indigo),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        imageUrl: state.response.image,
                        progressIndicatorBuilder: (context, url, progress) =>
                            const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async => await getRandomYesOrNo(),
                    style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size.fromWidth(
                          MediaQuery.of(context).size.width * 0.4)),
                    ),
                    child: const Text(
                      'Refresh',
                      style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is YesNoGeneratorFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return Container(
              decoration: const BoxDecoration(gradient: AppTheme.appGradient),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
