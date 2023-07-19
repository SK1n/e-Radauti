import 'package:flutterapperadauti/app/form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

class ReportProblemForm with FormzMixin {
  // const factory ReportProblemForm({
  //   @Default(EmailInput.pure()) final EmailInput email,
  //   @Default(NameInput.pure()) final NameInput name,
  //   @Default(PhoneInput.pure()) final PhoneInput phone,
  //   @Default(CategoryInput.pure()) final CategoryInput category,
  //   @Default(InstitutionInput.pure()) final InstitutionInput institution,
  //   @Default(SubjectInput.pure()) final SubjectInput subject,
  //   @Default(DescriptionInput.pure()) final DescriptionInput description,
  //   @Default(LocationInput.pure()) final LocationInput location,
  //   @Default(ImageInput.dirty([])) final ImageInput images,
  // }) = _ReportProblemForm;

  // @override
  // List<FormzInput> get inputs => [
  //       email,
  //       name,
  //       phone,
  //       category,
  //       institution,
  //       subject,
  //       description,
  //       location,
  //       images,
  //     ];

  ReportProblemForm({
    this.name = const NameInput.pure(),
    this.phone = const PhoneInput.pure(),
    this.category = const CategoryInput.pure(),
    this.institution = const InstitutionInput.pure(),
    this.subject = const SubjectInput.pure(),
    this.description = const DescriptionInput.pure(),
    this.location = const LocationInput.pure(),
    this.email = const EmailInput.pure(),
    ImageInput? images,
  }) : images = images ?? ImageInput.pure();

  final EmailInput email;
  final NameInput name;
  final PhoneInput phone;
  final CategoryInput category;
  final InstitutionInput institution;
  final SubjectInput subject;
  final DescriptionInput description;
  final LocationInput location;
  final ImageInput images;

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

  ReportProblemForm copyWith({
    EmailInput? email,
    NameInput? name,
    PhoneInput? phone,
    CategoryInput? category,
    InstitutionInput? institution,
    SubjectInput? subject,
    DescriptionInput? description,
    LocationInput? location,
    ImageInput? images,
  }) {
    return ReportProblemForm(
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      category: category ?? this.category,
      institution: institution ?? this.institution,
      subject: subject ?? this.subject,
      description: description ?? this.description,
      location: location ?? this.location,
      images: images ?? this.images,
    );
  }

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
