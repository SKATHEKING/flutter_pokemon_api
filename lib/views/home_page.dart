import 'package:flutter/material.dart';
import 'package:pokemon_api_app/models/remote_service.dart';
import 'package:pokemon_api_app/models/pokemon.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Pokemon> result = [];
  var didItLoad = true;


  @override
  void initState() {
    super.initState();
    getPokemon();
  }

  getPokemon() async {
    result = (await RemoteService().getPokemon()) ;
    if (result.isNotEmpty) {
      setState(() {
        didItLoad = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(result.length > 0 ? result[0].name :  "no pokemon"),
          // {
          //   for (var i = 0; i < result.length; i++) {
          //   if (i < result.length) {
          //     var name = result[i].name;
          //     return name;
          //   }}
          // } as String),
          backgroundColor: Colors.red,
        ),
        body: Visibility(
          visible: didItLoad,
          replacement: const Center(child: CircularProgressIndicator()),
          child: ListView.builder(
            itemCount: result.length,
            itemBuilder: (context, index) {
              return const Text("Pokemon");
            },
          ),
        ));
  }
}
