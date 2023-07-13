import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:islamic/presentation/common/bloc_observer.dart';
import 'package:islamic/presentation/resources/language_manager.dart';
import 'package:wakelock/wakelock.dart';

import 'app/app.dart';
import 'app/utils/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  Wakelock.enable();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocale, englishLocale],
      startLocale: arabicLocale,
      path: localisationPath,
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}
