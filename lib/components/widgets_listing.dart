import 'package:jaspr/html.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import '../providers/app_state_provider.dart'; // Import your provider if it's not in the same file

class WidgetsListing extends StatelessComponent {
  const WidgetsListing({Key? key}) : super(key: key);

  @override
  Iterable<Component> build(BuildContext context) sync* {
    generateWidgetCard(String widgetName) {
      return div(
        classes: [
          'rounded',
          'bg-green-700',
          'flex',
          'justify-center',
          'items-center',
          'flex-col',
          'w-[60px]',
          'h-[60px]',
          'cursor-pointer'
        ],
        [
          img(src: '/icons/widgets/${widgetName.toLowerCase()}.svg', classes: [
            'h-[35px]',
            'mb-1'
          ]),
          span(classes: [
            'text-[9px]',
            'font-bold',
            'text-white',
          ], [
            text(widgetName)
          ]),
        ],
        events: {
          'click': (_) {
            context
                .read(appStateProvider.notifier)
                .updateJsonData(widgetsJSON[widgetName]!);
          },
        },
      );
    }

    yield h3([text('Available Widgets')]);
    yield div(
      classes: ['inline-flex', 'flex-wrap'],
      [
        div(
          classes: ['grid', 'grid-cols-3', 'gap-[10px]'],
          [
            generateWidgetCard('Container'),
            generateWidgetCard('Column'),
            generateWidgetCard('Row'),
            generateWidgetCard('Text'),
            generateWidgetCard('Image'),
            generateWidgetCard('Button'),
          ],
        ),
      ],
    );
  }
}

Map<String, String> widgetsJSON = {
  'Container': '''
    {
        "type":"Card",
        "color":"fff44336",
        "shadowColor":"ff2196f3",
        "elevation":10.0,
        "borderOnForeground":true,
        "margin":"10.0,10.0,10.0,10.0,",
        "semanticContainer":true,
        "child":{
            "type":"Container",
            "alignment":null,
            "padding":null,
            "color":null,
            "margin":null,
            "constraints":{
                "minWidth":200.0,
                "maxWidth":200.0,
                "minHeight":100.0,
                "maxHeight":100.0
            },
            "child":null
        },
        "shape":{
            "side":{
                "color":"ff2196f3",
                "width":2.0,
                "style":1
            },
            "borderRadius":"10.0:10.0,10.0:10.0,10.0:10.0,10.0:10.0"
        }
    }
  ''',
  'Row': '''{}''',
  'Column': '''{}''',
  'Text': '''{}''',
  'Image': '''{}''',
  'Button': '''{}'''
};
