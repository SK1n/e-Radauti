import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutterapperadauti/utils/shared_widgets/futuristic.dart';
import 'package:flutterapperadauti/utils/helpers/get_image_url.dart';
import 'package:flutterapperadauti/utils/helpers/launch_url_helper.dart';
import 'package:flutterapperadauti/utils/shared_widgets/image_widget.dart';
import 'package:get/get.dart';

class LocalCouncilCard extends StatelessWidget with GetImageUrl, UrlLauncher {
  final String? url;
  final String? name;
  final String? function;
  final String? party;
  final String? phoneNumber;
  final String? email;
  const LocalCouncilCard({
    super.key,
    this.url,
    this.name,
    this.function,
    this.party,
    this.phoneNumber,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Futuristic(
              futureBuilder: () => getImageUrl(url!),
              dataBuilder: (_, snap) => ImageWidget(
                    link: snap.data,
                    width: 100,
                    height: 150,
                  )),
          Positioned(
            left: 110,
            child: SizedBox(
              width: Get.width - 170,
              height: 50,
              child: AutoSizeText(
                name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 42,
            child: SizedBox(
              width: Get.width - 110,
              height: 20,
              child: AutoSizeText(
                function!.toLowerCase().replaceAll(" ", "-").tr,
              ),
            ),
          ),
          Positioned(
            left: 110,
            top: 60,
            child: phoneNumber != null
                ? SizedBox(
                    height: 20,
                    child: InkWell(
                      onTap: () {
                        //  launchUrl('tel:$phoneNumber');
                        launchUrl('tel:$phoneNumber');
                      },
                      child: Text(
                        '${"tel".tr}: $phoneNumber',
                        style: const TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  )
                : Container(),
          ),
          Positioned(
            left: 110,
            top: phoneNumber != null ? 80 : 60,
            child: InkWell(
              onTap: () {
                launchUrl('mailto:$email');
              },
              child: SizedBox(
                width: Get.width - 110,
                child: AutoSizeText(
                  '${"email".tr}: $email',
                  style: const TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: Image.asset(
              'assets/images/$party.png',
              width: 40,
              height: 40,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
// Card(
//       elevation: 5,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Futuristic(
//                 futureBuilder: () => getImageUrl(url!),
//                 useQuery: false,
//                 dataBuilder: (_, snap) => ImageWidget(
//                       link: snap.data,
//                       width: 100,
//                       height: 100,
//                     )),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   '$name',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blueGrey,
//                   ),
//                 ),
//                 Text(
//                   '$function',
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 phoneNumber != null
//                     ? InkWell(
//                         onTap: () {
//                           launchUrl('tel:$phoneNumber');
//                         },
//                         child: Row(
//                           children: [
//                             Icon(
//                               Entypo.phone,
//                               color: Colors.blueAccent,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 8.0),
//                               child: Text(
//                                 '$phoneNumber',
//                                 style: TextStyle(color: Colors.blueAccent),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : Container(),
//                 InkWell(
//                   onTap: () {
//                     launchUrl('mailto:$email');
//                   },
//                   child: Row(
//                     children: [
//                       Icon(
//                         Entypo.mail,
//                         color: Colors.blueAccent,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 10.0),
//                         child: Text(
//                           '$email',
//                           style: TextStyle(color: Colors.blueAccent),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),

//         ],
//       ),
//     );
