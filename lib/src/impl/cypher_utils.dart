mixin CypherLiteralConvertible {
  String toCypherLiteral();
}

abstract class CypherUtils {
  static String toLiteral(dynamic value) {
    if (value == null) {
      return 'null';
    } else if (value is CypherLiteralConvertible) {
      return value.toCypherLiteral();
    } else if (value is String) {
      return toStringLiteral(value);
    } else if (value is num) {
      return value.toString();
    } else {
      throw ArgumentError('Unsupported value type for Cypher literal: '
          '$value (type: ${value.runtimeType})');
    }
  }

  static String escapeString(String value) {
    return value.replaceAll('"', r'\"');
  }

  static String toStringLiteral(String value) {
    return '"${escapeString(value)}"';
  }
}
