import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:thesection/src/data/data_providers/settings_data_provider.dart';

import 'firebase_options.dart';
import 'src/app.dart';
import 'src/presentation/pages/settings/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<FirebaseApp> _initialize = Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();
  // final storage = await HydratedStorage.build(
  //  storageDirectory: HydratedStorage.webStorageDirectory,
  //);

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(FutureBuilder(
    future: _initialize,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return const SizedBox(
            child: Center(
          child: Text(
            'ooops, sumn went wrong',
            textDirection: TextDirection.ltr,
          ),
        ));
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return MyApp(settingsController: settingsController);
      }
      return Container(
        color: Colors.black,
        width: double.infinity,
        height: double.infinity,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    },
  ));
}
