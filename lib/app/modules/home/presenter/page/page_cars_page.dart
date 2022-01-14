import 'package:app_car/app/global/global_alert_dialog.dart';
import 'package:app_car/app/modules/home/presenter/page/video_player_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:url_launcher/url_launcher.dart';

class SaveParamnsPageCars {
  String urlVideo;
  String nameCars;
  String urlFoto;
  String latitude;
  String longitude;
  SaveParamnsPageCars(
      {@required this.urlVideo,
      @required this.nameCars,
      @required this.urlFoto,
      @required this.latitude,
      @required this.longitude});
}

class PageCars extends StatefulWidget {
  final SaveParamnsPageCars saveParamns;
  const PageCars({Key key, @required this.saveParamns}) : super(key: key);

  @override
  State<PageCars> createState() => _PageCarsState();
}

launchMap({String lat, String long}) async {
  String googleUrl =
      'https://www.google.com/maps/search/?api=1&query=$lat,$long';
  if (await canLaunch(googleUrl)) {
    await launch(googleUrl);
  } else {
    throw 'Could not launch $googleUrl';
  }
}

class _PageCarsState extends State<PageCars> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          actions: [
            IconButton(
              onPressed: ((widget.saveParamns.latitude == null ||
                          widget.saveParamns.latitude == '') ||
                      (widget.saveParamns.longitude == null ||
                          widget.saveParamns.longitude == ''))
                  ? () {
                      GlobalAlertDialog.showAlertDialogHomePage(
                          context, 'Este carro não possui Lat/Lng da fábricca.',
                          () {
                        Navigator.of(context).pop();
                      }, 'OK');
                    }
                  : () {
                      launchMap(
                        long: widget.saveParamns.longitude,
                        lat: widget.saveParamns.latitude,
                      );
                    },
              icon: Icon(Icons.location_on),
            ),
            IconButton(
                onPressed: (widget.saveParamns.urlVideo == null ||
                        widget.saveParamns.urlVideo == '')
                    ? () {
                        GlobalAlertDialog.showAlertDialogHomePage(
                            context, 'Esse carro não possui nenhum video.', () {
                          Navigator.of(context).pop();
                        }, 'OK');
                      }
                    : () {
                        Modular.to.pushNamed('pagecars/videopage',
                            arguments: UrlVideo(
                                urlVideo: widget.saveParamns.urlVideo));
                      },
                icon: Icon(Icons.videocam))
          ],
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(widget.saveParamns.nameCars == null
                ? ''
                : widget.saveParamns.nameCars),
          ),
          leading: IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: Icon(Icons.arrow_back))),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: widget.saveParamns.urlFoto == null
                    ? Image.asset(
                        'assets/images/logo.png',
                      )
                    : Image.network(widget.saveParamns.urlFoto)),
          ],
        ),
      ),
    );
  }
}
