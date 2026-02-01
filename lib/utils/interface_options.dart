import 'package:collection/collection.dart';
import 'package:lcs_new_age/engine/engine.dart';
import 'package:lcs_new_age/utils/game_options.dart';

String get interfacePgUp => gameOptions.interfacePgUp;
String get interfacePgDown {
  if (interfacePgUp == "[") {
    return "]";
  } else if (interfacePgUp == ";") {
    return ".";
  } else if (interfacePgUp == ",") {
    return ".";
  }
  return "PGDN";
}

String aOrAn(String word) {
  switch (word[0].toLowerCase()) {
    case 'a':
    case 'e':
    case 'i':
    case 'o':
    case 'u':
      return "an";
    default:
      return "a";
  }
}

bool isPageUp(int c) {
  return c == "[".codePoint || c == ";".codePoint || c == ",".codePoint;
}

bool isPageDown(int c) {
  return c == "]".codePoint || c == ".".codePoint;
}

String get previousPageStr {
  String str;
  if (interfacePgUp == "[") {
    str = "[";
  } else if (interfacePgUp == ";") {
    str = ";";
  } else if (interfacePgUp == ",") {
    str = ",";
  } else {
    str = "PGUP";
  }
  return "$str - Previous";
}

String get nextPageStr {
  String str;
  if (interfacePgUp == "[") {
    str = "]";
  } else if (interfacePgUp == ";" || interfacePgUp == ",") {
    str = ".";
  } else {
    str = "PGDN";
  }
  return "$str - Next";
}

String get pageStr {
  String str;
  if (interfacePgUp == "[") {
    str = "[]";
  } else if (interfacePgUp == ";") {
    str = ";.";
  } else if (interfacePgUp == ",") {
    str = ",.";
  } else {
    str = "PGUP/PGDN";
  }
  return "$str - View other Liberal pages";
}

String pageStrWithCurrentAndMax(int current, int max) {
  String str;
  if (interfacePgUp == "[") {
    str = "[]";
  } else if (interfacePgUp == ";") {
    str = ";.";
  } else if (interfacePgUp == ",") {
    str = ",.";
  } else {
    str = "PGUP/PGDN";
  }
  return "$str - View other Liberal pages ($current/$max)";
}

void addPageButtons({
  int? y,
  int? x,
  int? current,
  int? max,
  bool short = false,
}) {
  y ??= console.y;
  x ??= console.x;
  move(y, x);
  String pageUpStr;
  String pageDownStr;
  if (interfacePgUp == "[") {
    pageUpStr = "[";
    pageDownStr = "]";
  } else if (interfacePgUp == ";") {
    pageUpStr = ";";
    pageDownStr = ".";
  } else if (interfacePgUp == ",") {
    pageUpStr = ",";
    pageDownStr = ".";
  } else {
    pageUpStr = "PGUP";
    pageDownStr = "PGDN";
  }
  if (short) {
    addInlineOptionText(pageUpStr, "{key} - Prev", params: {"key": pageUpStr});
    console.x += 2;
    addInlineOptionText(
      pageDownStr,
      "{key} - Next",
      params: {"key": pageDownStr},
    );
  } else {
    addInlineOptionText(
      pageUpStr,
      "{key} - Previous Page",
      params: {"key": pageUpStr},
    );
    console.x += 2;
    addInlineOptionText(
      pageDownStr,
      "{key} - Next Page",
      params: {"key": pageDownStr},
    );
  }
  if (current != null && max != null) {
    console.x += 1;
    addstr(
      "({current}/{max})",
      params: {"current": current, "max": max},
      noTranslate: true,
    );
  }
}

void addBackButton({int? y, int? x, String? text}) {
  y ??= console.y;
  x ??= console.x;
  move(y, x);
  addInlineOptionText("Enter", text ?? "Enter - Back");
}

String pageStrWithCurrentAndMaxX(int current, int max) {
  return pageStrWithCurrentAndMax(
    current,
    max,
  ).split(" ").mapIndexed((i, s) => i == 0 ? "&B$s&x" : s).join(" ");
}

bool isBackKey(int c) =>
    c == Key.x || c == Key.enter || c == Key.escape || c == Key.space;
