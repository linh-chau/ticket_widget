import 'package:flutter/material.dart';
import 'package:ticket_widget_plus/ticket.dart';

/// A [CustomClipper] that creates a **ticket-style shape**.
///
/// Supports both vertical and horizontal layouts with:
/// - Rounded or straight borders
/// - Large circular cutouts (sides/top/bottom)
/// - Optional small "torn" holes for a perforated effect
///
/// Typically used together with [ClipPath] to create
/// widgets resembling tickets, boarding passes, or vouchers.
class TicketClipper extends CustomClipper<Path> {
  /// Padding from the edge before small clips start.
  static const double clipPadding = 18;

  /// The corner radius of the main ticket rectangle.
  final double borderRadius;

  /// The radius of the main circular cutouts
  /// (sides for horizontal, top/bottom for vertical).
  final double clipRadius;

  /// The radius of the small perforated circles.
  final double smallClipRadius;

  /// The total number of small perforated circles to draw.
  final int numberOfSmallClips;

  /// Defines the layout orientation of the ticket
  /// ([CardPosition.horizontal] or [CardPosition.vertical]).
  final CardPosition cardPosition;

  /// Position (0–1) along the width/height where the main circle is drawn.
  final double circlePosition;

  /// Creates a new [TicketClipper] with the given configuration.
  const TicketClipper({
    required this.borderRadius,
    required this.clipRadius,
    required this.smallClipRadius,
    required this.numberOfSmallClips,
    required this.cardPosition,
    required this.circlePosition,
  });

  /// Returns a rounded rectangle that represents the base shape of the ticket.
  RRect rect(Size size) {
    return RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(borderRadius),
    );
  }

  /// Returns the two large circular cutouts (either left/right or top/bottom).
  List<Rect> circle(Size size) {
    final clipCenterY = size.height * circlePosition + clipRadius;
    final clipCenterX = size.width * circlePosition + clipRadius;

    switch (cardPosition) {
      case CardPosition.horizontal:
        return [
          Rect.fromCircle(center: Offset(0, clipCenterY), radius: clipRadius),
          Rect.fromCircle(
              center: Offset(size.width, clipCenterY), radius: clipRadius),
        ];
      case CardPosition.vertical:
        return [
          Rect.fromCircle(center: Offset(clipCenterX, 0), radius: clipRadius),
          Rect.fromCircle(
              center: Offset(clipCenterX, size.height), radius: clipRadius),
        ];
    }
  }

  /// Calculates small perforated holes for a **horizontal ticket**.
  List<Offset> _horizontalChip(Size size) {
    final clipCenterY = size.height * circlePosition + clipRadius;
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

  /// Calculates small perforated holes for a **vertical ticket**.
  List<Offset> _verticalChip(Size size) {
    final clipCenterX = size.width * circlePosition + clipRadius;
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

  /// Returns the perforated holes depending on [cardPosition].
  List<Offset> _getSmallChip(Size size) {
    switch (cardPosition) {
      case CardPosition.horizontal:
        return _horizontalChip(size);
      case CardPosition.vertical:
        return _verticalChip(size);
    }
  }

  /// Builds the final ticket path by combining
  /// the base rectangle, large circles, and small perforations.
  @override
  Path getClip(Size size) {
    var path = Path()..addRRect(rect(size));

    final clipPath = Path()
      ..addOval(circle(size).first)
      ..addOval(circle(size).last);

    // Add small perforated holes
    for (var centerOffset in _getSmallChip(size)) {
      clipPath.addOval(
          Rect.fromCircle(center: centerOffset, radius: smallClipRadius));
    }

    return Path.combine(PathOperation.reverseDifference, clipPath, path);
  }

  @override
  bool shouldReclip(TicketClipper oldClipper) => true;
}
