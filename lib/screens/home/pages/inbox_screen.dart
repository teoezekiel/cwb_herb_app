import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final List<Map<String, String>> events = [
    {
      'image': 'assets/images/plant_event_1.jpg',
      'title': 'Event Name 1',
      'description': 'Lorem ipsum dolor sit amet consectetur.',
      'date': '12.8.2024 (Monday)', // Date field
      'time': '11:17 AM', // Time field
    },
    {
      'image': 'assets/images/plant_event_2.jpg',
      'title': 'Event Name 2',
      'description': 'Lorem ipsum dolor sit amet consectetur.',
      'date': '12.8.2024 (Monday)', // Date field
      'time': '11:17 AM', // Time field
    },
    {
      'image': 'assets/images/plant_event_3.jpg',
      'title': 'Event Name 3',
      'description': 'Lorem ipsum dolor sit amet consectetur.',
      'date': '12.8.2024 (Monday)', // Date field
      'time': '11:17 AM', // Time field
    },
    {
      'image': 'assets/images/plant_event_4.jpg',
      'title': 'Event Name 4',
      'description': 'Lorem ipsum dolor sit amet consectetur.',
      'date': '12.8.2024 (Monday)', // Date field
      'time': '11:17 AM', // Time field
    },
    // Add more events here
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.04; // Responsive padding
    final imageSize = screenWidth * 0.15; // Responsive image size

    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        title: const Text("Inbox",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: padding / 2, horizontal: padding),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventInfoScreen(
                      eventName: event['title']!,
                      eventDescription: event['description']!,
                      eventImage: event['image']!,
                      eventDate: event['date']!, // Pass the date
                      eventTime: event['time']!, // Pass the time
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      event['image']!,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    event['title']!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.045, // Responsive font size
                    ),
                  ),
                  subtitle: Text(
                    event['description']!,
                    style: TextStyle(fontSize: screenWidth * 0.035, color: Colors.grey,), // Responsive font size
                  ),
                  trailing: Text(
                    event['time']!, // Display only the time
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035, // Responsive font size
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class EventInfoScreen extends StatelessWidget {
  final String eventName;
  final String eventDescription;
  final String eventImage;
  final String eventDate;  // Parameter for event date
  final String eventTime;  // Parameter for event time

  const EventInfoScreen({
    Key? key,
    required this.eventName,
    required this.eventDescription,
    required this.eventImage,
    required this.eventDate,
    required this.eventTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final padding = screenWidth * 0.05;

    return Scaffold(
      backgroundColor: const Color(0xffacd4b2),
      appBar: AppBar(
        backgroundColor: const Color(0xffacd4b2),
        title: Text(
          eventName,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 0),
              Text(
                eventDate,  // Display only the date
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: screenWidth * 0.045, // Responsive font size
                ),
              ),
              const SizedBox(height: 8),
              Text(
                eventDescription,
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  height: 1.5, // Line height
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  eventImage,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.9, // 90% of screen width
                  height: MediaQuery.of(context).size.height * 0.3, // 30% of screen height
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Pellentesque suscipit fermentum velit, vel vehicula odio ultricies et.Pellentesque suscipit fermentum velit, vel vehicula odio ultricies et.Pellentesque suscipit fermentum velit, vel vehicula odio ultricies et.',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  height: 1.5, // Line height
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Additional Event Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.05, // Responsive font size
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Pellentesque suscipit fermentum velit, vel vehicula odio ultricies et.',
                style: TextStyle(
                  fontSize: screenWidth * 0.045, // Responsive font size
                  height: 1.5, // Line height
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Handle add to cart action
                        },
                        icon: Icon(Icons.note_add_outlined),
                        label: Text('Register Here'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 12),
                          textStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: InboxScreen(),
  ));
}
