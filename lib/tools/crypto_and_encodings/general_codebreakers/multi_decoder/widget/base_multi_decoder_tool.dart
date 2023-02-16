part of 'package:gc_wizard/tools/crypto_and_encodings/general_codebreakers/multi_decoder/widget/multi_decoder.dart';

abstract class AbstractMultiDecoderTool {
  final int id;
  String name;
  final String internalToolName;
  final Object? Function(String, String) onDecode;
  final MultiDecoderToolConfiguration? configurationWidget;
  final bool requiresKey;
  final bool optionalKey;
  late final Map<String, Object>? options;

  AbstractMultiDecoderTool(
      {Key? key,
      required this.id,
      required this.name,
      required this.internalToolName,
      required this.onDecode,
      this.requiresKey = false,
      this.optionalKey = false,
      this.configurationWidget,
        required this.options}) {
    if (options == null) options = {};
  }
}
class MultiDecoderToolDummy extends AbstractMultiDecoderTool {
  MultiDecoderToolDummy()
      : super(
      key: null,
      id: -1,
      name: '',
      internalToolName: '',
      onDecode: (String input, String key) {},
      options: null);
}