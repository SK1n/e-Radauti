import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterapperadauti/app/bloc/app_bloc/app_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/app/utils/is_first_run.dart';
import 'package:flutterapperadauti/gen/colors.gen.dart';

import 'repository/authentication/authentication_repository.dart';
import 'repository/e_radauti_website/e_radauti_website_repository.dart';
import 'repository/firestore/firestore_repository.dart';
import 'repository/local_administration/local_administration_repository.dart';
import 'repository/storage/storage_repository.dart';
import 'router/routes.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    required FirestoreRepository firestoreRepository,
    required StorageRepository storageRepository,
    required LocalAdministrationRepository localAdministrationRepository,
    required ERadautiWebsiteRepository eRadautiWebsiteRepository,
    required bool isFirstRun,
    super.key,
  })  : _authenticationRepository = authenticationRepository,
        _firestoreRepository = firestoreRepository,
        _storageRepository = storageRepository,
        _localAdministrationRepository = localAdministrationRepository,
        _eRadautiWebsiteRepository = eRadautiWebsiteRepository,
        _isFirstRun = isFirstRun;

  final AuthenticationRepository _authenticationRepository;
  final FirestoreRepository _firestoreRepository;
  final StorageRepository _storageRepository;
  final LocalAdministrationRepository _localAdministrationRepository;
  final ERadautiWebsiteRepository _eRadautiWebsiteRepository;
  final bool _isFirstRun;

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
          create: (context) => _localAdministrationRepository,
        ),
        RepositoryProvider(
          create: (context) => _eRadautiWebsiteRepository,
        )
      ],
      child: BlocProvider(
        create: (_) => AppBloc(
          authenticationRepository: _authenticationRepository,
          isFirstRun: _isFirstRun,
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
        iconTheme: const IconThemeData(size: 14.0, color: ColorName.iconColor),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: ColorName.plum,
            textStyle: AppConstants.buttonTextStyle,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
            floatingLabelAlignment: FloatingLabelAlignment.start),
        cardTheme: CardTheme(
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.black12, width: 0),
            borderRadius: AppConstants.borderRadius,
          ),
        ),
        fontFamily: 'Inter',
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
