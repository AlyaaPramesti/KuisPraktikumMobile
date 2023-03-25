import 'package:flutter/material.dart';
import 'package:kuispraktikum/homedetailpage.dart';
import 'package:kuispraktikum/pokemon_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
        centerTitle: true,
      ),
      body: GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: listPokemon.length,
        itemBuilder: (context, index) {
          final PokemonData pokemon = listPokemon[index];

          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                  DetailScreen(pokemon: pokemon),
              ));
            },
            child: Column(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: Image.network(pokemon.image),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          pokemon.name,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          );
        },
      ),
    );
  }
}
