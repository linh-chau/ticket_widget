import 'package:flutter/material.dart';
import 'package:ticket_widget/enum.dart';

class TicketClipper extends CustomClipper<Path> {
  static const double clipPadding = 18;

  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;
  final CardPosition cardPosition;

  const TicketClipper({
    required this.borderRadius,
    required this.clipRadius,
    required this.smallClipRadius,
    required this.numberOfSmallClips,
    required this.cardPosition,
  });

  RRect rect(Size size) {
    switch (cardPosition) {
      case CardPosition.horizontal:
        return RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        );
      case CardPosition.vertical:
        return RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        );
    }
  }

  List<Rect> circle(Size size) {
    final clipCenterY = size.height * 0.2 + clipRadius;
    final clipCenterX = size.width * 0.2 + clipRadius;
    switch (cardPosition) {
      case CardPosition.horizontal:
        return [
          Rect.fromCircle(
            center: Offset(0, clipCenterY),
            radius: clipRadius,
          ),
          Rect.fromCircle(
            center: Offset(size.width, clipCenterY),
            radius: clipRadius,
          )
        ];
      case CardPosition.vertical:
        return [
          Rect.fromCircle(
            center: Offset(clipCenterX, 0),
            radius: clipRadius,
          ),
          Rect.fromCircle(
            center: Offset(clipCenterX, size.height),
            radius: clipRadius,
          )
        ];
    }
  }

  List<Offset> _horizontalChip(Size size) {
    final clipCenterY = size.height * 0.2 + clipRadius;
    final clipContainerSize = size.width - clipRadius * 2 - clipPadding * 2;
    final smallClipSize = smallClipRadius * 2;
    final smallClipBoxSize = clipContainerSize / numberOfSmallClips;
    final smallClipPadding = (smallClipBoxSize - smallClipSize) / 2;
    final smallClipStart = clipRadius + clipPadding;

    return List.generate(numberOfSmallClips, (index) {
      final boxX = smallClipStart + smallClipBoxSize * index;
      final centerX = boxX + smallClipPadding + smallClipRadius;

      return Offset(centerX, clipCenterY);
    });
  }

  List<Offset> _verticalChip(Size size) {
    final clipCenterX = size.width * 0.2 + clipRadius;
    final clipContainerSize = size.height - clipRadius * 2 - clipPadding * 2;
    final smallClipSize = smallClipRadius * 2;
    final smallClipBoxSize = clipContainerSize / numberOfSmallClips;
    final smallClipPadding = (smallClipBoxSize - smallClipSize) / 2;
    final smallClipStart = clipRadius + clipPadding;

    return List.generate(numberOfSmallClips, (index) {
      final boxY = smallClipStart + smallClipBoxSize * index;
      final centerY = boxY + smallClipPadding + smallClipRadius;

      return Offset(clipCenterX, centerY);
    });
  }

  List<Offset> _getsmallChip(Size size) {
    switch (cardPosition) {
      case CardPosition.horizontal:
        return _horizontalChip(size);
      case CardPosition.vertical:
        return _verticalChip(size);
    }
  }

  @override
  Path getClip(Size size) {
    var path = Path();

    // draw rect vertical
    path.addRRect(rect(size));

    final clipPath = Path();

    // circle on the left
    clipPath.addOval(circle(size).first);
    // circle on the right
    clipPath.addOval(circle(size).last);

    // draw small clip circles
    var smallClipCenterOffsets = _getsmallChip(size);
    for (var centerOffset in smallClipCenterOffsets) {
      clipPath.addOval(Rect.fromCircle(
        center: centerOffset,
        radius: smallClipRadius,
      ));
    }

    // combine two path together
    final ticketPath = Path.combine(
      PathOperation.reverseDifference,
      clipPath,
      path,
    );

    return ticketPath;
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) =>
      oldClipper.borderRadius != borderRadius ||
      oldClipper.clipRadius != clipRadius ||
      oldClipper.smallClipRadius != smallClipRadius ||
      oldClipper.numberOfSmallClips != numberOfSmallClips;
}
