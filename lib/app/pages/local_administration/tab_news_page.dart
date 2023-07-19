

// class TabNewsPage extends StatelessWidget {
//   const TabNewsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LocalAdministrationCubit, LocalAdministrationState>(
//       listener: (context, state) {},
//       child: BlocBuilder<LocalAdministrationCubit, LocalAdministrationState>(
//         builder: (context, state) {
//           if (state.newsState.isInProgress) {
//             return const SliverToBoxAdapter(child: LoadingWidget());
//           } else if (state.newsState.isSuccess) {
//             return SliverToBoxAdapter(
//               child: ItemLocalDecision(
//                 item: state.latestDecision!,
//               ),
//             );
//           } else {
//             return SliverToBoxAdapter(
//               child: ErrWidget(
//                   error: state.errorMessageNews,
//                   retry: () async => context.read<LocalAdministrationCubit>()
//                     ..getLastDecision()),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
