import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/e_radauti_website/e_radauti_website_model.dart';
import '../cubit/furniture/furniture_cubit.dart';
import '../../../utils/extensions/format_date.dart';
import '../../../utils/page_state.dart';
import '../../../utils/widgets/err_widget.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TabFurnitureAnnouncement extends StatelessWidget {
  const TabFurnitureAnnouncement({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FurnitureCubit, FurnitureState>(
      builder: (context, state) {
        if (state.state.isInProgress) {
          return const SliverToBoxAdapter(child: LoadingWidget());
        } else if (state.state.isSuccess) {
          if (state.data.isEmpty) {
            return SliverToBoxAdapter(
              child: EmptyWidget(text: t.announcements.emptyAnnouncements),
            );
          }
          return SliverList.builder(
            itemBuilder: (context, index) {
              return _Item(
                item: state.data[index],
              );
            },
            itemCount: state.data.length,
          );
        } else {
          return SliverToBoxAdapter(
            child: ErrWidget(
              error: state.errorMessage,
              retry: () async => context.read<FurnitureCubit>().getData(),
            ),
          );
        }
      },
      listener: (context, state) {},
    );
  }
}

class _Item extends StatelessWidget {
  final ERadautiWebsiteRecordsModel item;
  const _Item({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: GoogleFonts.inter(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1F2937),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: Text(
                  t.announcements.posted_at(value: item.dateCreated.format()),
                  style: GoogleFonts.inter(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  item.rawContent,
                  style: GoogleFonts.inter(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF6B7280),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: GestureDetector(
                  onTap: () async {
                    String link =
                        'https://www.eradauti.ro/anunturi/imobiliare-19/${item.slug}-${item.id}';
                    if (await canLaunchUrlString(link)) {
                      await launchUrlString(link);
                    }
                  },
                  child: Text(
                    t.announcements.seeDetails,
                    style: GoogleFonts.inter(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF458AFC),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
