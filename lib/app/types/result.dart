import 'package:dogfydiet/app/types/repository_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// A Result type that represents either a success or failure state.
/// This is the standard way to handle repository responses in this architecture.
@freezed
abstract class Result<T> with _$Result<T> {
  /// Factory constructor for representing a failure.
  /// Takes an instance of 'RepositoryError' as a required parameter.
  const factory Result.failure({required RepositoryError error}) = Failure<T>;

  /// Factory constructor for representing a success.
  /// Takes an instance of 'T' as the data.
  const factory Result.success(T data) = Success<T>;
}
