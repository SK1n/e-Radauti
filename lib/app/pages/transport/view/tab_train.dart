import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import '../../../models/transport/train/train_model.dart';
import '../cubit/train/train_cubit.dart';
import 'page_train_details.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import '../../../utils/widgets/err_widget.dart';

class TabTrain extends StatelessWidget {
  const TabTrain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: TrainCubit(
        firestoreRepository: context.read<FirestoreRepository>(),
      ),
      child: BlocConsumer<TrainCubit, TrainState>(
        builder: (context, state) {
          if (state.state.isInProgress) {
            return const SliverToBoxAdapter(child: LoadingWidget());
          } else if (state.state.isFalure) {
            return SliverToBoxAdapter(
              child: ErrWidget(
                error: state.errorMessage,
                retry: () async => context.read<TrainCubit>().getData(),
              ),
            );
          } else if (state.data.isEmpty) {
            return SliverToBoxAdapter(
              child: EmptyWidget(
                text: t.transport.emptyTrain,
              ),
            );
          } else {
            return SliverList.builder(
              itemBuilder: (context, index) {
                var item = state.data[index];
                return Padding(
                  padding: AppConstants.bottomDelimiter,
                  child: Card(
                    child: ListTile(
                      leading: const Icon(Icons.train),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      subtitle: Text(
                        _getSubtitle(item),
                        textAlign: TextAlign.center,
                      ),
                      title: Text(
                        _getTitle(item),
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => Navigator.of(context).push(
                        PageTrainDetails.route(item),
                      ),
                    ),
                  ),
                );
              },
              itemCount: state.data.length,
            );
          }
        },
        listener: (context, state) {},
      ),
    );
  }
}

String _getTitle(TrainItemModel train) {
  String start = train.stations.first.dStation;
  String end = train.stations.last.aStation;
  return '$start - $end';
}

String _getSubtitle(TrainItemModel train) {
  String start = train.stations.first.dTime;
  String end = train.stations.last.aTime;
  String day = int.parse(train.trainNr) % 2 == 0 ? ' L - V ' : ' S - D ';
  return '${train.trainCategory}${train.trainNr} ( $start - $end ) $day';
}
