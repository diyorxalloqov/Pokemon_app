import 'package:flutter/material.dart';
import 'package:pokemon/model/Pokemon_model.dart';
import 'package:pokemon/service/Pokemon_service.dart';
import 'package:pokemon/ui/InfoPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: PokemonService().getPokemon(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.data is String) {
          return Center(
            child: Text(snapshot.data.toString()),
          );
        } else {
          PokemonModel data = snapshot.data as PokemonModel;
          return Column(
            children: [
              const SizedBox(
                height: 53,
              ),
              const SafeArea(
                  child: Image(image: AssetImage("assets/image.png"))),
              const SizedBox(
                height: 31,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE5E5E5),
                    fixedSize: const Size(296, 42),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  'Buscar Pakemon',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Color(0xff838282),
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: data.pokemon.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          //connect with api on button tap 
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  InfoPage(info: data.pokemon[index],)));
                        },
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: Container(
                                margin: const EdgeInsets.only(top: 33.82),
                                height: 115.18,
                                width: 177,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Color(0xffFC7CFF),
                                      Color(0xffFA5AFD)
                                    ]),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ),
                            Positioned(
                                left: 30,
                                child: Column(
                                  children: [
                                    Image(
                                        image: NetworkImage(data
                                            .pokemon[index].img
                                            .toString())),
                                    Container(
                                      height: 27.42,
                                      width: 147,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff676767),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Expanded(
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 5),
                                            Text(
                                              "#${data.pokemon[index].num}",
                                              style: const TextStyle(
                                                  fontSize: 12.0,
                                                  color: Color(0xffF993FB)),
                                            ),
                                            const SizedBox(
                                              width: 18,
                                            ),
                                            Text(
                                              data.pokemon[index].name,
                                              style: const TextStyle(
                                                  color: Color(0xffFFFFFF)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      );
                    })),
              ),
            ],
          );
        }
      },
    ));
  }
}
