import 'package:auttu_test/components/appBar.dart';
import 'package:auttu_test/components/button.dart';
import 'package:auttu_test/components/indicators.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Screens/create_activity_stack.dart';
import 'Screens/date_activity_stack.dart';
import 'Screens/overview_stack.dart';
import 'providers/dot_provider.dart';

class Body extends ConsumerWidget {
  static final String routeName = "/mainBody";
  @override
  Widget build(BuildContext context, watch) {
    final _currentIndex = watch(currentIndexProvider).state;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: GestureDetector(
            onTap: () {
              ///Simple unfocus while tapping outSide
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: LayoutBuilder(
                builder: (context, constraints) => Stack(
                      children: [
                        Positioned(
                          top: 16,
                          left: 19,
                          child: MyAppBar(
                            title: _currentIndex == 0
                                ? "Create an activity"
                                : _currentIndex == 1
                                    ? "Date of activity"
                                    : "Done",
                            data: _currentIndex == 0
                                ? Icons.close
                                : Icons.arrow_back_ios_new,
                          ),
                        ),
                        Align(
                          alignment: Alignment(0, -.15),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                            ),
                            child: IndexedStack(
                              index: _currentIndex,
                              children: [
                                ///2nd Screen
                                SecondScreenWidgets(),

                                ///3rd Screen elements
                                ThiredScreenWidgets(),

                                ///OutPut
                                OverViewScreen(),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 39,
                          left: 19,
                          right: 19,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DotIndicators(),
                              CustomButton(
                                buttonText: _currentIndex == 2
                                    ? "Close"
                                    : _currentIndex == 1
                                        ? "Ok"
                                        : "Next",
                                onPress: () {
                                  /// we riverPod suggest call like this while inside button
                                  final currentIndex =
                                      context.read(currentIndexProvider).state;
                                  if (currentIndex == 2) {
                                    Navigator.of(context).pop();
                                  } else {
                                    if (currentIndex == 0) {
                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }
                                    }
                                    context.read(currentIndexProvider).state +=
                                        1;
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
          )),
    );
  }
}
