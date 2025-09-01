import 'package:flutter/material.dart';
import 'package:ticket_widget_plus/ticket.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Ticket(
            //   cardPosition: CardPosition.horizontal,
            //   backgroundColor: Colors.white,
            //   smallClipRadius: 1,
            //   numberOfSmallClips: 40,
            //   circlePosition: 0.2,
            //   child: Column(
            //     children: [
            //       const SizedBox(height: 20),
            //       Padding(
            //         padding: const EdgeInsets.symmetric(horizontal: 10),
            //         child: Row(
            //           children: [
            //             Image.asset(
            //               'image/ic_logo.png',
            //               height: 40,
            //               width: 40,
            //             ),
            //             const SizedBox(width: 10),
            //             const Text(
            //               "Vietnam Airlines",
            //               style: TextStyle(fontSize: 18),
            //             ),
            //             const Spacer(),
            //             const Text(
            //               '\$1880',
            //               style: TextStyle(
            //                 fontSize: 22,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             )
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 30,
            //       ),
            //       Expanded(
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 30),
            //           child: GridView(
            //             gridDelegate:
            //                 const SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 2,
            //               childAspectRatio: 1.5,
            //               crossAxisSpacing: 50,
            //             ),
            //             children: [
            //               _content('Passengers', 'David Hoang'),
            //               _content('Flight', '22213383'),
            //               _content('Date', '10-05-2025'),
            //               _content('Gate', '2A'),
            //               _content('Seat', '3C'),
            //               _content('Class', 'Business'),
            //             ],
            //           ),
            //         ),
            //       ),
            //       const SizedBox(height: 10),
            //       Image.asset(
            //         'image/barcode.jpeg',
            //       ),
            //       const SizedBox(height: 10),
            //     ],
            //   ),
            // ),
            Ticket(
              cardPosition: CardPosition.vertical,
              backgroundColor: Colors.white,
              smallClipRadius: 1,
              numberOfSmallClips: 40,
              circlePosition: 0.23,
              ticketHeight: 300,
              ticketWidth: MediaQuery.of(context).size.width - 20,
              child: Row(
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NYC \nNew-York',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Icon(Icons.airplane_ticket),
                      ),
                      Text(
                        'LND \nLondon',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 20,
                        ),
                        children: [
                          _content('Passengers', 'David Hoang'),
                          _content('Flight', '22213383'),
                          _content('Date', '10-05-2025'),
                          _content('Gate', '2A'),
                          _content('Seat', '3C'),
                          _content('Class', 'Business'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(String title, String content) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.grey, fontSize: 16),
        ),
        Text(
          content,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ],
    );
  }
}
