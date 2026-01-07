import 'package:freezed_annotation/freezed_annotation.dart';

part 'repository_error.freezed.dart';

/// Represents errors that can occur in repository operations.
@freezed
abstract class RepositoryError with _$RepositoryError {
  const factory RepositoryError.network({String? message}) = NetworkError;
  const factory RepositoryError.server({String? message}) = ServerError;
  const factory RepositoryError.unauthorized({String? message}) =
      UnauthorizedError;
  const factory RepositoryError.notFound({String? message}) = NotFoundError;
  const factory RepositoryError.unknown({String? message}) = UnknownError;
}
