import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class HomeScreen extends StatelessWidget {
  final List<String> items = [
    'https://marianneg.alwaysdata.net/flutter/img/members/hongjoong.png',
    'https://marianneg.alwaysdata.net/flutter/img/members/seonghwa.png',
    'https://marianneg.alwaysdata.net/flutter/img/members/yuhno.png',
    'https://marianneg.alwaysdata.net/flutter/img/members/yeosang.png',
    'https://marianneg.alwaysdata.net/flutter/img/members/san.png',
    'https://marianneg.alwaysdata.net/flutter/img/members/mingi.png',
    'https://marianneg.alwaysdata.net/flutter/img/members/wooyoung.png',
    'https://marianneg.alwaysdata.net/flutter/img/members/jongho.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          //style: heading,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Image.network(
                  "https://marianneg.alwaysdata.net/flutter/img/logo.png",
                ),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(20),
              child: Text(
                'Ateez is the name of a k-pop band, which was established in South Korea in 2019, and consists of eight male members. \n\n The boy band has released albums in both Korean and Japanese, and has a large fan base worldwide.\n\n The popularity of ATEEZ has earned them the title of Global Ambassadors of Korean Culture.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = items[index];
                  return Card(
                    child: Center(
                      child: Image.network(item,),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding:  EdgeInsets.all(20),
              child: Text(
                "ATINY is ATEEZ`s official fandom name. \n \n ATINY is a contraction of 'ATEEZ and destiny' and signifies that ATEEZ's future is together with their fans.",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
