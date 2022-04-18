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
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(38, 63, 68, 1.0),
                  ),
                ),
                icon: const FaIcon(FontAwesomeIcons.google),
                label: const Text(''),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(38, 63, 68, 1.0),
                  ),
                ),
                icon: const FaIcon(FontAwesomeIcons.twitter),
                label: const Text(''),
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
