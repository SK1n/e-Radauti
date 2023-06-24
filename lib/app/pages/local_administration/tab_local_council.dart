import 'package:flutter/material.dart';
import 'package:flutterapperadauti/app/pages/local_administration/decisions_page.dart';
import 'package:flutterapperadauti/i18n/strings.g.dart';

class TabLocalCouncil extends StatelessWidget {
  const TabLocalCouncil({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.asset(
                    'assets/local_administration/local_council_team.png'),
                title: Text(context.t.localAdministration.localCouncilTeam),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Card(
          //     child: ListTile(
          //       leading: Image.asset(
          //           'assets/local_administration/local_council_live.png'),
          //       title: Text(context.t.localAdministration.localCouncilLive),
          //       trailing: const Icon(Icons.arrow_forward_ios),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Image.asset(
                    'assets/local_administration/local_council_decisions.png'),
                title:
                    Text(context.t.localAdministration.localCouncilDecisions),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.of(context).push(DecisionsPage.route()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
