import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/domain/entitiy/category_entity.dart';

abstract class CategoryRepository{
  Future<Either<Failure,List<CategoryEntity>>> getAllCategories();
  Future<Either<Failure,void>> insertDefaults();
}