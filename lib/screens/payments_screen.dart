import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
           IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.filter, size: 18)),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          final isReceived = index % 2 == 0;
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: isReceived ? Colors.green.withOpacity(0.2) : Colors.red.withOpacity(0.2),
                  child: Icon(
                    isReceived ? FontAwesomeIcons.arrowDown : FontAwesomeIcons.arrowUp,
                    color: isReceived ? Colors.green : Colors.red,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isReceived ? 'Received from Jane Doe' : 'Sent to John Smith',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Jan ${20 - index}, 2026 • 10:30 AM',
                        style: const TextStyle(color: Colors.white38, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${isReceived ? '+' : '-'} KES ${(index + 1) * 500}.00',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isReceived ? Colors.green : Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('Success', style: TextStyle(color: Colors.green, fontSize: 10)),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
