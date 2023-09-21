import 'dart:html';

import 'package:flutterflip/components/app.dart';
import 'package:jaspr/browser.dart' hide Element;

/// The web entrypoint for the jaspr app.
void main() {
  runApp(App());

  bool isDragging = false;
  bool isResizing = false;
  String resizeDirection = '';
  num offsetX = 0, offsetY = 0;

 Element? flutterTarget = document.querySelector('#flutter_canvas');

  flutterTarget?.onMouseDown.listen((MouseEvent e) {
    if (e.target is! Element ||
        !(e.target as Element).classes.contains('resize-handle')) {
      isDragging = true;
      offsetX = e.client.x - (flutterTarget.getBoundingClientRect().left ?? 0);
      offsetY = e.client.y - (flutterTarget.getBoundingClientRect().top ?? 0);
    } else {
      isResizing = true;
      resizeDirection = (e.target as Element).id;
    }
  });

  document.onMouseMove.listen((MouseEvent e) {
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

  document.onMouseUp.listen((MouseEvent e) {
    isDragging = false;
    isResizing = false;
  });

  flutterTarget?.onDragStart.listen((Event e) {
    e.preventDefault(); // prevent default drag behavior
  });
}
