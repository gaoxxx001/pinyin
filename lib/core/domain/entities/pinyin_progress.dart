/// 拼音学习进度枚举
/// 用于跟踪用户在不同拼音类型上的学习进度
enum PinyinProgress {
  /// 单韵母阶段 (1)
  singleVowel(1, '单韵母'),
  
  /// 声母第一组 (2-4)
  consonantGroup1(2, '声母第一组'),
  consonantGroup2(3, '声母第二组'),
  consonantGroup3(4, '声母第三组'),
  
  /// 复韵母第一组 (5-7)
  compoundVowelGroup1(5, '复韵母第一组'),
  compoundVowelGroup2(6, '复韵母第二组'),
  compoundVowelGroup3(7, '复韵母第三组');

  /// 进度值
  final int value;
  
  /// 中文描述
  final String description;

  const PinyinProgress(this.value, this.description);

  /// 从整数值获取枚举值
  static PinyinProgress fromValue(int value) {
    return PinyinProgress.values.firstWhere(
      (progress) => progress.value == value,
      orElse: () => PinyinProgress.singleVowel,
    );
  }

  /// 获取下一阶段
  PinyinProgress get next {
    final values = PinyinProgress.values;
    final currentIndex = values.indexOf(this);
    if (currentIndex < values.length - 1) {
      return values[currentIndex + 1];
    }
    return this;
  }

  /// 获取上一阶段
  PinyinProgress get previous {
    final values = PinyinProgress.values;
    final currentIndex = values.indexOf(this);
    if (currentIndex > 0) {
      return values[currentIndex - 1];
    }
    return this;
  }

  /// 是否为第一阶段
  bool get isFirst => this == PinyinProgress.singleVowel;

  /// 是否为最后阶段
  bool get isLast => this == PinyinProgress.compoundVowelGroup3;

  /// 获取进度百分比 (0-100)
  double get progressPercentage {
    final total = PinyinProgress.values.length;
    final current = value;
    return (current / total) * 100;
  }

  /// 获取当前组的所有拼音
  List<String> getPinyinList() {
    switch (this) {
      case PinyinProgress.singleVowel:
        return ['a', 'o', 'e', 'i', 'u', 'ü'];
      case PinyinProgress.consonantGroup1:
        return ['b', 'p', 'm', 'f'];
      case PinyinProgress.consonantGroup2:
        return ['d', 't', 'n', 'l'];
      case PinyinProgress.consonantGroup3:
        return ['g', 'k', 'h'];
      case PinyinProgress.compoundVowelGroup1:
        return ['ai', 'ei', 'ui'];
      case PinyinProgress.compoundVowelGroup2:
        return ['ao', 'ou', 'iu'];
      case PinyinProgress.compoundVowelGroup3:
        return ['ie', 'üe', 'er'];
    }
  }
}


