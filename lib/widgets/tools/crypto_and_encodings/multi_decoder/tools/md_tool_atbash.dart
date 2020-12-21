import 'package:flutter/material.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/reverse.dart';
import 'package:gc_wizard/logic/tools/crypto_and_encodings/atbash.dart';
import 'package:gc_wizard/widgets/common/gcw_abc_spinner.dart';
import 'package:gc_wizard/widgets/tools/crypto_and_encodings/multi_decoder/gcw_multi_decoder_tool.dart';
import 'package:gc_wizard/widgets/tools/crypto_and_encodings/multi_decoder/gcw_multi_decoder_tool_configuration.dart';

const MDT_INTERNALNAMES_ATBASH = 'atbash';

class MultiDecoderToolAtbash extends GCWMultiDecoderTool {

  MultiDecoderToolAtbash({Key key, int id, String name, MultiDecoderToolState state, Map<String, dynamic> options}) :
    super(
      key: key,
      id: id,
      name: name,
      state: state,
      internalToolName: MDT_INTERNALNAMES_ATBASH,
      onDecode: (input) {
        return atbash(input);
      },
      options: options
    );
}