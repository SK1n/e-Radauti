// ignore_for_file: avoid_print
import 'package:bloc/bloc.dart';
import 'package:logger/logger.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    final Logger log = Logger();
    log.e(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    final Logger log = Logger();
    log.d("CURRENT STATE\n\n${change.currentState}");
    log.d("NEXT STATE\n\n${change.nextState}");
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    final Logger log = Logger();
    log.d(transition);
  }
}