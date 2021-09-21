import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    home: ApiScreen(),
  ));
}

class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List pokemons = [];

  fetchdata() async {
    Dio dio = new Dio();
    var pokemonData = await dio.get("https://pokeapi.co/api/v2/pokemon/");

    setState(() {
      pokemons = pokemonData.data['results'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(pokemons[index]['name']),
                    ))));
  }
}
