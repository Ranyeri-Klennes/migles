import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:migles/colors.dart';

class ButtonNeumorphic extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;
  final int fontSize;
  const ButtonNeumorphic({
    super.key,
    required this.onPressed,
    required this.text,
    required this.fontSize,
  });

  @override
  State<ButtonNeumorphic> createState() => _ButtonNeumorphicState();
}

class _ButtonNeumorphicState extends State<ButtonNeumorphic> {
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: widget.onPressed,
      style: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
        color: MyColorsLightMode.colorBackgroundApp,
        depth: 5,
        intensity: 1,
        shadowDarkColor: MyColorsLightMode.colorShadowDarkTextField,
        shadowLightColor: MyColorsLightMode.colorShadowLightTextField,
      ),
      child: Text(
        widget.text,
        style: const TextStyle(
          fontFamily: 'Geologica',
          letterSpacing: 1,
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
