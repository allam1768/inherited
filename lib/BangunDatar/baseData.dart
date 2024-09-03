class baseData{
  final int result;
  final int firstNum;
  final int secondNum;
  final double weight;
  final double height;

  const baseData({
    this.result = 0,
    this.firstNum = 0,
    this.secondNum = 0,
    this.weight = 0.0,
    this.height = 0.0,
  });

  baseData copy(int result, int firstNum, int secondNum, double height, double weight){
    return baseData(
      result: result ?? this.result,
      firstNum: firstNum ?? this.firstNum,
      secondNum: secondNum ?? this.secondNum,
      weight: weight ?? this.weight,
      height: height ?? this.height,
    );
  }

  @override
  bool operator == (Object other){
    return identical(this, other) ||
    other is baseData &&
    runtimeType == other.runtimeType &&
    result == other.result &&
    firstNum == other.firstNum &&
    secondNum == other.secondNum &&
    height == other.height &&
    weight == other.weight;
  }

  @override
  int get hashCode => result.hashCode ^ firstNum.hashCode ^ secondNum.hashCode ^ weight.hashCode ^ height.hashCode;
}