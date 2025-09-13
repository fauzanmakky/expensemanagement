import 'package:expensemanagement/commons/error/failure.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_this_month_by_category.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_this_month_total.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_today_expenses.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_today_total.dart';
import 'package:expensemanagement/module/home/domain/usecase/get_yesterday_expenses.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_event.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTodayExpenses getTodayExpenses;
  final GetYesterdayExpenses getYesterdayExpenses;
  final GetTodayTotal getTodayTotal;
  final GetThisMonthTotal getThisMonthTotal;
  final GetThisMonthByCategory getThisMonthByCategory;

  HomeBloc({
    required this.getTodayExpenses,
    required this.getYesterdayExpenses,
    required this.getTodayTotal,
    required this.getThisMonthTotal,
    required this.getThisMonthByCategory,
  }) : super(const HomeState()) {
    on<LoadHomeData>(_onLoadHomeData);
  }

  Future<void> _onLoadHomeData(
    LoadHomeData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final todayResult = await getTodayExpenses();
      final yesterdayResult = await getYesterdayExpenses();
      final todayTotalResult = await getTodayTotal();
      final thisMonthTotalResult = await getThisMonthTotal();
      final thisMonthByCategoryResult = await getThisMonthByCategory();

      todayResult.fold((failure) {
        if (failure is DatabaseFailure) {
          emit(state.copyWith(error: failure.message));
        }
      }, (data) => emit(state.copyWith(todayExpenses: data)));

      yesterdayResult.fold((failure) {
        if (failure is DatabaseFailure) {
          emit(state.copyWith(error: failure.message));
        }
      }, (data) => emit(state.copyWith(yesterdayExpenses: data)));

      todayTotalResult.fold((failure) {
        if (failure is DatabaseFailure) {
          emit(state.copyWith(error: failure.message));
        }
      }, (total) => emit(state.copyWith(todayTotal: total)));

      thisMonthTotalResult.fold((failure) {
        if (failure is DatabaseFailure) {
          emit(state.copyWith(error: failure.message));
        }
      }, (total) => emit(state.copyWith(thisMonthTotal: total)));

      thisMonthByCategoryResult.fold((failure) {
        if (failure is DatabaseFailure) {
          emit(state.copyWith(error: failure.message));
        }
      }, (data) => emit(state.copyWith(thisMonthByCategory: data)));

      emit(state.copyWith(isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
