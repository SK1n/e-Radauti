// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'application/signin/sign_in_form_bloc.dart' as _i7;
import 'application/signup/sign_up_form_bloc.dart' as _i8;
import 'domain/auth/i_auth_firebase.dart' as _i5;
import 'infrastructure/auth/auth_firebase.dart' as _i6;
import 'infrastructure/core/firebase_injectable_module.dart' as _i9;
import 'router/auto_router.dart' as _i3;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final firebaseInjectableModule = _$FirebaseInjectableModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth);
  gh.lazySingleton<_i5.IAuthFirebase>(
      () => _i6.AuthFirebase(gh<_i4.FirebaseAuth>()));
  gh.factory<_i7.SignInFormBloc>(
      () => _i7.SignInFormBloc(gh<_i5.IAuthFirebase>()));
  gh.factory<_i8.SignUpFormBloc>(
      () => _i8.SignUpFormBloc(gh<_i5.IAuthFirebase>()));
  return getIt;
}

class _$FirebaseInjectableModule extends _i9.FirebaseInjectableModule {}
