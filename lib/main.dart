import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_home/home.dart';
import 'package:intl/intl.dart';
import 'package:smart_home/store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
   await initializeService();
  runApp(const MyApp());
}

const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
const notificationId = 888;

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    notificationChannelId, // id
    'MY FOREGROUND SERVICE', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
      
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      // this will be executed when app is in foreground or background in separated isolate
      onStart: onStart,
      // auto start service
      autoStart: false,
      isForegroundMode: true,
      notificationChannelId: notificationChannelId,
      initialNotificationTitle: 'AWESOME SERVICE',
      initialNotificationContent: 'Initializing',
      foregroundServiceNotificationId: notificationId,
    ), iosConfiguration: IosConfiguration(
      // this will be executed when app is in foreground in separated isolate
      onForeground: onStart,
    ),
  );

  // service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  await Firebase.initializeApp();
  DartPluginRegistrant.ensureInitialized();
  DatabaseReference scheduleRef = FirebaseDatabase.instance.ref("scheduleList");
    DatabaseReference button2Ref = FirebaseDatabase.instance.ref("button2");

  service.on('stopService').listen((event) {
    service.stopSelf();
  });


  const bool switchOn=true;
  List schedules = [];

   
    print("schedules=-- : $schedules");  

  // bring to foreground
  Timer.periodic(const Duration(seconds: 60), (timer) async {
    /// you can see this log in logcat
    /// 
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    print('FLUTTER BACKGROUND SERVICE: ${formattedDate}');

     print('Time is : ${DateFormat('kk:mm').format(now)}');

      Iterable dataList = schedules.where((element) => element.time == DateFormat('kk:mm').format(now));

      print("schedules=--444 : $schedules");
      print("dataList : $dataList");

    
    if(dataList.isNotEmpty){
      print("switch value : ${dataList.first['switchOn']}");
      button2Ref.set(dataList.first['switchOn']? 1 : 0);
    }
    

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
      },
    );
  });
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
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
  
  DatabaseReference button1Ref = FirebaseDatabase.instance.ref("button1");
  DatabaseReference button2Ref = FirebaseDatabase.instance.ref("button2");

  late int button1On=0;
  late int button2On=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
  final button1 = await button1Ref.get();
  final button2 = await button2Ref.get();

  setState(() {
    button1On=button1.value==0?0:1;
    button2On=button2.value==0?0:1;
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                  onPressed: () async {
                    final button1 = await button1Ref.get();
                    print("button 1 value : ${button1.value}");
                    button1Ref.set(button1.value==0?1:0);
                    setState(() {
                        button1On=button1.value==0?1:0;
                      
                    });

                  },
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child:  Text(
                      'Button 1 ${button1On ==0?"Off":"On"}',
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async { 
                     final button2 = await button2Ref.get();
                    print("button 1 value : ${button2.value}");
                    button2Ref.set(button2.value==0?1:0);
                    setState(() {
                        button2On=button2.value==0?1:0;
                      
                    });
                    },
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child:  Text(
                      'Button 2 ${button2On ==0?"Off":"On"}',
                      style: TextStyle(color: Colors.white, fontSize: 13.0),
                    ),
                  ),
                ),
          ],
        ),
      ),
     
    );
  }
}
