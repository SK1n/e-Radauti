import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapperadauti/app/app.dart';
import 'package:flutterapperadauti/app/bloc_observer.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp();

  final authenticationRepository = AuthenticationRepository();
  final firestoreRepository = FirestoreRepository();
  await authenticationRepository.user.first;

  runApp(
    TranslationProvider(
      child: App(
        authenticationRepository: authenticationRepository,
        firestoreRepository: firestoreRepository,
      ),
    ),
  );
}
