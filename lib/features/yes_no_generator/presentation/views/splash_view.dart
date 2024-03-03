import 'package:flutter/material.dart';
import 'package:yes_no_generator/config/routes/routes.dart';
import 'package:yes_no_generator/config/theme/theme.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.appGradient),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.yesNoView);
                },
                style: ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(
                      Size.fromWidth(MediaQuery.of(context).size.width * 0.4)),
                ),
                child: const Text(
                  'Yes/No',
                  style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
