import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yes_no_generator/app.dart';
import 'package:yes_no_generator/app_observer.dart';

void main() {
  Bloc.observer = AppObserver();
  runApp(const YesNoApp());
}
