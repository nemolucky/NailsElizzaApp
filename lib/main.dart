import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/nailselizza_app.dart';
import 'package:app/firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:app/repositories/user/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:app/repositories/admin/admin.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:app/repositories/service/service.dart';
import 'package:app/features/main/providers/providers.dart';
import 'package:app/repositories/manicure_record/manicure_record.dart';

void main() {
  runZonedGuarded(() async {

    WidgetsFlutterBinding.ensureInitialized();

    final talker = TalkerFlutter.init();
    GetIt.I.registerSingleton(talker);
    GetIt.I<Talker>().debug("Talker started...");

    await Hive.initFlutter();

    Hive.registerAdapter(ServiceAdapter());

    final tokenBox = await Hive.openBox('auth');

    final metaBox = await Hive.openBox('metadata');

    final servicesBox = await Hive.openBox<Service>('services');

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    GetIt.I.registerLazySingleton<AbstractServiceRepository>(
      () => ServiceRepository(
        servicesBox: servicesBox,
        metaBox: metaBox
      ));

    GetIt.I.registerLazySingleton<AbstractUserRepository>(
      () => UserRepository(
        tokenBox: tokenBox
    ));

    GetIt.I.registerLazySingleton<AbstractAdminRepository>(
      () => AdminRepository());

    GetIt.I.registerLazySingleton<AbstractManicureRecordRepository>(
      () => ManicureRecordRepository());      

    FlutterError.onError = (details) {
      GetIt.I<Talker>().handle(details.exception, details.stack);
    };

    runApp(    ChangeNotifierProvider(
      create: (_) => BottomNavProvider(),
      
      child: const NailselizzaApp(),
    ),);
  },
  (error, stackTrace) {
    GetIt.I<Talker>().handle(error, stackTrace);
  });
}