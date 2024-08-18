import 'package:flutter/material.dart';

class PostImageGrid extends StatelessWidget {
  final List<String> imagePaths;

  const PostImageGrid({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: _buildImageGrid(),
    );
  }

  Widget _buildImageGrid() {
    if (imagePaths.length == 1) {
      return _buildSingleImage();
    } else if (imagePaths.length == 2) {
      return _buildTwoImages();
    } else {
      return _buildMultipleImages();
    }
  }

  Widget _buildSingleImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePaths[0],
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTwoImages() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePaths[0],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePaths[1],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMultipleImages() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePaths[0],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      imagePaths[1],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _buildRemainingImages(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRemainingImages() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePaths[2],
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        if (imagePaths.length > 3)
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.black54, // Dark overlay
              child: Center(
                child: Text(
                  '+${imagePaths.length - 3}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
