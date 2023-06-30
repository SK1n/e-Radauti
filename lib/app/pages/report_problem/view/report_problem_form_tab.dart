import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/form_inputs/report_problem_form.dart';
import 'package:flutterapperadauti/app/pages/report_problem/cubit/report_problem_cubit.dart';
import 'package:flutterapperadauti/app/utils/widgets/border_dropdown_button_form_field.dart';
import 'package:flutterapperadauti/app/utils/widgets/border_text_form_field.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:formz/formz.dart';
import 'package:geolocator/geolocator.dart';

class ReportProblemFormTab extends StatelessWidget {
  const ReportProblemFormTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportProblemCubit, ReportProblemState>(
      listener: (context, state) async {
        if (state.formzStatus.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content:
                    Text(state.errorMessage ?? t.reportProblem.sentFailure),
              ),
            );
        } else if (state.formzStatus.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(t.reportProblem.sentSuccessfully),
              ),
            );
        }
        if (state.positionState.isDenied) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  t.reportProblem.positionSwitch.denied,
                ),
              ),
            );
          await Geolocator.requestPermission();
        } else if (state.positionState.isDeniedForever) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  t.reportProblem.positionSwitch.deniedForever,
                ),
              ),
            );
        } else if (state.positionState.isDisabled) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  t.reportProblem.positionSwitch.disabled,
                ),
              ),
            );
        }
      },
      child: SliverList(
        delegate: SliverChildListDelegate(
          [
            _UsernameInput(),
            _EmailInput(),
            _PhoneNumberInput(),
            _CategoryDropdown(),
            _InstitutionDropdown(),
            _SubjectInput(),
            _DescriptionInput(),
            _LocationSwitch(),
            _ImagePickerField(),
            _SendButton(),
          ],
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

class _SubjectInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) => previous.subject != current.subject,
      builder: (context, state) {
        return BorderTextFormField(
          onChanged: (subject) =>
              context.read<ReportProblemCubit>().subjectChanged(subject),
          hint: t.reportProblem.subjectTextField,
          initialValue: state.subject.value,
          errorText: state.subject.error != null
              ? _getErrorText(state.subject.error!)
              : null,
        );
      },
    );
  }

  String? _getErrorText(GenericValidationError error) {
    switch (error) {
      case GenericValidationError.required:
        return t.formats.requiredField;
      default:
        return null;
    }
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
          initialValue: state.description.value,
          errorText: state.description.error != null
              ? _getErrorText(state.description.error!)
              : null,
        );
      },
    );
  }

  String? _getErrorText(GenericValidationError error) {
    switch (error) {
      case GenericValidationError.required:
        return t.formats.requiredField;
      case GenericValidationError.minLength:
        return t.formats.minimum50;
      default:
        return null;
    }
  }
}

class _InstitutionDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> dropDowns = {
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
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) =>
          previous.institution != current.institution,
      builder: (context, state) {
        return BorderDropdownButtonFormField(
          onChanged: (institution) => context
              .read<ReportProblemCubit>()
              .institutionChanged(institution ?? ""),
          hint: t.reportProblem.institutionDropdown,
          items: dropDowns,
          errorText: state.institution.error != null
              ? _getErrorText(state.institution.error!)
              : null,
        );
      },
    );
  }

  String? _getErrorText(GenericValidationError error) {
    switch (error) {
      case GenericValidationError.required:
        return t.formats.requiredField;
      default:
        return null;
    }
  }
}

final Map<String, String> _category = {
  t.reportProblem.infrastructure: t.reportProblem.infrastructure,
  t.reportProblem.utilitiesProblem: t.reportProblem.utilitiesProblem,
  t.reportProblem.uncollectedGarbage: t.reportProblem.uncollectedGarbage,
  t.reportProblem.infrastructureStreets: t.reportProblem.infrastructureStreets,
  t.reportProblem.illegalConstructions: t.reportProblem.illegalConstructions,
  t.reportProblem.airQualityPollution: t.reportProblem.airQualityPollution,
  t.reportProblem.safety: t.reportProblem.safety,
  t.reportProblem.other: t.reportProblem.other,
};

class _CategoryDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) => previous.category != current.category,
      builder: (context, state) {
        return BorderDropdownButtonFormField(
          onChanged: (category) => context
              .read<ReportProblemCubit>()
              .categoryChanged(category ?? ""),
          hint: t.reportProblem.categoryDropdown,
          items: _category,
          errorText: state.category.error != null
              ? _getErrorText(state.category.error!)
              : null,
        );
      },
    );
  }

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

  String? _getErrorText(GenericValidationError error) {
    switch (error) {
      case GenericValidationError.required:
        return t.formats.requiredField;
      default:
        return null;
    }
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
          hint: t.reportProblem.phoneNumberTextField,
          initialValue: state.phoneNumber.value,
          errorText: state.phoneNumber.error != null
              ? _getErrorText(state.phoneNumber.error!)
              : null,
        );
      },
    );
  }

  String? _getErrorText(GenericValidationError error) {
    switch (error) {
      case GenericValidationError.required:
        return t.formats.requiredField;
      case GenericValidationError.pattern:
        return t.formats.invalidPhoneNumber;
      default:
        return null;
    }
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
          errorText: state.email.error != null
              ? _getErrorText(state.email.error!)
              : null,
        );
      },
    );
  }

  String? _getErrorText(GenericValidationError error) {
    switch (error) {
      case GenericValidationError.required:
        return t.formats.requiredField;
      case GenericValidationError.email:
        return t.formats.invalidEmail;
      default:
        return null;
    }
  }
}

class _LocationSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocSelector<ReportProblemCubit, ReportProblemState, bool>(
      selector: (state) => state.locationEnabled.value,
      builder: (context, location) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: SwitchListTile(
              value: location,
              title: Text(
                t.reportProblem.locationSwitch,
                style: const TextStyle(fontSize: 14),
              ),
              onChanged: (value) =>
                  context.read<ReportProblemCubit>().locationChanged(value),
            ),
          ),
        );
      },
    );
  }
}

class _ImagePickerField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      buildWhen: (previous, current) =>
          previous.imagePicker.value != current.imagePicker.value,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  t.reportProblem.imagePicker,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              FormBuilderImagePicker(
                name: 'image_picker',
                maxImages: 3,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  errorText: state.imagePicker.error != null
                      ? _getErrorText(state.imagePicker.error!)
                      : null,
                ),
                onChanged: (value) => context
                    .read<ReportProblemCubit>()
                    .imagePickerChanged(value),
              ),
            ],
          ),
        );
      },
    );
  }

  String? _getErrorText(GenericValidationError error) {
    switch (error) {
      case GenericValidationError.required:
        return t.formats.requiredField;
      default:
        return null;
    }
  }
}

class _SendButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportProblemCubit, ReportProblemState>(
      builder: (context, state) {
        return state.formzStatus.isInProgress
            ? const LoadingWidget()
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FilledButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => context
                        .read<ReportProblemCubit>()
                        .sendReport(_category),
                    child: Text(t.reportProblem.submitButton),
                  ),
                ),
              );
      },
    );
  }
}
