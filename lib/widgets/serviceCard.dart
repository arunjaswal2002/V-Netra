import 'package:flutter/material.dart';
import 'colors.dart' as color;

class ServiceCard extends StatelessWidget {
  // const ServiceCard({super.key});
  final String title;
  final Function onpressed;
  final Image myImage;
  ServiceCard(this.title, this.onpressed, this.myImage);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.AppColor.gradientFirst.withOpacity(0.8),
            color.AppColor.gradientSecond.withOpacity(0.9)
          ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(80)),
          boxShadow: [
            BoxShadow(
                offset: Offset(5, 10),
                blurRadius: 20,
                color: color.AppColor.gradientSecond.withOpacity(0.2))
          ]),
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 30,
                color: color.AppColor.homePageContainerTextSmall,
              ),
            ),
            const SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 90, height: 60, child: Image(image: myImage.image)),
                const SizedBox(
                  width: 150,
                ),
                IconButton(
                  onPressed: () => onpressed(),
                  icon: const Icon(
                      color: Colors.white, size: 60, Icons.play_circle_fill),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
