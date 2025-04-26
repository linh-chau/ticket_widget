import 'package:flutter/material.dart';
import 'package:ticket_widget_plus/ticket.dart';

class Ticket extends StatelessWidget {
  final EdgeInsets padding;
  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;
  final CardPosition cardPosition;
  final Color backgroundColor;
  final Widget child;
  final List<BoxShadow>? boxShadow;
  final double circlePosition;
  final double ticketWidth;
  final double ticketHeight;

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
