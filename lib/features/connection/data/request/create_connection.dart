import 'package:equatable/equatable.dart';

class CreateConnection extends Equatable{
  final String receiverId;

  const CreateConnection({required this.receiverId});

  factory CreateConnection.fromJson(Map<String,dynamic> json){
    return CreateConnection(receiverId: json['receiverId']);
  }

  Map<String,dynamic> toJson(){
    return {
      'receiverId':receiverId
  };
}

  @override
  List<Object?> get props => [receiverId];

}