import 'dart:convert';

PokemonModel pokemonModelFromJson(String str) => PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

class PokemonModel {
    List<Pokemon> pokemon;

    PokemonModel({
        required this.pokemon,
    });

    factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
    };
}

class Pokemon {
    int id;
    String num;
    String name;
    String img;
    List<Type> type;
    String height;
    String weight;
    String candy;
    int? candyCount;
    Egg egg;
    double spawnChance;
    double avgSpawns;
    String spawnTime;
    List<double>? multipliers;
    List<Type> weaknesses;
    List<Evolution>? nextEvolution;
    List<Evolution>? prevEvolution;

    Pokemon({
        required this.id,
        required this.num,
        required this.name,
        required this.img,
        required this.type,
        required this.height,
        required this.weight,
        required this.candy,
        this.candyCount,
        required this.egg,
        required this.spawnChance,
        required this.avgSpawns,
        required this.spawnTime,
        this.multipliers,
        required this.weaknesses,
        this.nextEvolution,
        this.prevEvolution,
    });

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<Type>.from(json["type"].map((x) => typeValues.map[x]!)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"],
        egg: eggValues.map[json["egg"]]!,
        spawnChance: json["spawn_chance"]?.toDouble(),
        avgSpawns: json["avg_spawns"]?.toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null ? [] : List<double>.from(json["multipliers"]!.map((x) => x?.toDouble())),
        weaknesses: List<Type>.from(json["weaknesses"].map((x) => typeValues.map[x]!)),
        nextEvolution: json["next_evolution"] == null ? [] : List<Evolution>.from(json["next_evolution"]!.map((x) => Evolution.fromJson(x))),
        prevEvolution: json["prev_evolution"] == null ? [] : List<Evolution>.from(json["prev_evolution"]!.map((x) => Evolution.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "num": num,
        "name": name,
        "img": img,
        "type": List<dynamic>.from(type.map((x) => typeValues.reverse[x])),
        "height": height,
        "weight": weight,
        "candy": candy,
        "candy_count": candyCount,
        "egg": eggValues.reverse[egg],
        "spawn_chance": spawnChance,
        "avg_spawns": avgSpawns,
        "spawn_time": spawnTime,
        "multipliers": multipliers == null ? [] : List<dynamic>.from(multipliers!.map((x) => x)),
        "weaknesses": List<dynamic>.from(weaknesses.map((x) => typeValues.reverse[x])),
        "next_evolution": nextEvolution == null ? [] : List<dynamic>.from(nextEvolution!.map((x) => x.toJson())),
        "prev_evolution": prevEvolution == null ? [] : List<dynamic>.from(prevEvolution!.map((x) => x.toJson())),
    };
}

enum Egg { THE_2_KM, NOT_IN_EGGS, THE_5_KM, THE_10_KM, OMANYTE_CANDY }

final eggValues = EnumValues({
    "Not in Eggs": Egg.NOT_IN_EGGS,
    "Omanyte Candy": Egg.OMANYTE_CANDY,
    "10 km": Egg.THE_10_KM,
    "2 km": Egg.THE_2_KM,
    "5 km": Egg.THE_5_KM
});

class Evolution {
    String num;
    String name;

    Evolution({
        required this.num,
        required this.name,
    });

    factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "num": num,
        "name": name,
    };
}

enum Type { FIRE, ICE, FLYING, PSYCHIC, WATER, GROUND, ROCK, ELECTRIC, GRASS, FIGHTING, POISON, BUG, FAIRY, GHOST, DARK, STEEL, DRAGON, NORMAL }

final typeValues = EnumValues({
    "Bug": Type.BUG,
    "Dark": Type.DARK,
    "Dragon": Type.DRAGON,
    "Electric": Type.ELECTRIC,
    "Fairy": Type.FAIRY,
    "Fighting": Type.FIGHTING,
    "Fire": Type.FIRE,
    "Flying": Type.FLYING,
    "Ghost": Type.GHOST,
    "Grass": Type.GRASS,
    "Ground": Type.GROUND,
    "Ice": Type.ICE,
    "Normal": Type.NORMAL,
    "Poison": Type.POISON,
    "Psychic": Type.PSYCHIC,
    "Rock": Type.ROCK,
    "Steel": Type.STEEL,
    "Water": Type.WATER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
