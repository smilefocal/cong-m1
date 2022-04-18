import 'package:congraph/styles/app_button_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthenticationButtonsModule extends StatelessWidget {
  const AuthenticationButtonsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sized = MediaQuery.of(context).size.width / 2;
    return Center(
      child: Padding(
        padding: EdgeInsets.only(right: sized, left: 10, top: 0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: AppButtonStyles.elevatedButtonStyle,
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: AppButtonStyles.iconTheme,
                ),
                label: const Text('Continue with Google'),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: AppButtonStyles.elevatedButtonStyle,
                icon: const FaIcon(
                  FontAwesomeIcons.twitter,
                  color: AppButtonStyles.iconTheme,
                ),
                label: const Text('Continue with Twitter'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextButton(
                onPressed: () {},
                child: const Text('Read Terms and Conditions'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
