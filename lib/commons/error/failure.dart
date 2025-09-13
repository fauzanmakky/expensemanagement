import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];


}

class DatabaseFailure extends Failure {
  final message;

  @override
  List<Object> get props => [message];

  const DatabaseFailure({
    required this.message,
  });
}

