import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<PageData> data = pageList;
  PageController pages = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: pageList.length,
                controller: pages,
                itemBuilder: (context, index) {
                  PageData curIndex = pageList[index];
                  return Column(
                    children: [
                      const Text('Skip'),
                      Image.network(curIndex.image),
                      Text(
                        curIndex.text,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      Text(curIndex.subtext),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            pageList.length,
                            (index) => AnimatedContainer(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff6C63FF),
                                ),
                                height: 10,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                width: index == currentIndex ? 50 : 10,
                                duration: const Duration(seconds: 1))),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                pages.animateToPage(currentIndex - 1,
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeIn);
                              },
                              child: const Text('Next')),
                          ElevatedButton(
                              onPressed: () {
                                pages.animateToPage(currentIndex + 1,
                                    duration: const Duration(microseconds: 1),
                                    curve: Curves.easeIn);
                              },
                              child: const Text('Next'))
                        ],
                      )
                    ],
                  );
                }),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class PageData {
  final String image;
  final String text;
  final String subtext;

  PageData({
    required this.image,
    required this.text,
    required this.subtext,
  });
}

List<PageData> pageList = [
  PageData(
      image:
          'https://res.cloudinary.com/dxje0rp9f/image/upload/v1681724277/delivery_ozs5jr.png',
      text: 'Quality Food',
      subtext:
          'Savings on meals and free delivery fees from great local and national resturants, updated for you each week.'),
  PageData(
      image:
          'https://res.cloudinary.com/dxje0rp9f/image/upload/v1681724277/undraw_Drone_delivery_re_in95_bjr1my.png',
      text: 'Fast Delivery',
      subtext:
          'Savings on meals and free delivery fees from great local and national resturants, updated for you each week.'),
  PageData(
      image:
          'https://res.cloudinary.com/dxje0rp9f/image/upload/v1681724277/undraw_Gift_re_qr17_bmombi.png',
      text: 'Reward Surprises',
      subtext:
          'Savings on meals and free delivery fees from great local and national resturants, updated for you each week.')
];
