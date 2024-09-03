class baseData{
  final int result;
  final int firstNum;
  final int secondNum;

  const baseData({
    this.result = 0,
    this.firstNum = 0,
    this.secondNum = 0
  });

  baseData copy(int result, int firstNum, int secondNum){
    return baseData(
      result: result ?? this.result,
      firstNum: firstNum ?? this.firstNum,
      secondNum: secondNum ?? this.secondNum
    );
  }

  @override
  bool operator == (Object other){
    return identical(this, other) ||
    other is baseData &&
    runtimeType == other.runtimeType &&
    result == other.result &&
    firstNum == other.firstNum &&
    secondNum == other.secondNum;
  }

  @override
  int get hashCode => result.hashCode ^ firstNum.hashCode ^ secondNum.hashCode;
}