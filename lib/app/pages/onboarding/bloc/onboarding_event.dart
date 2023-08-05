part of 'onboarding_bloc.dart';

sealed class OnboardingEvent {
  const OnboardingEvent();
}

final class RegisterNotifications extends OnboardingEvent {
  const RegisterNotifications();
}

final class RemoveNotifications extends OnboardingEvent {
  const RemoveNotifications();
}

final class _NotificationsEnabled extends OnboardingEvent {
  const _NotificationsEnabled();
}

final class _EnableNotifications extends OnboardingEvent {
  const _EnableNotifications();
}

final class _DisableNotifications extends OnboardingEvent {
  const _DisableNotifications();
}
