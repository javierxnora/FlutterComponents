import 'package:flutter/material.dart';

//Routes
import '../alert_page.dart';
import '../avatar_page.dart';
import '../home_page.dart';
import '../card_page.dart';
import '../animated_container.dart';
import '../input_page.dart';
import '../slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
  };
}
