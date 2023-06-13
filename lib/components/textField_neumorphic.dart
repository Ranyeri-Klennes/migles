//  Como usar o neumorfismo: https://www.youtube.com/watch?v=GeQ17BUKNo4

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:migles/colors.dart';

class TextFieldNeumorphic extends StatefulWidget {
  final String hintText;
  final String obscuringCharacter;
  final bool obscureText;
  final FocusNode? focusNode;
  final FormFieldValidator<String>? validator;

  const TextFieldNeumorphic({
    super.key,
    this.hintText = '',
    this.obscuringCharacter = "*",
    this.obscureText = false,
    this.focusNode,
    this.validator,
  });

  @override
  State<TextFieldNeumorphic> createState() => _TextFieldNeumorphicState();
}

class _TextFieldNeumorphicState extends State<TextFieldNeumorphic> {
  double _depth = 1;
  final FocusNode _focusNodeLogin = FocusNode();
  final FocusNode _focusNodeSenha = FocusNode();

  @override
  void initState() {
    super.initState();

    _focusNodeLogin.addListener(() {
      setState(() {
        _depth = _focusNodeLogin.hasFocus ? -8 : 1;
        if (_focusNodeLogin.hasFocus) _focusNodeSenha.unfocus();
      });
    });

    _focusNodeSenha.addListener(() {
      setState(() {
        _depth = _focusNodeSenha.hasFocus ? -8 : 1;
        if (_focusNodeSenha.hasFocus) _focusNodeLogin.unfocus();
      });
    });
  }

  @override
  void dispose() {
    _focusNodeLogin.dispose();
    _focusNodeSenha.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        color: MyColorsLightMode.colorBackgroundTextField,
        depth: _depth,
        intensity: 0.9,
        shadowDarkColorEmboss: MyColorsLightMode.colorShadowDarkTextField,
        shadowLightColorEmboss: MyColorsLightMode.colorShadowLightTextField,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(26),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          textAlign:
              _focusNodeLogin.hasFocus ? TextAlign.start : TextAlign.center,
          validator: widget.validator,
          textInputAction: TextInputAction.done,
          focusNode: widget.focusNode,
          onTap: () => setState(
            () => _depth = _depth == 1 ? -8 : 1,
          ),
          onTapOutside: (_) => setState(
            () => _depth == 1,
          ),
          cursorColor: MyColorsLightMode.colorFontTextField,
          obscureText: widget.obscureText,
          obscuringCharacter: widget.obscuringCharacter,
          decoration: InputDecoration(
              hintText: widget.hintText,
              hintTextDirection: TextDirection.rtl,
              hintStyle: const TextStyle(
                letterSpacing: 1,
                color: MyColorsLightMode.colorFontTextField,
              ),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.all(16)),
          style: const TextStyle(
            fontFamily: 'Geologica',
            letterSpacing: 1,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: MyColorsLightMode.colorFonts,
          ),
        ),
      ),
    );
  }
}
