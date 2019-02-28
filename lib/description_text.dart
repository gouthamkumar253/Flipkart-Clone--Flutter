import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DescriptionTextWidget extends StatefulWidget {
  final String text =
      'Product details are displayed her. Press more to discover more details of the product.There are more lines to be displayed and therefore kindly be patient and scroll through the entire passage. This will be helpful to understand more about the product and purchase the best one';

  @override
  _DescriptionTextWidgetState createState() => _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String display;
  String details;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 70) {
      display = widget.text.substring(0, 70);
      details = widget.text.substring(70, widget.text.length);
    } else {
      display = widget.text;
      details = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        //elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: details.isEmpty
              ? Text(display)
              : Column(
                  children: <Widget>[
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: flag ? display : display + details,
                                  style: const TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: flag ? '... more': ' less',
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        flag = !flag;
                                      });
                                    },
                                )
                              ],
                            ),
                          ),
                        ),
//                        InkWell(
//                          child: Padding(
//                            padding: const EdgeInsets.only(
//                                left: 5.0, top: 20.0, bottom: 5.0),
//                            child: Row(
//                              mainAxisAlignment: MainAxisAlignment.start,
//                              children: <Widget>[
//                                Text(
//                                  flag ? 'show more' : 'show less',
//                                  style: const TextStyle(color: Colors.blue),
//                                ),
//                              ],
//                            ),
//                          ),
//                          onTap: () {
//                            setState(() {
//                              flag = !flag;
//                            });
//                          },
//                        ),
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
