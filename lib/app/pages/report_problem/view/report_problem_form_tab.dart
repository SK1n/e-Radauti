import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutterapperadauti/app/pages/report_problem/cubit/report_problem_cubit.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'package:flutterapperadauti/app/utils/widgets/loading_widget.dart';
import 'package:flutterapperadauti/gen/strings.g.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:formz/formz.dart';

import 'package:geolocator/geolocator.dart';

class ReportProblemFormTab extends StatefulWidget {
  const ReportProblemFormTab({super.key});

  @override
  State<ReportProblemFormTab> createState() => _ReportProblemFormTabState();
}

class _ReportProblemFormTabState extends State<ReportProblemFormTab> {
  late final TextEditingController phoneController;
  late final TextEditingController subjectController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    phoneController = TextEditingController(text: '');
    subjectController = TextEditingController(text: '');
    descriptionController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    subjectController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    final Map<String, String> institutionsDropDowns = {
      'relatiipublice@primariaradauti.ro':
          context.t.reportProblem.radautiCityHall,
      'office@serviciicomunale.ro': context.t.reportProblem.comunalServices,
      'agentia.radauti@acetsv.ro': context.t.reportProblem.acetRadauti,
      'contact@cjsuceava.ro': context.t.reportProblem.suceavaCountyCouncil,
      'cjsuceava@gnm.ro': context.t.reportProblem.suceavaEnvironmentalGuard,
      'gardaforestiera.suceava@gmail.com':
          context.t.reportProblem.suceavaForestGuard,
      'dspsv@dspsv.ro': context.t.reportProblem.dspSuceava,
      'marginea@suceava.rosilva.ro':
          context.t.reportProblem.ocolulSilvicMarginea,
      'radautiulcivic@gmail.com':
          context.t.reportProblem.radautiulCivicAssociation,
    };
    final Map<String, String> categoryDropDowns = {
      context.t.reportProblem.infrastructure:
          context.t.reportProblem.infrastructure,
      context.t.reportProblem.utilitiesProblem:
          context.t.reportProblem.utilitiesProblem,
      context.t.reportProblem.uncollectedGarbage:
          context.t.reportProblem.uncollectedGarbage,
      context.t.reportProblem.infrastructureStreets:
          context.t.reportProblem.infrastructureStreets,
      context.t.reportProblem.illegalConstructions:
          context.t.reportProblem.illegalConstructions,
      context.t.reportProblem.airQualityPollution:
          context.t.reportProblem.airQualityPollution,
      context.t.reportProblem.safety: context.t.reportProblem.safety,
      context.t.reportProblem.other: context.t.reportProblem.other,
    };

    return BlocListener<ReportProblemCubit, ReportProblemState>(
      listener: (context, state) async {
        if (state.formzStatus.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
        } else if (state.formzStatus.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(context.t.reportProblem.sentSuccessfully),
              ),
            );
        }
        if (state.positionState.isDenied) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  context.t.reportProblem.positionSwitch.denied,
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
                  context.t.reportProblem.positionSwitch.deniedForever,
                ),
              ),
            );
        } else if (state.positionState.isDisabled) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  context.t.reportProblem.positionSwitch.disabled,
                ),
              ),
            );
        }
      },
      child: BlocBuilder<ReportProblemCubit, ReportProblemState>(
        builder: (context, state) {
          return SliverToBoxAdapter(
            child: FormBuilder(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderTextField(
                      name: 'name',
                      onChanged: (username) => context
                          .read<ReportProblemCubit>()
                          .usernameChanged(username ?? ''),
                      initialValue: state.form.name.value,
                      decoration: InputDecoration(
                          errorText: state.form.isPure
                              ? null
                              : state.form.name.error?.text(),
                          labelText: context.t.reportProblem.usernameTextField),
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderTextField(
                      name: 'email',
                      onChanged: (email) => context
                          .read<ReportProblemCubit>()
                          .emailChanged(email ?? ''),
                      initialValue: state.form.email.value,
                      validator: (_) => state.form.email.displayError?.text(),
                      decoration: InputDecoration(
                        labelText: state.form.isPure
                            ? null
                            : context.t.reportProblem.emailTextField,
                        errorText: state.form.email.error?.text(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderTextField(
                      name: 'phone',
                      controller: phoneController,
                      onChanged: (phone) => context
                          .read<ReportProblemCubit>()
                          .phoneNumberChanged(phone ?? ''),
                      validator: (_) => state.form.phone.displayError?.text(),
                      decoration: InputDecoration(
                        labelText: context.t.reportProblem.phoneNumberTextField,
                        errorText: state.form.isPure
                            ? null
                            : state.form.phone.error?.text(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderDropdown(
                      name: 'category',
                      items: categoryDropDowns.entries
                          .map((entry) => DropdownMenuItem(
                                value: entry.key,
                                child: Text(entry.value),
                              ))
                          .toList(),
                      onChanged: (category) => context
                          .read<ReportProblemCubit>()
                          .categoryChanged(category ?? ""),
                      decoration: InputDecoration(
                          errorText: state.form.isPure
                              ? null
                              : state.form.category.error?.text(),
                          labelText: context.t.reportProblem.categoryDropdown),
                      validator: (_) =>
                          state.form.category.displayError?.text(),
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderDropdown(
                      name: 'institution',
                      items: institutionsDropDowns.entries
                          .map((entry) => DropdownMenuItem(
                                value: entry.key,
                                child: Text(entry.value),
                              ))
                          .toList(),
                      onChanged: (institution) => context
                          .read<ReportProblemCubit>()
                          .institutionChanged(institution ?? ""),
                      decoration: InputDecoration(
                        errorText: state.form.isPure
                            ? null
                            : state.form.institution.error?.text(),
                        labelText: context.t.reportProblem.institutionDropdown,
                      ),
                      validator: (_) =>
                          state.form.institution.displayError?.text(),
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderTextField(
                      name: 'subject',
                      controller: subjectController,
                      onChanged: (subject) => context
                          .read<ReportProblemCubit>()
                          .subjectChanged(subject ?? ''),
                      validator: (_) => state.form.subject.displayError?.text(),
                      decoration: InputDecoration(
                        errorText: state.form.isPure
                            ? null
                            : state.form.subject.error?.text(),
                        labelText: context.t.reportProblem.subjectTextField,
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderTextField(
                      name: 'description',
                      controller: descriptionController,
                      onChanged: (description) => context
                          .read<ReportProblemCubit>()
                          .descriptionChanged(description ?? ''),
                      validator: (_) =>
                          state.form.description.displayError?.text(),
                      decoration: InputDecoration(
                        errorText: state.form.isPure
                            ? null
                            : state.form.description.error?.text(),
                        labelText: context.t.reportProblem.descriptionTextField,
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderSwitch(
                      name: 'location',
                      initialValue: state.form.location.value,
                      title: Text(
                        context.t.reportProblem.locationSwitch,
                      ),
                      onChanged: state.positionState.isInProgress
                          ? null
                          : (value) {
                              context
                                  .read<ReportProblemCubit>()
                                  .locationChanged(value ?? false);
                            },
                    ),
                  ),
                  Padding(
                    padding: AppConstants.innerCardPadding,
                    child: FormBuilderImagePicker(
                      name: 'images',
                      maxImages: 3,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: state.form.isPure
                            ? null
                            : state.form.images.error?.text(),
                        labelText: context.t.reportProblem.imagePicker,
                      ),
                      validator: (value) => state.form.isPure
                          ? null
                          : state.form.images.displayError?.text(),
                      onChanged: (value) => context
                          .read<ReportProblemCubit>()
                          .imagePickerChanged(value),
                    ),
                  ),
                  state.formzStatus.isInProgress
                      ? const LoadingWidget()
                      : Padding(
                          padding: AppConstants.innerCardPadding,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: FilledButton(
                              onPressed: state.form.isValid
                                  ? () async {
                                      await context
                                          .read<ReportProblemCubit>()
                                          .sendReport(
                                            categoryDropDowns,
                                          );
                                      formKey.currentState!.reset();
                                      phoneController.clear();
                                      subjectController.clear();
                                      descriptionController.clear();
                                    }
                                  : null,
                              child: Text(context.t.reportProblem.submitButton),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
