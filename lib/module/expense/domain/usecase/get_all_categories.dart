import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart' show Failure;
import 'package:expensemanagement/module/expense/domain/entitiy/category_entity.dart';
import 'package:expensemanagement/module/expense/domain/repositories/category_repository.dart';

class GetAllCategories {
  final CategoryRepository repository;

  GetAllCategories(this.repository);

  Future<Either<Failure, List<CategoryEntity>>> call() async {
    return await repository.getAllCategories();
  }
}
