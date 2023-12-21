import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('What is YourHouseTV', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'YourHouseTV is a streaming TV channel dedicated to anything real estate in each municipality we operate in. YourHouseTV is also part of the ABAGALE Network which broadcasts YourHouseTV on Roku. With access to over 70 million viewers nationally and locally, YourHouseTV is building a platform for listings, realtors, developers, real estate services and vendors',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
                Text('Is the APP free? Station Free to Watch?', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'The Real Estate Channel is on Roku under the Abagale Network and is a free streaming service. YHTVnow.com is a free, downloadable app that provides streaming media, videos, etc. and is, Free to watch and share!',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text('As an advertiser, can I set my own times to run my video', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'Depending on the marketing plan selected, you may have the option to target time slots and time blocks depending on availability.',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text('As an advertiser, can I change my plan?', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'All plans are month to month and change anytime with availability and approval!',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
