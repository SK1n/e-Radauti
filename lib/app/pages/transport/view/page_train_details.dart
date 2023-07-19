import 'package:flutter/material.dart';
import '../../../models/transport/train/train_model.dart';
import '../../../utils/scaffolds/app_sliver_scaffold.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PageTrainDetails extends StatelessWidget {
  final TrainItemModel data;
  const PageTrainDetails({super.key, required this.data});
  static Route<void> route(TrainItemModel data) {
    return MaterialPageRoute<void>(
        builder: (_) => PageTrainDetails(data: data));
  }

  @override
  Widget build(BuildContext context) {
    return AppSliverScaffold(
      appBarTitle: data.trainCategory + data.trainNr,
      showDrawerButton: false,
      slivers: [
        SliverList.builder(
          itemBuilder: (context, index) {
            StationsItemModel stations = data.stations[index];
            return TimelineTile(
              indicatorStyle: IndicatorStyle(
                width: 40,
                color: index == 0
                    ? Colors.blueAccent
                    : index + 1 == data.stations.length
                        ? Colors.orangeAccent
                        : Colors.greenAccent,
                iconStyle: IconStyle(
                  iconData: Icons.train_outlined,
                  color: Colors.white,
                ),
              ),
              isFirst: index == 0,
              isLast: index + 1 == data.stations.length,
              alignment: TimelineAlign.center,
              lineXY: 0.3,
              startChild: Container(
                margin: const EdgeInsets.only(right: 10),
                alignment: Alignment.centerRight,
                child: Text(stations.aTime),
              ),
              endChild: Container(
                padding: const EdgeInsets.only(left: 10),
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints(minHeight: 100),
                child: Text(stations.aStation),
              ),
            );
          },
          itemCount: data.stations.length,
        )
      ],
    );
  }
}
