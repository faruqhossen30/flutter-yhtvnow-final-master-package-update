import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yhtvnow/const/color.dart';
import 'package:yhtvnow/view/page/cookie_policy_page.dart';
import 'package:yhtvnow/view/page/faq_page.dart';
import 'package:yhtvnow/view/page/privacy_policy_page.dart';
import 'package:yhtvnow/view/page/terms_and_condition_page.dart';
import 'package:yhtvnow/view/widget/logo.dart';
class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: blackColor,
      child: ListView(
        children: [
          Logo(),
          InkWell(
            onTap: () {
              Get.to(() => PrivacyPolicyPage());
            },
            child: ListTile(
                title: Text('Privacy Policy',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: Icon(
                  Icons.info_rounded,
                  color: yellowColor,
                )),
          ),
          InkWell(
            onTap: () {
              Get.to(() => CookiePolicyPage());
            },
            child: ListTile(
                title: Text('Cookie Policy',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: Icon(
                  Icons.cookie,
                  color: yellowColor,
                )),
          ),
          InkWell(
            onTap: () {
              Get.to(() => TermsAndConditionPage());
            },
            child: ListTile(
                title: Text('Terms & Condition',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: Icon(
                  Icons.cookie,
                  color: yellowColor,
                )),
          ),
          InkWell(
            onTap: () {
              Get.to(() => FaqPage());
            },
            child: ListTile(
                title: Text('FAQ',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: Icon(
                  Icons.question_mark_rounded,
                  color: yellowColor,
                )),
          ),
          InkWell(
            onTap: () async{
              launchUrl(Uri.parse('https://www.facebook.com/YourHouseStreamingTV'));
            },
            child: ListTile(
                title: Text('Facebook',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: FaIcon(
                  FontAwesomeIcons.facebook,
                  color: Color(0xff4267B2),
                )),
          ),
          InkWell(
            onTap: () {
              launchUrl(Uri.parse('https://twitter.com/advantageinsp'));
            },
            child: ListTile(
                title: Text('Twitter',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: FaIcon(
                  FontAwesomeIcons.twitter,
                  color: Colors.blue,
                )),
          ),
          InkWell(
            onTap: () {
              launchUrl(Uri.parse('https://www.instagram.com/advantagenc'));
            },
            child: ListTile(
                title: Text('Instagram',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: FaIcon(
                  FontAwesomeIcons.instagram,
                  color: Colors.red,
                )),
          ),
          InkWell(
            onTap: () {
              launchUrl(Uri.parse('https://www.linkedin.com/in/daveparknc'));
            },
            child: ListTile(
                title: Text('Linkedin',
                    style: Theme.of(context).textTheme.displaySmall),
                leading: FaIcon(
                  FontAwesomeIcons.linkedin,
                  color: Color(0xff0274B3),
                )),
          ),
        ],
      ),
    );
  }
}
