// ignore_for_file: prefer_const_constructors

import 'package:app_car/app/global/global_variables.dart';
import 'package:app_car/app/modules/home/domain/entities/result_search_cars.dart';
import 'package:app_car/app/modules/home/presenter/controller/home_controller.dart';
import 'package:app_car/app/modules/home/presenter/page/page_cars_page.dart';
import 'package:app_car/app/modules/home/presenter/states/home_state.dart';
import 'package:app_car/app/modules/login/presenter/state/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaveParamns {
  String token;
  String image;
  bool stayOn;

  SaveParamns(
      {@required this.image, @required this.token, @required this.stayOn});
}

class HomePage extends StatefulWidget {
  final SaveParamns saveParamns;
  const HomePage({Key key, @required this.saveParamns}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

HomeController controller = Modular.get<HomeController>();
ReactionDisposer disposer;
List<ResultSearchCar> listCar = [];
SharedPreferences prefs;

class _HomePageState extends State<HomePage> {
  void initState() {
    disposer = reaction((_) => controller.homeState, (state) {
      _manageState(state);
    });
    controller.searchCars(widget.saveParamns.token);
    Future.delayed(Duration(milliseconds: 200)).then((_) async {
      if (widget.saveParamns.stayOn == true) {
        prefs = await SharedPreferences.getInstance();
        prefs.setBool(GlobalVariable.VALIDATION, widget.saveParamns.stayOn);
      }
    });
    super.initState();
  }

  void dispose() {
    disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.saveParamns.image),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () async {
                    prefs = await SharedPreferences.getInstance();
                    await prefs.clear();
                    Modular.to.pushReplacementNamed('/');
                  },
                  icon: Icon(Icons.exit_to_app))
            ],
            backgroundColor: Colors.green.shade400,
            title: Container(
                child: Text(
              'Carros',
            )),
          ),
        ),
        body: ListView.builder(
            itemCount: listCar.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: () {
                    Modular.to.pushNamed('homepage/pagecars',
                        arguments: SaveParamnsPageCars(
                            urlVideo: listCar[index].urlVideo,
                            nameCars: listCar[index].nome,
                            urlFoto: listCar[index].urlFoto,
                            latitude: listCar[index].latitude,
                            longitude: listCar[index].longitude));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            listCar[index].urlFoto == null
                                ? Image.asset('assets/images/logo.png')
                                : Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    child:
                                        Image.network(listCar[index].urlFoto)),
                            SizedBox(
                              height: 10,
                            ),
                            Text(listCar[index].nome == null
                                ? 'teste'
                                : listCar[index].nome)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }

  void _manageState(HomeState state) {
    if (state is HomeLoadinState) {}
    if (state is SearchCarErro) {}
    if (state is SearchCarsSucess) {
      setState(() {
        listCar = state.listResultCar;
      });
    }
  }
}
