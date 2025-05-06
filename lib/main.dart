import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'feature/app/widget/app.dart';
import 'common/config/flavors.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
  );

  runApp(const App());
}
