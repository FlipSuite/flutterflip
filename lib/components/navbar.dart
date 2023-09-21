@Import.onWeb('dart:html', show: [#document])
import 'navbar.imports.dart';

import 'package:jaspr/html.dart';

class Navbar extends StatelessComponent {
  const Navbar({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav(classes: [
      'bg-green-400	',
      'absolute',
      'w-full',
      'top-0',
      'h-[45px]',
      'flex',
      'justify-between',
      'items-center',
      'px-3',
      'drop-shadow'
    ], [
      // Logo and project names left zone
      div(classes: [
        'flex',
        'w-40'
      ], [
        a(href: "#", classes: [
          'hover:text-zinc-300',
          'rounded',
          'flex',
          'items-center',
          'align-middle',
          'transition',
          'duration-300',
          'mr-4'
        ], [
          img(src: '../../web/assets/assets/logo.svg', classes: [
            'h-[24px]',
          ]),
        ]),
        div(classes: [
          'flex',
          'flex-col'
        ], [
          span(classes: [
            'text-black',
            'text-[10px]',
            'font-bold'
          ], [
            text('FlutterFlip'),
            span(classes: [
              'ml-1',
              'inline-block',
              'text-black	',
              'text-[8px]',
            ], [
              text('v0.1')
            ]),
          ]),
          span(classes: [
            'text-black',
            'text-[9px]',
          ], [
            text('default project')
          ]),
        ])
      ]),

      // Screen resizing middle zone
      div(classes: [
        'flex',
        // 'py-1',
        // 'border',
        // 'rounded',
        // 'border-zinc-800',
        'px-2',
        'gap-3',
        'items-center'
      ], [
        img(src: '/icons/mobile.svg', classes: [
          'h-[24px]',
        ]),
        img(src: '/icons/tablet.svg', classes: [
          'h-[24px]',
        ]),
        img(src: '/icons/desktop.svg', classes: [
          'h-[24px]',
        ]),
        div(classes: [
          'text-green-900',
          'text-[8px]',
          'font-bold',
          'flex',
          'justify-between',
          'items-center',
        ], [
          input(
              type: InputType.text,
              classes: [
                'bg-transparent',
                'border-none',
                'text-center',
                'text-[10px]',
                'w-7',
                'text-green-900',
                'focus:outline-none',
                'focus:ring-0',
                'focus:border-transparent',
              ],
              [],
              events: {
                'input': (e) => document.querySelector('#flutter_canvas')?.style.width = e.target.value + 'px'
              },
              value: '700'),
          span(classes: [
            'text-black',
            'inline-block',
            'mx-1',
          ], [
            text('x'),
          ]),
          input(
              type: InputType.text,
              classes: [
                'bg-transparent',
                'border-none',
                'text-center',
                'text-[10px]',
                'w-7',
                'text-green-900',
                'focus:outline-none',
                'focus:ring-0',
                'focus:border-transparent',
              ],
              [],
              events: {
                'input': (e) => document.querySelector('#flutter_canvas')?.style.height = e.target.value + 'px'
              },
              value: '900'),
        ]),
      ]),

      div(classes: ['w-40'], [])
    ]);
  }
}
