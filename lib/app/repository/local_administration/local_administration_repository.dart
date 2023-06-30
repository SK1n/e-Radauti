import 'package:dio/dio.dart';
import 'package:flutterapperadauti/app/models/local_administration/decision_model.dart';
import 'package:flutterapperadauti/app/models/local_administration/local_council_model.dart';
import 'package:flutterapperadauti/app/repository/local_administration/i_local_administration.dart';

class LocalAdministrationException implements Exception {
  const LocalAdministrationException([
    this.message = "An unknown exception occurred.",
  ]);

  final String message;

  factory LocalAdministrationException.fromCode(int statusCode) {
    switch (statusCode) {
      case 400:
        return const LocalAdministrationException('Bad Request');
      case 401:
        return const LocalAdministrationException('Unauthorized');
      case 403:
        return const LocalAdministrationException('Forbidden');
      case 404:
        return const LocalAdministrationException('Not Found');
      case 500:
        return const LocalAdministrationException('Internal server error');
      default:
        return const LocalAdministrationException();
    }
  }
}

class LocalAdministrationRepository extends ILocalAdministration {
  final ILocalAdministration _repo;
  LocalAdministrationRepository({ILocalAdministration? repo})
      : _repo = repo ?? ILocalAdministration();

  @override
  Future<List<LocalCouncilModel>> getLocalCouncil() async {
    try {
      return _repo.getLocalCouncil();
    } on DioException catch (e) {
      throw LocalAdministrationException(
        'Exception: ${e.message}\nCode : ${e.hashCode}',
      );
    } on LocalAdministrationException {
      rethrow;
    } catch (e) {
      throw const LocalAdministrationException();
    }
  }

  @override
  Future<List<DecisionModel>> getDecisions() async {
    try {
      return _repo.getDecisions();
    } on DioException catch (e) {
      throw LocalAdministrationException(
        'Exception: ${e.message}\nCode : ${e.hashCode}',
      );
    } on LocalAdministrationException {
      rethrow;
    } catch (e) {
      throw const LocalAdministrationException();
    }
  }

  @override
  Future<DecisionModel> getLatestDecision() async {
    try {
      return _repo.getLatestDecision();
    } on DioException catch (e) {
      throw LocalAdministrationException(
        'Exception: ${e.message}\nCode : ${e.hashCode}',
      );
    } on LocalAdministrationException {
      rethrow;
    } catch (e) {
      throw const LocalAdministrationException();
    }
  }
}
