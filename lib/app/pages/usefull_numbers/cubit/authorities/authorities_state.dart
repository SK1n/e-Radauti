part of 'authorities_cubit.dart';

@freezed
class AuthoritiesState with _$AuthoritiesState {
  const factory AuthoritiesState({
    @Default(PageState.initial) PageState state,
    @Default([]) List<AuthoritiesItemModel> data,
    @Default('') String errorMessage,
  }) = _AuthoritiesState;
}
