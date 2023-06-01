import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:migles/colors.dart';

class NeumorphicTextField extends StatefulWidget {
  const NeumorphicTextField({super.key});

  @override
  State<NeumorphicTextField> createState() => _NeumorphicTextFieldState();
}

class _NeumorphicTextFieldState extends State<NeumorphicTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Neumorphic(
        style: NeumorphicStyle(
          surfaceIntensity: ,
          shadowDarkColorEmboss: MyColorsLightMode.shadowTextField,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(12),
          ),
          depth: -10,
          lightSource: LightSource.topLeft,
          color: MyColorsLightMode.bgTextField,
        ),
        child: const TextField(
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(bottom: 11, left: 15, right: 15, top: 11)),
        ),
      ),
    );
  }
}
