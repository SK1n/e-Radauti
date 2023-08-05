part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(PageState.initial) PageState pageState,
    @Default('') String message,
    @Default(false) bool notificationsEnabled,
    @Default(NotificationsPermissions.initial)
    NotificationsPermissions notificationsPermissions,
  }) = _OnboardingState;
}
