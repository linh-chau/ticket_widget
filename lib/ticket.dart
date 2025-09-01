/// Ticket Widget Plus
///
/// A Flutter library for creating customizable **ticket-style widgets**
/// with smooth edges, cutout effects, or torn designs.
///
/// Exported members:
/// - [Ticket] : The main ticket widget
/// - [TicketClipper] : Custom clipper for ticket shapes
/// - [CardType] : Enum for ticket content types
/// - [CardPosition] : Enum for ticket orientation
library ticket;

export 'source/ticket_widget.dart';
export 'source/clipper.dart';

/// Defines the content type of a ticket.
/// (Reserved for future use, e.g. image-based tickets.)
enum CardType {
  /// Ticket displays an image as background or main content.
  image,
}

/// Defines the orientation of the ticket.
enum CardPosition {
  /// Ticket with cutouts on the left and right edges.
  horizontal,

  /// Ticket with cutouts on the top and bottom edges.
  vertical,
}
