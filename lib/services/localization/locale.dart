import "package:apexo/features/settings/settings_stores.dart";
import "package:apexo/services/localization/ar.dart";
import "package:apexo/services/localization/en.dart";
import "package:apexo/services/localization/es.dart";
import "package:apexo/services/localization/zh.dart";
import "package:fluent_ui/fluent_ui.dart";

class _Localization {
  List<En> list = [En(), Ar(), Es(), Zh()];
  En get s => list[localSettings.selectedLocale];
}

final locale = _Localization();

String txt(String input) {
  // exact match first, then the lower-cased key (labels such as "Age" or "Weeks" are capitalized in code)
  final term = locale.s.dictionary[input] ?? locale.s.dictionary[input.toLowerCase()];
  if (term != null) {
    return term;
  }
  return input;
}

class Txt extends Text {
  const Txt(
    super.data, {
    super.key,
    super.style,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
    super.selectionColor,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: localSettings.stream,
        builder: (context, snapshot) {
          return Text(
            data ?? "",
            key: key,
            style: style,
            locale: this.locale,
            textScaler: textScaler,
            semanticsLabel: semanticsLabel,
            textAlign: textAlign,
            textDirection: textDirection,
            softWrap: softWrap,
            overflow: overflow,
            maxLines: maxLines,
            strutStyle: strutStyle,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: selectionColor,
          );
        });
  }
}
