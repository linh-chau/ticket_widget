import 'package:flutter/material.dart';
import 'package:ticket_widget_plus/ticket.dart';

/// A customizable **ticket-style widget** that supports
/// rounded corners, cutout effects, shadows, and child content.
///
/// Typically used for event tickets, vouchers, or boarding passes.
/// You can control the orientation ([CardPosition.horizontal] or
/// [CardPosition.vertical]), background color, shadows, and more.
class Ticket extends StatelessWidget {
  /// Inner padding for the ticket content.
  final EdgeInsets padding;

  /// The corner radius of the ticket shape.
  final double borderRadius;

  /// The radius of the large circular cutouts.
  final double clipRadius;

  /// The radius of the small perforated circles.
  final double smallClipRadius;

  /// The total number of small perforated circles to draw.
  final int numberOfSmallClips;

  /// Ticket orientation: horizontal or vertical.
  final CardPosition cardPosition;

  /// Background color of the ticket.
  final Color backgroundColor;

  /// The widget to render inside the ticket.
  final Widget child;

  /// Optional shadows for the ticket.
  final List<BoxShadow>? boxShadow;

  /// Position (0–1) along the width/height where
  /// the large circle cutouts are drawn.
  final double circlePosition;

  /// The overall width of the ticket.
  final double ticketWidth;

  /// The overall height of the ticket.
  final double ticketHeight;

  /// Creates a new [Ticket] widget with customizable styling.
  const Ticket({
    Key? key,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.borderRadius = 10,
    this.clipRadius = 10,
    this.smallClipRadius = 4,
    this.numberOfSmallClips = 10,
    this.cardPosition = CardPosition.horizontal,
    this.backgroundColor = Colors.blue,
    this.boxShadow,
    this.ticketWidth = 350,
    this.ticketHeight = 500,
    required this.child,
    this.circlePosition = 0.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ticketWidth,
      height: ticketHeight,
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: ClipPath(
        clipper: TicketClipper(
          circlePosition: circlePosition,
          borderRadius: borderRadius,
          clipRadius: clipRadius,
          smallClipRadius: smallClipRadius,
          numberOfSmallClips: numberOfSmallClips,
          cardPosition: cardPosition,
        ),
        child: Container(
          color: backgroundColor,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
