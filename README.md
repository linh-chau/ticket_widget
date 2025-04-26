# ticket_widget_plus
<a href="https://pub.dev/packages/pull_to_refresh">
  <img src="https://img.shields.io/pub/v/pull_to_refresh.svg"/>
</a>
<a href="https://flutter.dev/">
  <img src="https://img.shields.io/badge/flutter-%3E%3D%202.0.0-green.svg"/>
</a>
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg"/>
</a>

## Intro

A simple Flutter package that helps you create customizable ticket-style widgets with smooth edges, cutout effects, or torn designs — perfect for movie tickets, boarding passes, vouchers, and more.
Features include:

Customizable border shapes (straight, rounded, torn)

Flexible hole positions and styles

Background color, shadow, and border customization

Fully flexible child widget support

Supports both vertical and horizontal layouts, making it easy to integrate into event, ticketing, or loyalty applications.

## Usage

Installing

```yaml

   dependencies:

    ticket_widget_plus: ^1.0.0


```

Import

```dart

    import 'package:ticket_widget_plus/ticket.dart';

```

🎮 How To Use 

Horizontal Card

![Screenshot_20250426_135202](https://github.com/user-attachments/assets/a961ff7c-68a1-4518-abe7-4bb73ef83fca)

```dart

 Ticket(
              cardPosition: CardPosition.horizontal,
              backgroundColor: Colors.white,
              smallClipRadius: 1,
              numberOfSmallClips: 40,
              circlePosition: 0.2,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Image.asset(
                          'image/ic_logo.png',
                          height: 40,
                          width: 40,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Vietnam Airlines",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Spacer(),
                        const Text(
                          '\$1880',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                          crossAxisSpacing: 50,
                        ),
                        children: [
                          _content('Passengers', 'David Hoang'),
                          _content('Flight', '22213383'),
                          _content('Date', '10-05-2025'),
                          _content('Gate', '2A'),
                          _content('Seat', '3C'),
                          _content('Class', 'Business'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'image/barcode.jpeg',
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

```
Easy to switch between vertical and horizontal layouts by setting cardPosition: CardPosition.horizontal

![Screenshot_20250426_140321](https://github.com/user-attachments/assets/9f67e5f2-9646-4fe2-b282-988f02710bad)


