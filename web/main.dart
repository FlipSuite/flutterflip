import 'dart:html';

import 'package:flutterflip/components/app.dart';
import 'package:jaspr/browser.dart';

/// The web entrypoint for the jaspr app.
void main() {
  runApp(App());

  bool isDragging = false;
  bool isResizing = false;
  String resizeDirection = '';
  num offsetX = 0, offsetY = 0;

  var flutterTarget = document.querySelector('#flutter_canvas');
  print(flutterTarget);

  print(MouseEvent);

  flutterTarget?.onMouseDown.listen((e) {
    isDragging = true;
    offsetX = e.client.x - (flutterTarget.getBoundingClientRect().left ?? 0);
    offsetY = e.client.y - (flutterTarget.getBoundingClientRect().top ?? 0);
  });

  document.onMouseMove.listen((e) {
    if (isDragging) {
      num x = e.client.x - offsetX;
      num y = e.client.y - offsetY;

      flutterTarget?.style.left = '${x}px';
      flutterTarget?.style.top = '${y}px';
    } else if (isResizing) {
      var rect = flutterTarget?.getBoundingClientRect();
      switch (resizeDirection) {
        case 'left-handle':
          flutterTarget?.style.width = '${(rect?.right ?? 0) - e.client.x}px';
          break;
        case 'right-handle':
          flutterTarget?.style.width = '${e.client.x - (rect?.left ?? 0)}px';
          break;
        case 'top-handle':
          flutterTarget?.style.height = '${(rect?.bottom ?? 0) - e.client.y}px';
          break;
        case 'bottom-handle':
          flutterTarget?.style.height = '${e.client.y - (rect?.top ?? 0)}px';
          break;
      }
    }
  });

  document.onMouseUp.listen((e) {
    isDragging = false;
    isResizing = false;
  });

  flutterTarget?.onDragStart.listen((e) {
    e.preventDefault(); // prevent default drag behavior
  });
}
