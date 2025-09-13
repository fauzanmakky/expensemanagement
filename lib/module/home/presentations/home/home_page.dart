import 'package:expensemanagement/commons/constants/color_constants.dart';
import 'package:expensemanagement/commons/constants/route_constants.dart';
import 'package:expensemanagement/commons/util/color_from_hex.dart';
import 'package:expensemanagement/commons/util/number_format.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_bloc.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_event.dart';
import 'package:expensemanagement/module/home/presentations/home/bloc/home_state.dart';
import 'package:expensemanagement/module/home/presentations/widget/category_card.dart';
import 'package:expensemanagement/module/home/presentations/widget/empty_card.dart';
import 'package:expensemanagement/module/home/presentations/widget/expense_item_card.dart';
import 'package:expensemanagement/module/home/presentations/widget/sticky_section_header.dart';
import 'package:expensemanagement/module/home/presentations/widget/summary_card.dart';
import 'package:expensemanagement/style/typography/expense_management_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();

    return Scaffold(
      backgroundColor: colorFromHex(ColorConstants.white),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RouteConstants.expense).then((_) {
            homeBloc.add(LoadHomeData());
          });
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text('Error: ${state.error}'));
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 16.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo, User!',
                          style: Theme.of(context).textTheme.titleLarge
                              ?.copyWith(
                                fontSize: 18.sp,
                                color: colorFromHex(ColorConstants.grey1),
                              ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Jangan lupa catat keuanganmu setiap hari!',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                fontSize: 14.sp,
                                color: colorFromHex(ColorConstants.grey3),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),

                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: SummaryCard(
                            title: 'Pengeluaran hari ini',
                            amount: FormatNumber.currency(
                              state.todayTotal.toString(),
                            ),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: SummaryCard(
                            title: 'Pengeluaran bulan ini',
                            amount: FormatNumber.currency(
                              state.thisMonthTotal.toString(),
                            ),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 18.h)),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Pengeluaran berdasarkan kategori',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 14.sp,
                        color: colorFromHex(ColorConstants.grey1),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(23.w, 20.h, 23.w, 0.h),
                  sliver: state.thisMonthByCategory.isEmpty
                      ? const SliverToBoxAdapter(child: EmptyCard())
                      : SliverToBoxAdapter(
                          child: SizedBox(
                            height: 120.h,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              itemCount: state.thisMonthByCategory.length,
                              itemBuilder: (context, index) {
                                final cat = state.thisMonthByCategory[index];
                                return Padding(
                                  padding: EdgeInsets.only(right: 12.w),
                                  child: CategoryCard(
                                    icon: cat.icon,
                                    title: cat.label,
                                    amount: cat.total.toString(),
                                    iconColor: colorFromHex(cat.color),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                StickySectionHeader(title: 'Hari ini'),
                state.todayExpenses.isEmpty
                    ? SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: EmptyCard(),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final e = state.todayExpenses[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 6.h,
                            ),
                            child: ExpenseItemCard(
                              icon: e.icon,
                              iconColor: colorFromHex(e.color),
                              title: e.label,
                              amount: FormatNumber.currency(e.price.toString()),
                            ),
                          );
                        }, childCount: state.todayExpenses.length),
                      ),

                StickySectionHeader(title: 'Kemarin'),
                state.yesterdayExpenses.isEmpty
                    ? SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: EmptyCard(),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final e = state.yesterdayExpenses[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 6.h,
                            ),
                            child: ExpenseItemCard(
                              icon: e.icon,
                              iconColor: colorFromHex(e.color),
                              title: e.label,
                              amount: FormatNumber.currency(e.price.toString()),
                            ),
                          );
                        }, childCount: state.yesterdayExpenses.length),
                      ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h)),
              ],
            );
          },
        ),
      ),
    );
  }
}
