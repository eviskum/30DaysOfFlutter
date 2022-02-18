class PokemonDetailsModel {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> typeNames;
  final String description;

  PokemonDetailsModel(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.height,
      required this.weight,
      required this.typeNames,
      required this.description});
}
