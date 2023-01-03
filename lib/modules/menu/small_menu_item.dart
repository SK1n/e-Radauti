import 'package:flutter/material.dart';

class SmallMenuItem extends StatelessWidget {
  final String image;
  final String title;
  final Function() onTap;
  const SmallMenuItem({
    super.key,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  width: 40.0,
                  height: 40.0,
                  margin: const EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 3),
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(title),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
