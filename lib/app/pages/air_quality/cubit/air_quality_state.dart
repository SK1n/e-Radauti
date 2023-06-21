part of 'air_quality_cubit.dart';

enum QualityStatus { initial, inProgress, failure, success }

extension QualityStatusX on QualityStatus {
  bool get isInitial => this == QualityStatus.initial;
  bool get isInProgress => this == QualityStatus.inProgress;
  bool get isFailure => this == QualityStatus.failure;
  bool get isSuccess => this == QualityStatus.success;
}

@freezed
class AirQualityState with _$AirQualityState {
  const factory AirQualityState({
    @Default(QualityStatus.initial) QualityStatus qualityStatus,
    String? qualityHtml,
  }) = _AirQualityState;
}
