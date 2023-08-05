import 'package:bloc/bloc.dart';
import 'package:flutterapperadauti/app/repository/notifications/notifications_repository.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';
part 'onboarding_bloc.freezed.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final NotificationsRepository _notificationsRepository;
  OnboardingBloc({
    required NotificationsRepository notificationsRepository,
  })  : _notificationsRepository = notificationsRepository,
        super(const OnboardingState()) {
    on<RegisterNotifications>(_registerNotifications);
    on<RemoveNotifications>(_removeNotifications);
    on<_NotificationsEnabled>(_notificationsEnabled);
    on<_EnableNotifications>(_enableNotifications);
    on<_DisableNotifications>(_disableNotifications);
    add(const _NotificationsEnabled());
  }

  void _registerNotifications(
      RegisterNotifications event, Emitter<OnboardingState> emit) async {
    try {
      emit(state.copyWith(pageState: PageState.inProgress));
      if (await _notificationsRepository.askForPermissions() ==
          NotificationsPermissions.disabled) {
        emit(
          state.copyWith(
            notificationsPermissions: NotificationsPermissions.disabled,
          ),
        );
      } else {
        await _notificationsRepository.subscribeToTopic(
          AppConstants.eventsTopicKey,
        );
        await _notificationsRepository.subscribeToTopic(
          AppConstants.reportProblemTopicKey,
        );
        await _notificationsRepository.subscribeToTopic(
          AppConstants.volunteeringTopicKey,
        );
        await _notificationsRepository.subscribeToTopic(
          AppConstants.announcementsTopicKey,
        );
        await _notificationsRepository.subscribeToTopic(
          AppConstants.airQualityTopicKey,
        );
        add(const _EnableNotifications());
        emit(
          state.copyWith(
            pageState: PageState.success,
            notificationsPermissions: NotificationsPermissions.enabled,
          ),
        );
      }
    } on Exception catch (e) {
      emit(
        state.copyWith(
          pageState: PageState.failure,
          message: e.toString(),
        ),
      );
    }
  }

  void _removeNotifications(
      RemoveNotifications event, Emitter<OnboardingState> emit) async {
    try {
      emit(state.copyWith(pageState: PageState.inProgress));
      await _notificationsRepository.unsubscribeFromTopic(
        AppConstants.eventsTopicKey,
      );
      await _notificationsRepository.unsubscribeFromTopic(
        AppConstants.reportProblemTopicKey,
      );
      await _notificationsRepository.unsubscribeFromTopic(
        AppConstants.volunteeringTopicKey,
      );
      await _notificationsRepository.unsubscribeFromTopic(
        AppConstants.announcementsTopicKey,
      );
      await _notificationsRepository.unsubscribeFromTopic(
        AppConstants.airQualityTopicKey,
      );
      add(const _DisableNotifications());
      emit(state.copyWith(pageState: PageState.success));
    } on Exception catch (e) {
      emit(
        state.copyWith(
          pageState: PageState.failure,
          message: e.toString(),
        ),
      );
    }
  }

  void _notificationsEnabled(
      _NotificationsEnabled event, Emitter<OnboardingState> emit) async {
    emit(state.copyWith(pageState: PageState.inProgress));
    bool enabled = await _notificationsRepository.notificationsEnabled();
    emit(
      state.copyWith(
        pageState: PageState.success,
        notificationsEnabled: enabled,
      ),
    );
  }

  void _enableNotifications(
    _EnableNotifications event,
    Emitter<OnboardingState> emit,
  ) async {
    await _notificationsRepository.enableNotifications();
    emit(state.copyWith(notificationsEnabled: true));
  }

  void _disableNotifications(
    _DisableNotifications event,
    Emitter<OnboardingState> emit,
  ) async {
    await _notificationsRepository.disableNotifications();
    emit(state.copyWith(notificationsEnabled: false));
  }
}
