import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/volunteering/volunteering_model.dart';
import '../cubit/volunteering_cubit.dart';
import '../../../repository/firestore/firestore_repository.dart';
import '../../../repository/storage/storage_repository.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/scaffolds/app_sliver_scaffold.dart';
import '../../../utils/widgets/image_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PageVolunteering extends StatelessWidget {
  const PageVolunteering({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const PageVolunteering());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VolunteeringCubit(
        firestoreRepository: context.read<FirestoreRepository>(),
        storageRepository: context.read<StorageRepository>(),
      )..getData(),
      child: AppSliverScaffold(
        appBarTitle: t.volunteering.title,
        slivers: [
          BlocConsumer<VolunteeringCubit, VolunteeringState>(
            builder: (context, state) {
              if (state.state.isInProgress) {
                return const SliverToBoxAdapter(child: LoadingWidget());
              } else if (state.state.isFalure) {
                return SliverToBoxAdapter(
                  child: ErrorWidget(''),
                );
              } else if (state.data.isEmpty) {
                return SliverToBoxAdapter(child: Container());
              } else {
                return SliverGrid.builder(
                  itemBuilder: (context, index) {
                    return _Item(item: state.data[index]);
                  },
                  itemCount: state.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                );
              }
            },
            listener: (context, state) {},
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final VolunteeringItemModel item;
  const _Item({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageWidget(
              link: item.image,
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.name,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1F2937),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              await launchUrlString(item.website);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                t.volunteering.webSite,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF458AFC),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                item.phoneNumber.isNotEmpty
                    ? Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await launchUrlString('tel:${item.phoneNumber}');
                          },
                          child: const Icon(
                            Icons.phone,
                            color: Color.fromRGBO(156, 163, 175, 1),
                          ),
                        ),
                      )
                    : Container(),
                item.email.isNotEmpty
                    ? Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            await launchUrlString('mailto:${item.email}');
                          },
                          child: const Icon(
                            Icons.email,
                            color: Color.fromRGBO(156, 163, 175, 1),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
