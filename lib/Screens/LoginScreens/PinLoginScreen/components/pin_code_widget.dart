import 'package:budget_buddie/Utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:sizer/sizer.dart';

class CustomPinCodeWidget extends StatefulWidget {
  const CustomPinCodeWidget({
    Key? key,
    required this.onEnter,
    this.minPinLength = 4,
    this.maxPinLength = 25,
    required this.onChangedPin,
    this.onChangedPinLength,
    this.clearStream,
    this.centerBottomWidget,
    this.numbersStyle = const TextStyle(
        fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.grey),
    this.borderSide = const BorderSide(width: 1, color: Colors.grey),
    this.buttonColor = Colors.black12,
    this.deleteButtonColor = Colors.black12,
    this.filledIndicatorColor = Colors.blueAccent,
    this.deleteButtonLabel = 'Delete',
    this.enterButtonLabel = 'Enter',
    this.deleteIconColor = Colors.grey,
    this.onPressColorAnimation = Colors.grey,
  }) : super(key: key);

  final void Function(String pin, PinCodeState state) onEnter;

  final void Function(String pin) onChangedPin;

  final void Function(int length)? onChangedPinLength;

  final Stream<bool>? clearStream;
  final int minPinLength;
  final int maxPinLength;
  final Widget? centerBottomWidget;
  final TextStyle numbersStyle;
  final BorderSide borderSide;
  final Color buttonColor;
  final Color filledIndicatorColor;
  final String deleteButtonLabel;
  final String enterButtonLabel;
  final Color deleteIconColor;
  final Color deleteButtonColor;
  final Color onPressColorAnimation;

  @override
  State<StatefulWidget> createState() => PinCodeState();
}

class PinCodeState<T extends CustomPinCodeWidget> extends State<T> {
  final _gridViewKey = GlobalKey();
  final _key = GlobalKey<ScaffoldState>();
  final ScrollController listController = ScrollController();

  late String pin;
  late double _aspectRatio;
  bool animate = false;

  int currentPinLength() => pin.length;

  @override
  void initState() {
    super.initState();
    pin = '';
    _aspectRatio = 1;

    if (widget.clearStream != null) {
      widget.clearStream!.listen((val) {
        if (val) {
          clear();
        }
      });
    }
  }

  void clear() {
    if (_key.currentState?.mounted != null && _key.currentState!.mounted) {
      setState(() => pin = '');
    }
  }

  void reset() => setState(() {
        pin = '';
      });

  void changeProcessText(String text) {}

  void close() {
    Navigator.of(_key.currentContext!).pop();
  }

  @override
  Widget build(BuildContext context) =>

   
      body(context);

  Widget body(BuildContext context) {
  
    return Container(
      key: _gridViewKey,
      padding: EdgeInsets.only(left: 8.w, right: 8.w, bottom: 15),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
              child: ListView(
                controller: listController,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                shrinkWrap: true,
              
                children: List.generate(4, (index) {
                  const size = 10.0;
                  if (index <= pin.length - 1) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: widget.filledIndicatorColor,
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColor.textSecondaryColor)),
                    ),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(height: 22),
          Container(
              child: _aspectRatio > 0
                  ? GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      childAspectRatio: _aspectRatio + 0.20,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        12,
                        (index) {
                          const double marginRight = 15;
                          const double marginLeft = 15;
                          const double marginBottom = 0;

                          if (index == 9) {
                            return const SizedBox();
                            // return Container(
                            //   margin: const EdgeInsets.only(
                            //       left: marginLeft, right: marginRight),
                            //   child: MergeSemantics(
                            //     child: Semantics(
                            //       label: widget.deleteButtonLabel,
                            //       child: ElevatedButton(
                            //         style: ElevatedButton.styleFrom(
                            //           elevation: 0,
                            //           foregroundColor:
                            //               widget.onPressColorAnimation,
                            //           backgroundColor:
                            //               context.theme.primaryColor,
                            //           // backgroundColor: widget.deleteButtonColor,
                            //           side: widget.borderSide,
                            //           shape: const CircleBorder(),
                            //         ),
                            //         onPressed: () => _onRemove(),
                            //         child: deleteIconImage,
                            //       ),
                            //     ),
                            //   ),
                            // );
                          } else if (index == 10) {
                            index = 0;
                          } else if (index == 11) {
                            return Container(
                              margin: const EdgeInsets.only(
                                  left: marginLeft, right: marginRight),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    foregroundColor:
                                        widget.onPressColorAnimation,
                                    backgroundColor: context.theme.primaryColor,
                                    side: widget.borderSide,
                                    shape: const CircleBorder(),
                                    padding: EdgeInsets.zero),
                                onPressed: () => _onRemove(),
                                child: const Center(
                                    child: Icon(Icons.backspace_outlined)),
                              ),
                            );
                            // return Container(
                            //   margin: const EdgeInsets.only(
                            //       left: marginLeft, right: marginRight),
                            //   child: MergeSemantics(
                            //     child: Semantics(
                            //       label: widget.enterButtonLabel,
                            //       child: ElevatedButton(
                            //         style: ElevatedButton.styleFrom(
                            //           elevation: 0,
                            //           foregroundColor:
                            //               widget.onPressColorAnimation,
                            //           // backgroundColor: widget.deleteButtonColor,
                            //           backgroundColor:
                            //               context.theme.primaryColor,
                            //           side: widget.borderSide,
                            //           shape: const CircleBorder(),
                            //         ),
                            //         onPressed: () {
                            //           widget.onEnter(pin, this);
                            //           clear();
                            //         },
                            //         child: enterIconImage,
                            //       ),
                            //     ),
                            //   ),
                            // );
                          } else {
                            index++;
                          }
                          return Container(
                            margin: const EdgeInsets.only(
                                left: marginLeft,
                                right: marginRight,
                                bottom: marginBottom),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor: widget.onPressColorAnimation,
                                backgroundColor: widget.buttonColor,
                                side: widget.borderSide,
                                shape: const CircleBorder(),
                              ),
                              onPressed: () => _onPressed(index),
                              child: Text(
                                '$index',
                                style: widget.numbersStyle,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : null),

       
        ],
      ),
    );
  }

  void _onPressed(int num) async {
    if (currentPinLength() >= widget.maxPinLength) {
      await HapticFeedback.heavyImpact();
      return;
    }
    setState(() {
      animate = false;

      pin += num.toString();
      widget.onChangedPin(pin);
    });
    Future.delayed(const Duration(milliseconds: 60)).then((value) {
      setState(() {
        animate = true;
      });
    });
    listController.jumpTo(listController.position.maxScrollExtent);
  }

  void _onRemove() {
    if (currentPinLength() == 0) {
      return;
    }
    setState(() => pin = pin.substring(0, pin.length - 1));
  }

 
}


typedef OnWidgetSizeChange = void Function(Size size);

class _MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  _MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  final OnWidgetSizeChange onChange;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MeasureSizeRenderObject(onChange);
  }
}
