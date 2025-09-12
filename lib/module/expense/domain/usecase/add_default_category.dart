import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/repositories/category_repository.dart';

class InsertDefaultCategories {
  final CategoryRepository repository;

  InsertDefaultCategories(this.repository);

  Future<Either<Failure, void>> call() async {
    return await repository.insertDefaults();
  }
}
