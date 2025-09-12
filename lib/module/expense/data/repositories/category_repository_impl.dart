import 'package:dartz/dartz.dart';
import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/expense/data/mappers/category_mapper.dart';
import 'package:expensemanagement/module/expense/data/model/category_data_model.dart';
import 'package:expensemanagement/module/expense/datasource/category_local_datasource.dart';
import 'package:expensemanagement/module/expense/domain/entitiy/category_entity.dart';
import 'package:expensemanagement/module/expense/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalDataSource _localDataSource;

  CategoryRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      final List<CategoryDataModel> result = await _localDataSource
          .getAllCategory();
      final entities = CategoryMapper.toEntityList(result);
      return Right(entities);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> insertDefaults() async {
    try {
      await _localDataSource.insertDefaults();
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: e.toString()));
    }
  }
}
