import 'package:authentication_repository/authentication_repository.dart';
import 'package:firestore_repository/firestore_repository.dart';
import 'package:floor_repository/floor_repository.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapperadauti/app/bloc/app_bloc.dart';
import 'package:flutterapperadauti/app/router/routes.dart';
import 'package:storage_repository/storage_repository.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
    required FloorRepository floorRepository,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        _floorRepository = floorRepository;

  final AuthenticationRepository _authenticationRepository;
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  final FloorRepository _floorRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => _authenticationRepository,
        ),
        RepositoryProvider(
          create: (context) => _firestoreRepository,
        ),
        RepositoryProvider(
          create: (context) => _storageRepository,
        ),
        RepositoryProvider(
          create: (context) => _floorRepository,
        ),
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ro', 'RO'),
      ],
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
