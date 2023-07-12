part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    // Last Decision
    @Default(PageState.initial) PageState dmState,
    DecisionModel? dmData,
    @Default('') String dmErrorMessage,

    //Next Event
    @Default(PageState.initial) PageState eventState,
    EventsItemModel? eventData,
    @Default('') String eventError,

    // Nums of reports
    @Default(PageState.initial) PageState numsOfReportsState,
    @Default(0) numsOfReports,
    @Default('') String numsOfReportsError,

    // Is user annonymous
    @Default(false) isAnnonymous,
  }) = _HomeState;
}
