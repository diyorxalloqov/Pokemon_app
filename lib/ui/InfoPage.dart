import 'package:flutter/material.dart';
import 'package:pokemon/model/Pokemon_model.dart';

class InfoPage extends StatelessWidget {
  //connect with api

  final Pokemon info;

  const InfoPage({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        const SafeArea(
          child: SizedBox(
            height: 25,
          ),
        ),
        const Image(image: AssetImage("assets/image.png")),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffE5E5E5),
                    fixedSize: const Size(228, 42),
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
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.graphic_eq,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 21,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 67),
              child: Container(
                width: 371,
                height: 205,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                        colors: [Color(0xffFC7CFF), Color(0xffFA5AFD)])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Positioned(
                  left: 54,
                  right: 28,
                  bottom: 60,
                  child: Image.network(
                    info.img.toString(),
                    fit: BoxFit.cover,
                    width: 289,
                    height: 247,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 22, top: 35),
              child: Positioned(
                child: Text(
                  "#${info.num}",
                  style: const TextStyle(
                      color: Color(0xffFC7CFF),
                      fontSize: 16.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 275, top: 30),
              child: Positioned(
                child: Text(info.name,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w800,
                        fontStyle: FontStyle.normal,
                        fontSize: 16.0)),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(174, 38),
                    elevation: 3,
                    backgroundColor: const Color.fromRGBO(252, 166, 0, 0.97),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "Fuego",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xffFFFEFC),
                  ),
                )),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(174, 38),
                    elevation: 3,
                    backgroundColor: const Color.fromRGBO(0, 131, 252, 0.46),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "Volador",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xffFFFEFC),
                  ),
                )),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 309,
            decoration: const BoxDecoration(
                color: Color(0xffFA5AFD),
                borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 31,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Text(
                        "Altura",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Categoria",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "Debilidad",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text(
                            info.height,
                            style: const TextStyle(
                                fontSize: 16.0,
                                color: Color.fromRGBO(255, 255, 255, 0.56),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const Text(
                          "Llama",
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Color.fromRGBO(255, 255, 255, 0.56),
                              fontWeight: FontWeight.w700),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff1D8FF8),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  "Agua",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.56),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFBD92A),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  "Electricidad",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.56),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: const Color(0xffCA9E03),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                const Text(
                                  "Roca",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color:
                                          Color.fromRGBO(255, 255, 255, 0.56),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      "Peso",
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffFFFFFF),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Text(
                      info.weight,
                      style: const TextStyle(
                          fontSize: 16.0,
                          color: Color.fromRGBO(255, 255, 255, 0.56),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                            height: double.infinity,
                            width: mq.width * 0.6,
                            child: Image.asset("assets/pokemon.png")),
                      ],
                    ),
                  )
                ]),
          ),
        )
      ],
    ));
  }
}
