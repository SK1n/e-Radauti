import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapperadauti/app/app.dart';
import 'package:flutterapperadauti/app/bloc_observer.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';
import 'package:flutterapperadauti/app/repository/firestore/firestore_repository.dart';
import 'package:flutterapperadauti/app/repository/floor/floor_repository.dart';
import 'package:flutterapperadauti/app/repository/local_administration/local_administration_repository.dart';
import 'package:flutterapperadauti/app/repository/storage/storage_repository.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  final firestoreRepository = FirestoreRepository();
  final storageRepository = StorageRepository();
  final floorRepository = FloorRepository();
  final localAdministrationRepository = LocalAdministrationRepository();
  await authenticationRepository.user.first;

  runApp(
    TranslationProvider(
      child: App(
        authenticationRepository: authenticationRepository,
        firestoreRepository: firestoreRepository,
        storageRepository: storageRepository,
        floorRepository: floorRepository,
        localAdministrationRepository: localAdministrationRepository,
      ),
    ),
  );
}
