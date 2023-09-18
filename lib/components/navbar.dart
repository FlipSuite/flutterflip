import 'package:jaspr/html.dart';

class Navbar extends StatelessComponent {
  const Navbar({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav(classes: [
      'bg-zinc-900',
      'absolute',
      'w-full',
      'top-0',
      'h-[38px]',
      'flex',
      'justify-between',
      'items-center',
      'px-3'
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
            'text-white',
            'text-[10px]',
            'font-bold'
          ], [
            text('FlutterFlip'),
            span(classes: [
              'ml-1',
              'inline-block',
              'text-gray-400',
              'text-[6px]',
            ], [
              text('v0.1')
            ]),
          ]),
          span(classes: [
            'text-gray-400',
            'text-[6px]',
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
          'text-white',
          'text-[6px]',
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
                'text-[8px]',
                'w-6',
                'text-white',
                'focus:outline-none',
                'focus:ring-0',
                'focus:border-transparent',
              ],
              [],
              value: '600'),
          span(classes: [
            'text-gray-400',
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
                'text-[8px]',
                'w-6',
                'text-white',
                'focus:outline-none',
                'focus:ring-0',
                'focus:border-transparent',
              ],
              [],
              value: '800'),
        ]),
      ]),

      div(classes: ['w-40'], [])
    ]);
  }
}
