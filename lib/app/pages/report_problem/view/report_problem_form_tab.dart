import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/i18n/strings.g.dart';
import 'package:flutterapperadauti/app/pages/report_problem/cubit/report_problem_cubit.dart';
import 'package:flutterapperadauti/app/utils/widgets/border_text_drop_down.dart';
import 'package:flutterapperadauti/app/utils/widgets/border_text_form_field.dart';

class ReportProblemFormTab extends StatelessWidget {
  const ReportProblemFormTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ReportProblemCubit()
        ..usernameChanged(
          context.read<AuthenticationRepository>().currentUser.name ?? "",
        )
        ..emailChanged(
          context.read<AuthenticationRepository>().currentUser.email ?? "",
        ),
      child: BlocListener<ReportProblemCubit, ReportProblemState>(
        listener: (context, state) {},
        child: SliverToBoxAdapter(
          child: Column(
            children: [
              _UsernameInput(),
              _EmailInput(),
              _PhoneNumberInput(),
              _CategoryInput(),
              _InstitutionInput(),
              _SubjectInput(),
              _DescriptionInput(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (username) =>
              context.read<ReportProblemCubit>().usernameChanged(username),
          hint: t.reportProblem.usernameTextField,
          initialValue: state.username.value,
          errorText: state.username.displayError != null
              ? t.formats.requiredField
              : null,
        );
      },
    );
  }
}

class _InstitutionInput extends StatelessWidget {
  final Map<String, String> _dropDowns = {
    'relatiipublice@primariaradauti.ro': t.reportProblem.radautiCityHall,
    'office@serviciicomunale.ro': t.reportProblem.comunalServices,
    'agentia.radauti@acetsv.ro': t.reportProblem.acetRadauti,
    'contact@cjsuceava.ro': t.reportProblem.suceavaCountyCouncil,
    'cjsuceava@gnm.ro': t.reportProblem.suceavaEnvironmentalGuard,
    'gardaforestiera.suceava@gmail.com': t.reportProblem.suceavaForestGuard,
    'dspsv@dspsv.ro': t.reportProblem.dspSuceava,
    'marginea@suceava.rosilva.ro': t.reportProblem.ocolulSilvicMarginea,
    'radautiulcivic@gmail.com': t.reportProblem.radautiulCivicAssociation,
  };
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) =>
          previous.institution != current.institution,
      builder: (context, state) {
        return BorderTextDropDown(
          onChanged: (institution) => context
              .read<ReportProblemCubit>()
              .institutionChanged(institution),
          hint: t.reportProblem.institutionTextField,
          errorText: state.institution.displayError != null
              ? t.formats.requiredField
              : null,
          items: _dropDowns,
        );
      },
    );
  }
}

class _CategoryInput extends StatelessWidget {
  final Map<String, String> _category = {
    t.reportProblem.infrastructure: t.reportProblem.infrastructure,
    t.reportProblem.utilitiesProblem: t.reportProblem.utilitiesProblem,
    t.reportProblem.uncollectedGarbage: t.reportProblem.uncollectedGarbage,
    t.reportProblem.infrastructureStreets:
        t.reportProblem.infrastructureStreets,
    t.reportProblem.illegalConstructions: t.reportProblem.illegalConstructions,
    t.reportProblem.airQualityPollution: t.reportProblem.airQualityPollution,
    t.reportProblem.safety: t.reportProblem.safety,
    t.reportProblem.other: t.reportProblem.other,
  };
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) => previous.category != current.category,
      builder: (context, state) {
        return BorderTextDropDown(
          onChanged: (category) =>
              context.read<ReportProblemCubit>().categoryChanged(category),
          hint: t.reportProblem.institutionTextField,
          errorText: state.category.displayError != null
              ? t.formats.requiredField
              : null,
          items: _category,
        );
      },
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (email) =>
              context.read<ReportProblemCubit>().emailChanged(email),
          hint: t.reportProblem.emailTextField,
          initialValue: state.email.value,
          errorText:
              state.email.displayError != null ? t.formats.emailFormat : null,
        );
      },
    );
  }
}

class _SubjectInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) => previous.subject != current.subject,
      builder: (context, state) {
        return BorderTextFormField(
          initialValue:
              context.read<AuthenticationRepository>().currentUser.username,
          onChanged: (subject) =>
              context.read<ReportProblemCubit>().subjectChanged(subject),
          hint: t.reportProblem.subjectTextField,
          errorText: state.subject.displayError != null
              ? t.formats.requiredField
              : null,
        );
      },
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (description) => context
              .read<ReportProblemCubit>()
              .descriptionChanged(description),
          hint: t.reportProblem.descriptionTextField,
          errorText: state.description.displayError != null
              ? t.formats.minimum50
              : null,
        );
      },
    );
  }
}

class _PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) =>
          previous.phoneNumber != current.phoneNumber,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (phoneNumber) => context
              .read<ReportProblemCubit>()
              .phoneNumberChanged(phoneNumber),
          hint: t.reportProblem.descriptionTextField,
          errorText: state.phoneNumber.displayError != null
              ? t.formats.wrongNumberFormat
              : null,
        );
      },
    );
  }
}
