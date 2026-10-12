/// 学生模型：不可变 id/name，分数通过校验 setter 修改。
class Student {
  final String id;
  final String name;
  int _score;

  Student({required this.id, required this.name, required int score})
      : _score = score {
    _checkRange(score);
  }

  /// 命名构造：从 JSON Map 构建
  Student.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          name: json['name'] as String,
          score: (json['score'] as num).toInt(),
        );

  /// getter：对外暴露只读分数
  int get score => _score;

  /// 校验 setter：分数越界（0~100 之外）抛 ArgumentError
  set score(int value) {
    _checkRange(value);
    _score = value;
  }

  static void _checkRange(int value) {
    if (value < 0 || value > 100) {
      throw ArgumentError.value(value, 'score', '分数必须在 0~100 之间');
    }
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'score': score};

  @override
  String toString() => 'Student(id: $id, name: $name, score: $score)';
}
