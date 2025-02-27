import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'imageanalysis.dart' as imageanalysis;
import 'medicaldocs.dart' as medicaldocs;
import 'medicalspeech.dart' as medicalspeech;
import 'askai.dart' as askai;
import 'hospitals.dart' as hospitals;
import 'causesofdeath.dart' as causesofdeath;
import 'analyticscancer.dart' as analytics;
import 'analyticsLineChart.dart' as analyticschart;
import 'webview.dart' as webview;
import 'constants.dart' as constants;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Oracle AI For Healthcare (Flutter and Spring Boot Version)',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
      //  home: MyHomePage(),
      home: LoginWidget(),
      ),
    );
  }
}







class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  String _password = '';  // State variable to hold password

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value;  // Update the state variable when password changes
                  });
                },
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ElevatedButton(
                onPressed: () {
                  if (_password == 'opensourceoracle') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MyHomePage()),
                    );
                  } else {
                    // Show an alert dialog or some other error indicator
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Incorrect password"),
                          actions: [
                            TextButton(
                              child: Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}




class MyAppState extends ChangeNotifier {
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = webview.BackEndWidget(
          url: 'https://sketchfab.com/models/42054970b1ae48e5866ffafea938a0cb/embed', title: '3d models'); 
        break;
      case 1: //image analysis - Oracle Vision AI
        page = imageanalysis.MyForm(); 
        break;
      case 2: //medical documents - Oracle Doc AI
        page = medicaldocs.MyForm(); 
        break;
      case 3: //medical transcripts - Whisper AI and digital assistant
        page = webview.BackEndWidget(key: UniqueKey(), 
        url: constants.Constants.backendEndpointAddress + '/medicaltranscripts.html', title: 'Medical Transcripts' );
        //medicalspeech.MyApp();
        break;
      case 4: //Ask AI - Cohere
        page = askai.AskAIFormWidget();
        break;
      case 5: //Hospitals - OpenStreetMaps
        page = hospitals.MapWidget();
        break;
      case 6: //Causes Of Death 
        page = causesofdeath.CauseOfDeathWidget();
        break;
      case 7: //Analytics - grafana or Apache superset
        page = analytics.AnalyticsCancerResearchWidget();
        // page = analytics.DynamicbarChart();
        break;
      case 8: //Analytics - grafana or Apache superset
        page = analyticschart.MyHomePage();
        // page = analytics.DynamicbarChart();
        break;
      case 9: //Administration - expense reports from the medical documents 
        // page = chart.MyHomePage();
        page = causesofdeath.CauseOfDeathWidget();
        break;
      case 10: //Architecture
        page = webview.BackEndWidget(key: UniqueKey(), 
        url: constants.Constants.backendEndpointAddress + '/OracleHealthAI-FlutterSpringBootStack.png', title: 'Architecture Flutter And Spring Boot' ); 
        break;
      case 11: //Architecture MERN
        page = webview.BackEndWidget(key: UniqueKey(), 
        url: constants.Constants.backendEndpointAddress + '/OracleHealthAI-MERNStack.png', title: 'Architecture MERN Stack (Oracle with MongoDB adapter, Express, React, NodeJS)' ); 
        break;
      case 12: //YouTube video
        page = webview.BackEndWidget(key: UniqueKey(), 
        url: 'https://www.youtube.com/embed/VjeoHU4I6SI', title: 'YouTube Walthrough Video' ); 
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
      // child: Flexible(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar on narrow screens.
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.camera),
                        label: 'Image Analysis',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.edit_document),
                        label: 'Medical Documents',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.transcribe),
                        label: 'Medical Transcripts',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.question_answer),
                        label: 'Ask AI',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.local_hospital),
                        label: 'Hospitals',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.query_stats),
                        label: 'Causes Of Death',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.analytics),
                        label: 'Analytics (Bar)',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.analytics),
                        label: 'Analytics (Graph)',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.admin_panel_settings),
                        label: 'Administration',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.architecture),
                        label: 'Architecture (Spring Boot)',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.architecture),
                        label: 'Architecture (MERN stack',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.video_call),
                        label: 'About (YouTube video)',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.camera),
                        label: Text('Image Analysis'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.edit_document),
                        label: Text('Medical Documents'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.transcribe),
                        label: Text('Medical Transcripts'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.question_answer),
                        label: Text('Ask AI'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.local_hospital),
                        label: Text('Hospitals'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.query_stats),
                        label: Text('Causes Of Death'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.analytics ),
                        label: Text('Analytics (Bar)'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.analytics ),
                        label: Text('Analytics (Graph)'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.admin_panel_settings),
                        label: Text('Administration'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.architecture),
                        label: Text('Architecture (Spring Boot)'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.architecture),
                        label: Text('Architecture (MERN stack)'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.video_call),
                        label: Text('About (YouTube video)'),
                      ),

                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}
