import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<InfoScreen> {

  void _launchURL() async {
    const url = 'https://github.com/vichhika';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: [
                FadeInImage.assetNetwork(
                  height: MediaQuery.of(context).size.height / 3,
                  fit: BoxFit.cover,
                  image: 'https://cdn.vox-cdn.com/thumbor/1S7mDgXKPLF7mww1c05QVjaon7w=/1400x788/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19661987/acastro_190807_3592_best_anime_2019_0001__1_.jpg',
                  placeholder:'lib/assets/images/cupertino_activity_indicator.gif',
                  placeholderCacheWidth: 16,
                  placeholderCacheHeight: 16,),
                Positioned(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/51940586?v=4',),
                  ),
                  bottom: -50,
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ListTile(
              title: Center(
                  child: Text(
                '@VICHHIKA',
                style: TextStyle(fontFamily: 'JetBrainsMono'),
              )),
              subtitle: Center(
                  child: Text(
                'Artist & Graphic Designer',
                style: TextStyle(fontFamily: 'JetBrainsMono', fontSize: 12),
              )),
            ),
            TextButton.icon(
              onPressed: _launchURL,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              icon: Icon(
                Ionicons.logo_github,
                color: Colors.white,
              ),
              label: Text(
                'Github',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'About Me\n',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Hello, I\'m IT Engineering student. Currently, I\'m studying year 4. I have NULL experience at Mobile, Web, Desktop Application Development. But  I have some experience in abuse test on Web and Network. My serious passion is sleeping.',
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 11,
                  fontFamily: 'JetBrainsMono',
                ),
              ),
            )
          ],
        ),
      );
}

