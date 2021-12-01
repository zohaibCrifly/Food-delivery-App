import 'package:flutter/material.dart';

class EnableNotification extends StatefulWidget {
  const EnableNotification({Key? key}) : super(key: key);

  @override
  _EnableNotificationState createState() => _EnableNotificationState();
}

class _EnableNotificationState extends State<EnableNotification> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'images/notify-image.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                'Always know the status of your order',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Push notifications are used to provide updates on your order. You can change this settings at anytime',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFB6D3A),
                        padding: EdgeInsets.all(15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Text(
                      'Enable push notifications',
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Skip for now',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
