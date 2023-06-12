import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor_repository/floor_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapperadauti/app/app.dart';
import 'package:flutterapperadauti/app/bloc_observer.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:storage_repository/storage_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  final firestoreRepository = FirestoreRepository();
  final storageRepository = StorageRepository();
  final floorRepository = FloorRepository();
  await authenticationRepository.user.first;

  runApp(
    TranslationProvider(
      child: App(
        authenticationRepository: authenticationRepository,
        firestoreRepository: firestoreRepository,
        storageRepository: storageRepository,
        floorRepository: floorRepository,
      ),
    ),
  );
}
