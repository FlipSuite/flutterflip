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
          'pt-[45px]',
          'flex',
          'justify-between',
          'align-center',
          'h-screen',
          'overflow-hidden',
          // middle
          'bg-stone-950	'
        ], [
          div(classes: [
            //left
            'bg-stone-800',
            'p-4'
          ], [
            WidgetsListing(),
          ]),
          div(id: 'flutter_container', classes: [
            'flex',
            'align-center',
          ], [
            div([
            FlutterAppContainer(),
            div([], classes: ['resize-handle'], id: 'right-handle'),
            div([], classes: ['resize-handle'], id: 'bottom-handle'),
            ], id: 'flutter_canvas')
            // The Flutter app container
          ]),
          div(classes: [
            //right
            'bg-stone-800',
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
