import 'package:jaspr/html.dart';

class Navbar extends StatelessComponent {
  const Navbar({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield nav(classes: [
      'bg-black',
      'absolute',
      'w-full',
      'top-0',
      'h-[64px]',
      'flex',
      'justify-between',
      'px-7'
    ], [
      // Logo and primary nav
      div(classes: [
        'flex',
        'space-x-4'
      ], [
        // Primary Nav
        div(classes: [
          'flex',
          'items-center',
        ], [
          
          a(href: "#", classes: [
            'py-5',
            'px-3',
            'hover:text-zinc-300',
            'h-[5px]',
            'rounded',
            'flex',
            'items-center',
            'align-middle',
            'transition',
            'duration-300',
            'mr-10'
          ], [
            img(src: '../../web/assets/assets/logo.svg', classes: [
            'h-[35px]',
          ]),
          ]),
          a(href: "#", classes: [
            'py-5',
            'px-3',
            'hover:text-zinc-300',
            'h-[5px]',
            'rounded',
            'flex',
            'items-center',
            'align-middle',
            'transition',
            'duration-300'
          ], [
            text('Features')
          ]),
          a(href: "#", classes: [
            'py-5',
            'px-3',
            'hover:text-zinc-300',
            'h-[5px]',
            'rounded',
            'flex',
            'items-center',
            'align-middle',
            'transition',
            'duration-300'
          ], [
            text('Pricing')
          ]),
        ]),
      ]),

      // Secondary Nav
      div(classes: [
        'hidden',
        'md:flex',
        'items-center',
        'space-x-1'
      ], [
        a(href: "", classes: [
          'py-5',
          'px-3',
          'hover:text-zinc-300',
          'h-[5px]',
          'rounded',
          'flex',
          'items-center',
          'align-middle',
          'transition',
          'duration-300'
        ], [
          text('Login')
        ]),
        a(href: "", classes: [
          'py-2',
          'px-3',
          'bg-yellow-400',
          'hover:bg-yellow-300',
          'text-yellow-900',
          'hover:text-yellow-800',
          'rounded',
          'transition',
          'duration-300'
        ], [
          text('Signup')
        ]),
      ]),
    ]);
  }
}
