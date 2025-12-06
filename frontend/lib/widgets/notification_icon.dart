import 'package:flutter/material.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({super.key});

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  int notificationCount = 3;

  void _openNotificationPanel() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Bildirimler'),
        content: const Text('Burada tüm bildirimler gösterilecek.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Kapat'),
          ),
        ],
      ),
    );

    setState(() {
      notificationCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openNotificationPanel,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.notifications,
              size: 28,
              color: Colors.black,
            ),
          ),
          if (notificationCount > 0)
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
