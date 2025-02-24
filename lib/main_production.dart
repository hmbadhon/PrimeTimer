import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/app/app.dart';
import 'core/app/app_dependency.dart';
import 'core/app/app_flavor.dart';
import 'core/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //Init modules
  await configureInjection();
  //Init app flavor
  AppFlavor.appFlavor = FlavorStatus.production;
  //Init my app with observer
  Bloc.observer = AppBlocObserver();
  runApp(const InitApp());
}
