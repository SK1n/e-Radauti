import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutterapperadauti/app/pages/air_quality/cubit/air_quality_cubit.dart';
import 'package:flutterapperadauti/utils/loading_widget.dart';
import 'package:flutterapperadauti/utils/shared_widgets/err_widget.dart';
import 'package:logger/logger.dart';

class QualityTab extends StatelessWidget {
  const QualityTab({super.key});

  @override
  Widget build(BuildContext context) {
    Logger log = Logger();
    return BlocListener<AirQualityCubit, AirQualityState>(
      listener: (context, state) {
        if (state.qualityStatus == QualityStatus.failure) {
          log.d('Failure');
        }
      },
      child: BlocBuilder<AirQualityCubit, AirQualityState>(
        builder: (context, state) {
          if (state.qualityStatus == QualityStatus.inProgress) {
            return const SliverToBoxAdapter(child: LoadingWidget());
          } else if (state.qualityStatus == QualityStatus.failure) {
            return SliverToBoxAdapter(
              child: ErrWidget(
                error: '',
                retry: () {},
              ),
            );
          } else {
            return SliverFillRemaining(
              hasScrollBody: true,
              child: InAppWebView(
                initialUrlRequest: URLRequest(
                  url: Uri.parse(
                      'https://calitateaer.radautiulcivic.ro/wp-content/uploads/2023/06/Calitatea_aerului_e-Radauti_App.html'),
                ),
                onWebViewCreated: (controller) {},
              ),
            );
          }
        },
      ),
    );
  }
}
