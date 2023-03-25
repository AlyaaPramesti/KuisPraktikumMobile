import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuispraktikum/pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final PokemonData pokemon;

  const DetailScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokemon.name),
        centerTitle: true,
        actions: <Widget>[IconButton(
          icon: Icon(Icons.favorite),
          onPressed: widget.pokemon.isFavorite ? () {
            String text = "";
            setState(() {
              text = "Berhasil Menambahkan ke Favorite";
              widget.pokemon.isFavorite = false;
            });
            SnackBar snackBar = SnackBar(content: Text(text),backgroundColor: Colors.black,);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } : null,
        )],),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launchURL(widget.pokemon.wikiUrl);
            // print(widget.Pikachu.wikiUrl);
          },
          backgroundColor: Colors.red,
          child: const Icon(
              Icons.catching_pokemon,
              size: 45,
              ),
          ),
      body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/3,
              child: Image.network(widget.pokemon.image),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Type                          : " + widget.pokemon.type.toString(), style: TextStyle(fontSize: 16)),
                  Text("Weakness                : " + widget.pokemon.weakness.toString(),style: TextStyle(fontSize: 16)),
                  Text("Pre Evolution           : " + widget.pokemon.prevEvolution.toString(), style: TextStyle(fontSize: 16)),
                  Text("Next Evolution         : " + widget.pokemon.nextEvolution.toString(), style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ]
      ),
    );
  }
  void _launchURL(_url) async {
    if (!await launch(_url)) throw 'could not launch $_url';
    }
}