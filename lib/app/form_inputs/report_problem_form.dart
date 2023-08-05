import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_problem_form.freezed.dart';

@freezed
class ReportProblemForm with _$ReportProblemForm, FormzMixin {
  const factory ReportProblemForm({
    @Default(EmailInput.pure()) final EmailInput email,
    @Default(NameInput.pure()) final NameInput name,
    @Default(PhoneInput.pure()) final PhoneInput phone,
    @Default(CategoryInput.pure()) final CategoryInput category,
    @Default(InstitutionInput.pure()) final InstitutionInput institution,
    @Default(SubjectInput.pure()) final SubjectInput subject,
    @Default(DescriptionInput.pure()) final DescriptionInput description,
    @Default(LocationInput.pure()) final LocationInput location,
    @Default(ImageInput.dirty([])) final ImageInput images,
  }) = _ReportProblemForm;

  const ReportProblemForm._();

  @override
  List<FormzInput> get inputs => [
        email,
        name,
        phone,
        category,
        institution,
        subject,
        description,
        location,
        images,
      ];
  ReportProblemForm clear() {
    return ReportProblemForm(
      email: const EmailInput.pure(),
      name: const NameInput.pure(),
      phone: const PhoneInput.pure(),
      category: const CategoryInput.pure(),
      institution: const InstitutionInput.pure(),
      subject: const SubjectInput.pure(),
      description: const DescriptionInput.pure(),
      location: const LocationInput.pure(),
      images: ImageInput.pure(),
    );
  }
}
