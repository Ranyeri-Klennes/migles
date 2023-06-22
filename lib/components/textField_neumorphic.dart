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
  double _depth = 0;
  final FocusNode _focusNodeLogin = FocusNode();
  final FocusNode _focusNodeSenha = FocusNode();

  @override
  void initState() {
    super.initState();
    setupFocusNodes();
  }

  void setupFocusNodes() {
    _focusNodeLogin.addListener(() {
      updateDepthAndUnfocusOther(_focusNodeLogin, _focusNodeSenha);
    });

    _focusNodeSenha.addListener(() {
      updateDepthAndUnfocusOther(_focusNodeSenha, _focusNodeLogin);
    });
  }

  void updateDepthAndUnfocusOther(FocusNode self, FocusNode other) {
    setState(() {
      _depth = self.hasFocus ? -8 : 0;
      if (self.hasFocus) other.unfocus();
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
    return buildNeumorphicContainer();
  }

  Widget buildNeumorphicContainer() {
    return Neumorphic(
      style: buildNeumorphicStyle(),
      child: buildPaddingContainer(),
    );
  }

  NeumorphicStyle buildNeumorphicStyle() {
    return NeumorphicStyle(
      color: MyColorsLightMode.colorBackgroundTextField,
      depth: _depth,
      intensity: 0.9,
      shadowDarkColorEmboss: MyColorsLightMode.colorShadowDarkTextField,
      shadowLightColorEmboss: MyColorsLightMode.colorShadowLightTextField,
      boxShape: NeumorphicBoxShape.roundRect(
        BorderRadius.circular(26),
      ),
    );
  }

  Padding buildPaddingContainer() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: buildTextFormField(),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      textAlign: _focusNodeLogin.hasFocus ? TextAlign.start : TextAlign.center,
      validator: widget.validator,
      textInputAction: TextInputAction.done,
      focusNode: widget.focusNode,
      onTap: toggleDepth,
      onTapOutside: (_) => setState(() => _depth == 1),
      cursorColor: MyColorsLightMode.colorFontTextField,
      obscureText: widget.obscureText,
      obscuringCharacter: widget.obscuringCharacter,
      decoration: buildInputDecoration(),
      style: buildTextStyle(),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
        hintText: widget.hintText,
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(
          letterSpacing: 1,
          color: MyColorsLightMode.colorFontTextField,
        ),
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.all(16));
  }

  TextStyle buildTextStyle() {
    return const TextStyle(
      fontFamily: 'Geologica',
      letterSpacing: 1,
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: MyColorsLightMode.colorFonts,
    );
  }

  void toggleDepth() {
    setState(() {
      _depth = _depth == 1 ? -8 : 0;
    });
  }
}
