import 'dart:io';
import 'package:flutter/material.dart';



class ProfileWidget extends StatelessWidget {
  final String? imagePath;//
  final File? imageFile;
  final VoidCallback onClicked;
  const ProfileWidget(
      {super.key, this.imagePath, this.imageFile, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(_getImageProvider()),
          Positioned(
              bottom: 25,
              right: 12,
              child: buildEditIcon(color)
          )
        ],
      ),
    );
  }
  ImageProvider _getImageProvider() {
    if (imagePath != null) {
      return NetworkImage(imagePath!);
    } else if (imageFile != null) {
      return FileImage(imageFile!);
    } else {
      return const AssetImage('assets/avatar.png'); // Fallback image
    }
  }


  Widget buildImage(ImageProvider image) {
    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }
  Widget buildEditIcon(Color color) => buildCircle(
    child: buildCircle(
        child: const Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
        ),
        all: 0,
        color: color
    ),
    all: 3,
    color: Colors.white,
  );
  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
