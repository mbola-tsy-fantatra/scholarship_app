String substractString(int start,int max,  String input) {
    if(input.length  < max){
      return input;
    }
    return '${input.substring(start, max)}...';
  }
