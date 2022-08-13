# fancy_cursor

[![pub package](https://img.shields.io/pub/v/fancy_cursor.svg)](https://pub.dartlang.org/packages/fancy_cursor)
[![License](https://img.shields.io/badge/licence-MIT-green.svg)](https://github.com/ZeshanGIT/fancy_cursor/blob/master/LICENSE)
[![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/ZeshanGIT/fancy_cursor.svg)](https://github.com/ZeshanGIT/fancy_cursor)

Simple yet super flexible custom cursor package.

![Demo](demo.gif)

## Usage

Wrap the entire app or a widget with the `FancyCursor()`

```dart
import 'package:flutter/material.dart';
import 'package:fancy_cursor/fancy_cursor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FancyCursor(
        child: MyHomePage(),
      ),
    );
  }
}
```

## Options

| Option            | Type     | Default                             |
| :---------------- | :------- | :---------------------------------- |
| child             | Widget   | ***required**                         |
| trail             | boolean  | `true`                              |
| color             | Color    | `Colors.black`                      |
| size              | double   | `8`                                 |
| delay             | Duration | `const Duration()` - 0ms            |
| curve             | Curve    | `Curves.elasticOut`                 |
| customCursor      | Widget   | `null`                              |
| trailColor        | Color    | `Colors.black.withOpacity(0.3)`     |
| trailSize         | double   | `16`                                |
| trailDelay        | Duration | `const Duration(milliseconds: 500)` |
| trailOpacity      | Curve    | `Curves.elasticOut`                 |
| trailCustomCursor | Widget   | `null`                              |

## Contributing

Contributions, Issues, and feature requests are welcome!
Feel free to check [issues page](https://github.com/ZeshanGIT/fancy_cursor/issues).

## Show your support

Give one ⭐️ if this project helped you!

<a href="https://www.buymeacoffee.com/seshanks" target="_blank">
  <img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174">
</a>

## License

Copyright © 2021 [Seshan K S](https://github.com/ZeshanGIT).<br />
This project is [MIT](https://github.com/ZeshanGIT/fancy_cursor/blob/master/LICENSE) licensed.


***

<p align="center"> Made with 💚, From Seshan. </p>
