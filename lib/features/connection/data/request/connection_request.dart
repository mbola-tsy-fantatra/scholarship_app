import 'package:equatable/equatable.dart';

class ConnectionRequest extends Equatable{
  final String receiverId;

  const ConnectionRequest({required this.receiverId});

  factory ConnectionRequest.fromJson(Map<String,dynamic> json){
    return ConnectionRequest(receiverId: json['receiverId']);
  }

  Map<String,dynamic> toJson(){
    return {
      'receiverId':receiverId
  };
}

  @override
  List<Object?> get props => [receiverId];

}