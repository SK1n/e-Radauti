import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/bloc/app_bloc/app_bloc.dart';
import 'package:flutterapperadauti/app/pages/onboarding/bloc/onboarding_bloc.dart';
import 'package:flutterapperadauti/app/repository/notifications/notifications_repository.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/app/utils/page_state.dart';
import 'package:flutterapperadauti/app/utils/scaffolds/app_scaffold.dart';
import 'package:flutterapperadauti/gen/assets.gen.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';

class PageOnboarding extends StatelessWidget {
  const PageOnboarding({super.key});
  static Page<void> page() =>
      const MaterialPage<void>(child: PageOnboarding(), name: '/onboarding');
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingBloc(
        notificationsRepository: context.read<NotificationsRepository>(),
      ),
      child: AppScaffold(
        appBarTitle: '',
        actions: [
          TextButton(
            onPressed: () async {
              context.read<AppBloc>().add(const AppLogoutRequested());
            },
            child: Text(
              t.onboarding.next,
              style: AppConstants.linkTextStyle,
            ),
          )
        ],
        slivers: [
          Image.asset(
            Assets.logoImages.rc.path,
            width: 100,
            height: 100,
          ),
          Padding(
            padding: AppConstants.innerCardPadding,
            child: Center(
              child: Text(
                t.onboarding.descrtiption,
                textAlign: TextAlign.center,
                style: AppConstants.textTextStyle,
              ),
            ),
          ),
          BlocConsumer<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return Card(
                child: ListTile(
                  leading: const Icon(Icons.notification_add),
                  style: ListTileStyle.drawer,
                  title: Text(t.onboarding.notifications),
                  trailing: Switch.adaptive(
                    value: state.notificationsEnabled,
                    onChanged: state.pageState.isInProgress
                        ? null
                        : (value) {
                            debugPrint(value.toString());
                            context.read<OnboardingBloc>().add(
                                  value
                                      ? const RegisterNotifications()
                                      : const RemoveNotifications(),
                                );
                          },
                  ),
                ),
              );
            },
            listener: (context, state) {
              if (state.notificationsPermissions.isDisabled) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(
                        t.onboarding.permissionsDenied,
                      ),
                    ),
                  );
              }
            },
          ),
        ],
        showDrawerButton: false,
      ),
    );
  }
}
