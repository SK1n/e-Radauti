import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/usefull_numbers/upsets/upsets_model.dart';
import '../cubit/authorities/authorities_cubit.dart';
import '../cubit/upsets/upsets_cubit.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import '../../../utils/widgets/err_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TabUpsets extends StatelessWidget {
  const TabUpsets({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpsetsCubit, UpsetsState>(
      builder: (context, state) {
        if (state.state.isInProgress) {
          return const SliverToBoxAdapter(child: LoadingWidget());
        } else if (state.state.isFalure) {
          return SliverToBoxAdapter(
            child: ErrWidget(
              error: state.errorMessage,
              retry: () async => context.read<AuthoritiesCubit>().getData(),
            ),
          );
        } else {
          if (state.data.isEmpty) {
            return SliverToBoxAdapter(
              child: EmptyWidget(
                text: t.usefullNumbers.empty,
              ),
            );
          }
          return SliverList.builder(
            itemBuilder: (context, index) {
              return _Item(
                data: state.data[index],
              );
            },
            itemCount: state.data.length,
          );
        }
      },
      listener: (context, state) {},
    );
  }
}

class _Item extends StatelessWidget {
  final UpsetsItemModel data;
  const _Item({required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _getTranslation(data.title),
              style: GoogleFonts.inter(
                fontSize: 16.0,
              ),
            ),
          ),
          for (String phone in data.phones) ...{
            Card(
              child: ListTile(
                leading: const Icon(Icons.phone),
                title: Text(phone),
                onTap: () => launchUrlString('tel:$phone'),
              ),
            ),
          },
          for (String email in data.emails) ...{
            Card(
              child: ListTile(
                leading: const Icon(Icons.email),
                title: Text(email),
                onTap: () => launchUrlString('mailto:$email'),
              ),
            ),
          }
        ],
      ),
    );
  }
}

String _getTranslation(String title) {
  switch (title) {
    case "Servicii Comunale":
      return t.usefullNumbers.comunalServices;
    case "ACET":
      return t.usefullNumbers.acet;
    default:
      return title;
  }
}
