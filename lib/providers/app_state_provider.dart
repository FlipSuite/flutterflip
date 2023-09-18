// import 'dart:convert';
// import 'dart:io';
import 'package:riverpod/riverpod.dart';

final appStateProvider = NotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);


class AppState {
  AppState({this.count = 0, this.screen = 'counter', this.jsonData});

  final int count;
  final String screen;
  final Map? jsonData;
}

enum DemoScreen { counter, textField, custom }

extension AppStateScreen on AppState {
  DemoScreen get currentScreen => DemoScreen.values.firstWhere((e) => e.toString() == 'DemoScreen.$screen');
}

class AppStateNotifier extends Notifier<AppState> {

  // AppStateNotifier() {
  //   loadJson('../../assets/widgets.json');
  // }

  @override
  AppState build() {
    return AppState(count: 0, screen: DemoScreen.counter.toString().split('.').last);
  }

  void increment() {
    state = AppState(count: state.count + 1, screen: state.screen, jsonData: state.jsonData);
  }

  void changeDemoScreenTo(DemoScreen screen) {
    state = AppState(count: state.count, screen: screen.toString().split('.').last, jsonData: state.jsonData);
  }

  Future<void> loadJson(String filePath) async {
    // final file = File(filePath);
    // if (await file.exists()) {
    //   final fileContents = await file.readAsString();
    //   final Map<String, dynamic> jsonData = jsonDecode(fileContents);
    //   state = AppState(count: state.count, screen: state.screen, jsonData: jsonData);
    // }
    state = AppState(count: state.count, screen: state.screen, jsonData: {});
  }
}
