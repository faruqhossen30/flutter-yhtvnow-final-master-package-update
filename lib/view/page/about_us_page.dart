import 'package:flutter/material.dart';
import 'package:yhtvnow/view/widget/bottom_navigation.dart';
import 'package:yhtvnow/view/widget/drawer_widget.dart';

class AboutUsPage extends StatelessWidget {
  AboutUsPage({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ABOUT US', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'YourHouseTV is a video streaming platform that covers the USA and is visible around the world. We focus on all things real estate, city culture, local sports and food!! We empower clients by providing ease of service and affordable cost for video niche media marketing on networks such as Roku, Amazon, Smart TV’s along with android and iphones \n \n YourHouseTV puts data-backed recommendations at the heart of your marketing, so you can find and engage clients across TV, email, social media, landing pages, and advertising—automatically YourHouseTV is owned by Rogue Wolf, LLC and is part of the Advantage Companies.. ',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
                Text('THE ADVANTAGE COMPANIES', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'More than 3 decades ago, Dave Park moved his family to Raleigh NC to start a local building business with his father. Their focus was on family values built into every house. \n \n In the years that followed, the first of the 5 Advantage companies was started. Advantage Home Inspection. Next was RCMS (Property Management), YourHouse (Homeowner Journal), then POWRsoft (Home Inspection Software) and Rogue Wolf, LLC which runs YourHouseTV (video streaming).',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(
                  height: 10,
                ),
                Text('CULTURE', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'Adaptative, Respectful, Charitable, Accessible and Accountable.\nThe words above describe all that work with the Advantage Companies.. These words make us tick, they drive our passion, what is at our core, the heart of Advantage, the heart of us.Five little words describe each and everyone of our team. \n\nBecause we understand the importance of treating others with respect, and being honest, sincere and trustworthy.',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
                Text('WE BELIEVE IN RELATIONSHIPS, SERVICE AND HARD WORK', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'Integrity and honesty are to a relationship, any relationship, whether it be a business or a personal one. Tie that in with a sincere interest in understanding the needs of our clients, listening to their needs, and being ready to assist when necessary. Advantage people are service oriented and dedicated!',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
                Text('DRIVEN', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'Our values can be expressed in words, they are also virtues that we cannot teach in a class or train. They are part of what makes Advantage people special. These words are in our heart and in our work. These people are a part of our team, our family. Continuing to be committed to finding the right people at Advantage is one of the keys to leading the industry.\n\nIdentifying our values, what makes Advantage people tick lays the groundwork for who we are, where we are going, how far we will go. This is a very exciting time at Advantage Inspection and our people are part of the excitement.\n\nAt Advantage, all our people are dedicated to making the next 10 years at the Advantage Companies the best ever. We hope you will come along, join us as we are driven to help our clients, our family, our friends.',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14)),
                SizedBox(height: 10),
                Text('LOCAL CITIZENSHIP', style: Theme.of(context).textTheme.displayMedium),
                SizedBox(height: 10),
                Text(
                    'We believe in local business. We love MailChimps campaign slogan, “Give Where You Live”, and we focus our charitable energy locally. Small organizations that are embedded in their communities have a positive and lasting impact for their cause and the people they serve.\n\nToday, more than ever we are called on to help financially, spiritually and physically. That is why the people of Advantage and the Advantage companies invest locally, passionately and timely. We welcome you to join us on any activity, event and journey as we hope to help, heal and inspire.',
                    style: TextStyle(color: Colors.white70, fontWeight: FontWeight.normal, fontSize: 14))
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavicationWidget(),
      drawer: DrawerWidget(),
    );
  }
}
