import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/great_places.dart';
import 'screens/add_place_screen.dart';
import 'screens/auth_screen.dart';
import 'screens/place_detail_screen.dart';
import 'screens/places_list_screen.dart';
import 'screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, appSnapshot) {
          return ChangeNotifierProvider.value(
              value: GreatPlaces(),
              child: MaterialApp(
                  title: 'FlutterChat',
                  theme: ThemeData(
                    primarySwatch: Colors.pink,
                    backgroundColor: Colors.pink,
                    accentColor: Colors.deepPurple,
                    accentColorBrightness: Brightness.dark,
                    buttonTheme: ButtonTheme.of(context).copyWith(
                      buttonColor: Colors.pink,
                      textTheme: ButtonTextTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  home: appSnapshot.connectionState != ConnectionState.done
                      ? SplashScreen()
                      : StreamBuilder(
                          stream: FirebaseAuth.instance.authStateChanges(),
                          builder: (ctx, userSnapshot) {
                            if (userSnapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SplashScreen();
                            }
                            if (userSnapshot.hasData) {
                              return PlacesListScreen();
                            }
                            return AuthScreen();
                          }),
                  routes: {
                    AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
                    PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
                  }));
        });
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'providers/great_places.dart';
// import 'screens/places_list_screen.dart';
// import 'screens/add_place_screen.dart';
// import 'screens/place_detail_screen.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider.value(
//       value: GreatPlaces(),
//       child: MaterialApp(
//           title: 'Great Places',
//           theme: ThemeData(
//             primarySwatch: Colors.indigo,
//             accentColor: Colors.amber,
//           ),
//           home: PlacesListScreen(),
//           routes: {
//             AddPlaceScreen.routeName: (ctx) => AddPlaceScreen(),
//             PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
//           }),
//     );
//   }
// }
