import 'package:flutterflip/components/navbar.dart';
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
            h3([text('Available Widgets')]),
            div(classes: [
              'inline-flex',
              'flex-wrap'
            ], [
              div(
                classes: ['grid', 'grid-cols-3', 'gap-[10px]'],
                [
                  _widgetCard('Text'),
                  _widgetCard('Image'),
                  _widgetCard('Button'),
                  _widgetCard('TextField'),
                  _widgetCard('Checkbox'),
                  _widgetCard('Radio'),
                  _widgetCard('Slider'),
                  _widgetCard('Switch'),
                ],
              ),
            ])
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

  Component _widgetCard(String name) {
    return div(
      classes: ['rounded', 'p-4', 'bg-white', 'w-[60px]', 'h-[60px]'],
      [
        span([text(name)])
      ],
    );
  }
}
