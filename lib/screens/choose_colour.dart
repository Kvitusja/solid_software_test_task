import 'package:flutter/material.dart';

import '../widgets/elevatedbutton_widget.dart';
import '../widgets/popup_menu_widget.dart';
import '../widgets/textformfield_widget.dart';

class ChooseColour extends StatefulWidget {
  static const routeName = '/choose-colour';
  const ChooseColour({Key? key}) : super(key: key);

  @override
  State<ChooseColour> createState() => _ChooseColourState();
}

class _ChooseColourState extends State<ChooseColour> {
  final _form = GlobalKey<FormState>();
  String? text = '';
  Color backgroundColour = const Color.fromRGBO(255, 255, 255, 1);
  Color decorationColour = Colors.black;

  TextEditingController rController = TextEditingController();
  TextEditingController gController = TextEditingController();
  TextEditingController bController = TextEditingController();

  void showMyColour() {
    if (_form.currentState!.validate()) {
      setState(() {
        backgroundColour = Color.fromRGBO(
          int.parse(rController.text),
          int.parse(gController.text),
          int.parse(bController.text),
          1,
        );
        decorationColour = getTextColorForBackground(backgroundColour);
      });
    }
  }

  void showComplementaryColour() {
    if (_form.currentState!.validate()) {
      setState(() {
        backgroundColour = Color.fromRGBO(
          255 - int.parse(rController.text),
          255 - int.parse(gController.text),
          255 - int.parse(bController.text),
          1,
        );
        decorationColour = getTextColorForBackground(backgroundColour);
      });
    }
  }

  Color getTextColorForBackground(Color backgroundColour) {
    if (ThemeData.estimateBrightnessForColor(backgroundColour) ==
        Brightness.dark) {
      return Colors.white;
    }
    return Colors.black;
  }

  @override
  void dispose() {
    rController.dispose();
    gController.dispose();
    bController.dispose();
    super.dispose();
  }

  String? formValidator(text) {
    if (int.parse(text) < 0) {
      return 'The value should be bigger than 0';
    }
    if (int.parse(text) > 256) {
      return 'The value should be less than 256';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: decorationColour,
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          PopupMenuWidget(color: decorationColour,),
        ],
      ),
      body: Container(
        color: backgroundColour,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Complete with RGB'),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _form,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormFieldWidget(
                        decorationColour: decorationColour,
                        labelText: 'R',
                        validator: formValidator,
                        fieldController: rController,
                        onChanged: (text) => setState(() {
                          TextSelection previousSelection =
                              rController.selection;
                          rController.text = text!;
                          rController.selection = previousSelection;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormFieldWidget(
                        decorationColour: decorationColour,
                        labelText: 'G',
                        validator: formValidator,
                        fieldController: gController,
                        onChanged: (text) => setState(() {
                          TextSelection previousSelection =
                              gController.selection;
                          gController.text = text!;
                          gController.selection = previousSelection;
                        }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: TextFormFieldWidget(
                        decorationColour: decorationColour,
                        labelText: 'B',
                        validator: formValidator,
                        fieldController: bController,
                        onChanged: (text) => setState(() {
                          TextSelection previousSelection =
                              bController.selection;
                          bController.text = text!;
                          bController.selection = previousSelection;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButtonWidget(
                onPressed: rController.text.isNotEmpty &&
                        gController.text.isNotEmpty &&
                        bController.text.isNotEmpty
                    ? showMyColour
                    : null,
                text: 'Show colour',
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButtonWidget(
                onPressed: rController.text.isNotEmpty &&
                        gController.text.isNotEmpty &&
                        bController.text.isNotEmpty
                    ? showComplementaryColour
                    : null,
                text: 'Opposite colour',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
