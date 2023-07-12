import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/usefull_numbers/public/public_model.dart';
import '../cubit/authorities/authorities_cubit.dart';
import '../cubit/public/public_cubit.dart';
import '../../../utils/page_state.dart';
import '../../../../gen/strings.g.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../../utils/widgets/empty_widget.dart';
import '../../../utils/widgets/err_widget.dart';

import 'package:url_launcher/url_launcher_string.dart';

class TabPublic extends StatelessWidget {
  const TabPublic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PublicCubit, PublicState>(
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
  final PublicItemModel data;
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
              style: TextStyle(
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
    case "Protectia Consumatorului":
      return t.usefullNumbers.consumerProtection;
    case "Protectia Copilului":
      return t.usefullNumbers.childProtection;
    case "Poliția Animalelor":
      return t.usefullNumbers.animalProtection;
    case "Protectia Mediului":
      return t.usefullNumbers.environmentProtection;
    case "Garda de Mediu Suceava":
      return t.usefullNumbers.suceavaEnvironmentalGuard;
    default:
      return title;
  }
}
