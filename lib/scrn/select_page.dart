import 'package:esports_news/scrn/coming_soon.dart';
import 'package:esports_news/scrn/home_page.dart';
import 'package:esports_news/scrn/valorant_page.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  SelectPage({Key? key}) : super(key: key);

  List select = [
    'assets/nature.jpg',
    'assets/nature.jpg',
    'assets/nature.jpg',
    'assets/nature.jpg',
  ];

  List names = [
    'Apex Legends',
    'Valorant',
    'OW 2',
    'COD',
  ];

  List nextPage = [
    const HomePage(),
    const ValorantPage(),
    const ComingSoon(),
    const ComingSoon(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // Center(
          // child: Column(
          //   children: [
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: ((context) => const HomePage()),
          //           ),
          //         );
          //       },
          //       child: const Text('Apex Legends'),
          //     ),
          //     ElevatedButton(
          //       onPressed: () {
          //         Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: ((context) => const ValorantPage()),
          //           ),
          //         );
          //       },
          //       child: const Text('Valorant'),
          // ),
          GridView.builder(
        itemCount: select.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            footer: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.bottomCenter,
              child: Text(names[index]),
            ),
            child: InkWell(
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 200,
                width: 200,
                child: Ink.image(
                  image: AssetImage(select[index]),
                  fit: BoxFit.cover,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => nextPage[index],
                  ),
                );
              },
            ),
          );
        },
      ),
      //     ],
      //   ),
      // ),
    );
  }
}
