import 'package:flutter/material.dart';

import '../generated/langs.dart';

extension Translation on BuildContext {
  AppLang get tr => AppLang.of(this) ?? AppLangEn();

  TextDirection get direction => WidgetsLocalizations.of(this).textDirection;
}
