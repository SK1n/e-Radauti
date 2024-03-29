import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/utils/app_constants.dart';
import 'page_decisions.dart';
import 'page_local_council_team.dart';
import '../../../gen/strings.g.dart';

class TabLocalCouncil extends StatelessWidget {
  const TabLocalCouncil({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: AppConstants.innerCardPadding,
            child: Card(
              child: ListTile(
                leading: Image.asset(
                    'assets/local_administration/local_council_team.png'),
                title: Text(context.t.localAdministration.localCouncilTeam),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () =>
                    Navigator.of(context).push(PageLocalCouncilTeam.route()),
              ),
            ),
          ),
          Padding(
            padding: AppConstants.innerCardPadding,
            child: Card(
              child: ListTile(
                leading: Image.asset(
                    'assets/local_administration/local_council_decisions.png'),
                title:
                    Text(context.t.localAdministration.localCouncilDecisions),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.of(context).push(PageDecisions.route()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
