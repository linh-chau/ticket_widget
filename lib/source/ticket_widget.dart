import 'package:flutter/material.dart';
import 'package:ticket_widget_plus/ticket.dart';

class Ticket extends StatelessWidget {
  final double margin;
  final double borderRadius;
  final double clipRadius;
  final double smallClipRadius;
  final int numberOfSmallClips;
  final CardPosition cardPosition;
  final Color backgroundColor;
  final Widget child;
  final List<BoxShadow>? boxShadow;
  final double circlePosition;

  const Ticket({
    Key? key,
    this.margin = 20,
    this.borderRadius = 10,
    this.clipRadius = 10,
    this.smallClipRadius = 4,
    this.numberOfSmallClips = 10,
    this.cardPosition = CardPosition.horizontal,
    this.backgroundColor = Colors.blue,
    this.boxShadow,
    required this.child,
    this.circlePosition = 0.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final ticketWidth = screenSize.width - margin * 2;
    final ticketHeight = ticketWidth * 1.02;

    return Container(
      width: ticketWidth,
      height: ticketHeight,
      decoration: BoxDecoration(
        boxShadow: boxShadow ??
            [
              BoxShadow(
                offset: const Offset(0, 4),
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
      ),
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
          child: child,
        ),
      ),
    );
  }
}
