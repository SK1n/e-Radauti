import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutterapperadauti/app/models/user.dart';
import 'package:flutterapperadauti/app/repository/authentication/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
    required this.isFirstRun,
  })  : _authenticationRepository = authenticationRepository,
        super(
          isFirstRun
              ? const AppState.isFirstRun()
              : (authenticationRepository.currentUser.isNotEmpty
                  ? AppState.authenticated(authenticationRepository.currentUser)
                  : const AppState.unauthenticated()),
        ) {
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_AppUserChanged(user)),
    );
    on<_IsFirstRun>(_isFirstRun);
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<User> _userSubscription;
  bool isFirstRun;

  void _onUserChanged(_AppUserChanged event, Emitter<AppState> emit) {
    emit(
      isFirstRun
          ? const AppState.isFirstRun()
          : event.user.isNotEmpty
              ? AppState.authenticated(event.user)
              : const AppState.unauthenticated(),
    );
  }

  void _isFirstRun(_IsFirstRun event, Emitter<AppState> emit) {
    emit(
      const AppState.isFirstRun(),
    );
  }

  void _onLogoutRequested(AppLogoutRequested event, Emitter<AppState> emit) {
    unawaited(_authenticationRepository.logOut());
    isFirstRun = false;
    emit(const AppState.unauthenticated());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
