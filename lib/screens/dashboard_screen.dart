import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Hello, John',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    'Welcome back',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white54,
                        ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.white10,
                radius: 25,
                child: IconButton(
                  icon: const Icon(FontAwesomeIcons.solidBell, size: 20, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Balance Card (Optional flair)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6200EE), Color(0xFFBB86FC)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF6200EE).withOpacity(0.4),
                  blurRadius: 15,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Wallet Balance',
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 10),
                const Text(
                  'KES 145,200.00',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBalanceAction(context, FontAwesomeIcons.plus, 'Top Up'),
                    _buildBalanceAction(context, FontAwesomeIcons.arrowDown, 'Withdraw'),
                    _buildBalanceAction(context, FontAwesomeIcons.qrcode, 'Scan'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Quick Send
          const Text(
            'Quick Send',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.primaries[index % Colors.primaries.length],
                        child: Text(
                          String.fromCharCode(65 + index),
                           style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('User ${index + 1}', style: const TextStyle(color: Colors.white70)),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Conversion Rates
          const Text(
            'Conversion Rates',
             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Container(
             padding: const EdgeInsets.all(20),
             decoration: BoxDecoration(
               color: const Color(0xFF1E1E1E),
               borderRadius: BorderRadius.circular(20),
               border: Border.all(color: Colors.white10),
             ),
             child: Column(
               children: [
                 _buildRateRow('USD', 'KES', '129.50', Colors.green),
                 const Divider(color: Colors.white10, height: 30),
                 _buildRateRow('GBP', 'KES', '164.20', Colors.green),
                 const Divider(color: Colors.white10, height: 30),
                 _buildRateRow('EUR', 'KES', '140.10', Colors.red),
               ],
             ),
          ),
           const SizedBox(height: 30),
           
           // Center Send Button Area
           Center(
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(50),
                 boxShadow: [
                   BoxShadow(
                     color: const Color(0xFF03DAC6).withOpacity(0.3),
                     blurRadius: 20,
                     spreadRadius: 5,
                   ),
                 ],
               ),
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFF03DAC6),
                   foregroundColor: Colors.black,
                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(30),
                   ),
                 ),
                 child: const Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Icon(FontAwesomeIcons.paperPlane),
                     SizedBox(width: 10),
                     Text('SEND MONEY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                   ],
                 ),
               ),
             ),
           ),
        ],
      ),
    );
  }

  Widget _buildBalanceAction(BuildContext context, IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  Widget _buildRateRow(String from, String to, String rate, Color trendColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
           children: [
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
               decoration: BoxDecoration(
                 color: Colors.white10,
                 borderRadius: BorderRadius.circular(8),
               ),
               child: Text(from, style: const TextStyle(fontWeight: FontWeight.bold)),
             ),
             const SizedBox(width: 10),
             const Icon(Icons.arrow_forward, size: 16, color: Colors.white54),
             const SizedBox(width: 10),
             Text(to, style: const TextStyle(fontWeight: FontWeight.bold)),
           ],
        ),
        Row(
          children: [
            Text(rate, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(width: 8),
            Icon(
              trendColor == Colors.green ? FontAwesomeIcons.arrowTrendUp : FontAwesomeIcons.arrowTrendDown,
              color: trendColor,
              size: 14,
            ),
          ],
        ),
      ],
    );
  }
}
