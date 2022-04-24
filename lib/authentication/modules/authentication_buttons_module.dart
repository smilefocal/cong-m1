import 'dart:async';

import 'package:congraph/authentication/cubit/button_clicked_cubit.dart';
import 'package:congraph/authentication/cubit/buy_me_coffee.dart';
import 'package:congraph/authentication/cubit/google_authentication.dart';
import 'package:congraph/styles/app_button_styles.dart';
import 'package:congraph/styles/app_colors.dart';
import 'package:congraph/timer/cubits/timer_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthenticationButtonsModule extends StatelessWidget {
  const AuthenticationButtonsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size.width / 2;
    late User? user;

    //reset the button states.
    resetButtonStates() {
      context.read<GoogleCubit>().resetGoogleBtn();
      context.read<TwitterCubit>().resetTwitterBtn();
    }

    //this timer switches between loading and button display.
    void startTimer() {
      const oneSec = Duration(seconds: 1);
      Timer.periodic(
        oneSec,
        (Timer timer) {
          if (context.read<TimerCubit>().state == 0) {
            resetButtonStates();
            context.read<TimerCubit>().resetTimer();
          } else {
            context.read<TimerCubit>().decrementTimer();
          }
        },
      );
    }

    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: sized, left: 10, top: 0),
        child: BlocBuilder<TwitterCubit, bool>(
          builder: (context, twitterState) {
            return BlocBuilder<GoogleCubit, bool>(
              builder: (context, googleState) {
                return ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: 60,
                      child: googleState == false
                          ? ElevatedButton.icon(
                              onPressed: twitterState == false
                                  ? () async {
                                      context
                                          .read<GoogleCubit>()
                                          .googleBtnClicked();
                                      startTimer();
                                      user = await GoogleAuthentication()
                                          .signInWithGoogle()
                                          .then((value) {
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                          '/home',
                                          arguments: value,
                                        );
                                        return null;
                                      });
                                    }
                                  : null,
                              style: AppButtonStyles.elevatedButtonStyle,
                              icon: const FaIcon(
                                FontAwesomeIcons.google,
                                color: AppButtonStyles.iconTheme,
                              ),
                              key: const ValueKey('googleAuthBtn'),
                              label: const Text('Continue with Google'),
                            )
                          : const LoadingSpinWidget(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 60,
                      child: twitterState == false
                          ? ElevatedButton.icon(
                              onPressed: googleState == false
                                  ? () async {
                                      context
                                          .read<TwitterCubit>()
                                          .twitterBtnClicked();
                                      startTimer();
                                      await BuyMeCoffee().buyCoffee();
                                    }
                                  : null,
                              style: AppButtonStyles.elevatedButtonStyle,
                              icon: const FaIcon(
                                FontAwesomeIcons.mugHot,
                                color: AppButtonStyles.iconTheme,
                              ),
                              key: const ValueKey('buyCoffeeBtn'),
                              label: const Text('Buy me a coffee'),
                            )
                          : const LoadingSpinWidget(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Read Terms and Conditions'),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class LoadingSpinWidget extends StatelessWidget {
  const LoadingSpinWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitWave(
      color: AppColors.color2,
      size: 20,
    );
  }
}
