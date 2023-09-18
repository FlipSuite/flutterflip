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
          'pt-[38px]',
          'flex',
          'justify-between',
          'align-center',
          'h-screen',
          'overflow-hidden',
          'bg-neutral-800'
        ], [
          div(classes: [
            'bg-zinc-800',
            'p-4'
          ], [
            WidgetsListing(),
          ]),
          div(id: 'flutter_container', classes: [
            'flex',
            'align-center',
          ], [
            // The Flutter app container
            FlutterAppContainer(),
          ]),
          div(classes: [
            'bg-zinc-800',
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
