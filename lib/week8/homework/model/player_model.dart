class Player {
  final String id;
  final String name;
  final double score;

  Player({required this.id, required this.name, required this.score});
  @override
  bool operator ==(Object other) {
    return other is Player && other.id == id;
  }

  @override
  int get hashCode => super.hashCode ^ id.hashCode;
}