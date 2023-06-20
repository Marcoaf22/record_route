import 'package:record_route/core/values/languages/from/en_US/en_us_translations.dart';
import 'package:record_route/core/values/languages/from/pt_BR/pt_br_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'pt_BR': ptBR,
    'en_US': enUS,
  };
}
