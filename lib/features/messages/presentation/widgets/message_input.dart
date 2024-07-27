
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:scholariship/features/messages/repositories/message_repositiory.dart';

class MessageInput extends StatefulWidget {
  final void Function() scrollToBottom;

  const MessageInput({Key? key, required this.scrollToBottom}) : super(key: key);

  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImage;
    });
  }

  Future<void> _sendMessage() async {
    final messageRepository = Provider.of<MessageRepository>(context, listen: false);
    final content = _messageController.text.trim();
    final image = _pickedImage;

    if (content.isEmpty && image == null) return;

    String? base64Image;
    String? imageName;

    if (image != null) {
      final imageBytes = await File(image.path).readAsBytes();
      base64Image = base64Encode(imageBytes);
      imageName = image.name;
    }

    final participants = messageRepository.conversation.participants;
    final receiverId = messageRepository.userId == participants.participantA.id
        ? participants.participantB.id
        : participants.participantA.id;

    messageRepository.sendMessage('chat:message:send', {
      'conversationId': messageRepository.conversation.id,
      'content': content,
      'receiverId': receiverId,
      'file': base64Image,
      'fileName': imageName,
      'fileSize': 2,
    });

    _messageController.clear();
    _pickedImage = null;
    setState(() {});
    widget.scrollToBottom();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          if (_pickedImage != null) // Display the image if selected
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: FileImage(File(_pickedImage!.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: const Icon(Icons.clear, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        _pickedImage = null;
                      });
                    },
                  ),
                ),
              ],
            ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.image),
                onPressed: _pickImage,
              ),
              Expanded(
                child: TextField(
                  controller: _messageController,
                  decoration: const InputDecoration(
                    hintText: 'Enter a message',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _sendMessage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}