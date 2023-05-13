import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon/core/constant/constants.dart';
import 'package:pokemon/model/Pokemon_model.dart';

class PokemonService {
  Future getPokemon() async {
    try {
      Response response = await Dio().get(Constants.Api);
      if (response.statusCode == 200) {
        return PokemonModel.fromJson(jsonDecode(response.data));
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}














































// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:pokemon/model/Pokemon_model.dart';

// class PokemonService {
//   Future getPokemon() async {
//     try {
//       Response response = await Dio().get(
//           "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
//       if (response.statusCode == 200) {
//         return PokemonModel.fromJson(jsonDecode(response.data));
//       } else {
//         return response.statusMessage.toString();
//       }
//     } on DioError catch (e) {
//       return e.message.toString();
//     }
//   }
// }
