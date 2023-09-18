import 'package:flutterflip/components/navbar.dart';
import 'package:flutterflip/components/widgets_listing.dart';
import 'package:jaspr/html.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';

import 'effects_controls.dart';
import 'flutter_app_container.dart'
    if (dart.library.html) 'flutter_app_container_web.dart';
import 'interop_controls.dart';

class App extends StatelessComponent {
  const App({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield ProviderScope(
      child: section([
        Navbar(),
        div(classes: [
          'mt-[64px]',
          'py-5',
          'flex',
          'justify-between'
        ], [
          div(classes: [
            'bg-neutral-500',
            'p-4'
          ], [
            WidgetsListing(),
          ]),
          div(classes: [], [
            // The Flutter app container
            FlutterAppContainer(),
          ]),
          div(classes: [
            'bg-stone-700',
            'flex',
            'items-center',
            'justify-center',
            'flex-col'
          ], [
            // The controls
            EffectsControls(),
            InteropControls(),
          ]),
        ])
      ]),
    );
  }
}
