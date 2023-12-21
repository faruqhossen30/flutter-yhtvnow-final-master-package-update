import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yhtvnow/const/color.dart';
import 'package:yhtvnow/controller/auth_controller.dart';
import 'package:yhtvnow/util/get_location.dart';
import 'package:yhtvnow/view/page/browse_page.dart';
import 'package:yhtvnow/view/page/home_page.dart';
import 'package:yhtvnow/view/screen/home_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:overlay_support/overlay_support.dart';

// Import the generated file
// import 'firebase_options.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
    options: FirebaseOptions(
        apiKey: "AIzaSyCg4FRdgm3e5U89D0Ysl4lvmFF3NdzGlfg",
        appId: "1:123659231051:ios:d197cc092b69ec187292ce",
        messagingSenderId: "123659231051",
        projectId: "yhtv-12f5c"
    ),
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging _messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await _messaging.requestPermission(
    alert: true,
    badge: true,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showSimpleNotification(
        Text(message.notification!.title!),
        // leading: NotificationBadge(totalNotifications: _totalNotifications),
        subtitle: Text(message.notification!.body!),
        background: Colors.cyan.shade700,
        duration: Duration(seconds: 2),
      );
    });
    // TODO: handle the received notifications
  } else {
    print('User declined or has not accepted permission');
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  AuthController _authController = Get.put(AuthController());

  Future<void> checkAuth() async {
    await _authController.userInfo();
  }

  @override
  void initState() {
    // TODO: implement initState
    GetLocation().getLocation();
    checkAuth();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: ScreenUtilInit(
          designSize: Size(360, 690),
          builder: (context, child) {
            return GetMaterialApp(
              title: 'YH TV Now',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.blue,
                  primaryColor: Colors.white,
                  textTheme: const TextTheme(
                    titleSmall: TextStyle(color: Color(0xffEA6D2B),
                        fontWeight: FontWeight.normal,
                        fontSize: 10),
                    titleMedium: TextStyle(color: Color(0xffEA6D2B),
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    titleLarge: TextStyle(color: Color(0xffEA6D2B),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    displaySmall: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    displayMedium: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,),
                    displayLarge: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  iconTheme: IconThemeData(color: Colors.white),
                  scaffoldBackgroundColor: Color(0xff141414),
                  appBarTheme: AppBarTheme(
                      backgroundColor: Color(0xff141414)
                  ),
                  inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(color: yellowColor),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: yellowColor, width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: yellowColor, width: 1.0),
                      ),
                      prefixIconColor: yellowColor
                  )
              ),
              home: BrowsePage(),
            );
          })
    );
  }
}


