import 'package:flutter/material.dart';
import '../../../../Core/utils/layout.dart';
import '../../../../Core/widgets/custom_app_bar.dart';
import '../../../../Core/widgets/custom_tab_bar.dart';
import 'widgets/custom_notification_tab.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final List<NotificationItem> allNotifications = [
    NotificationItem(
      title:
          'Dear customer, We attempt to deliver your item at 4:45 pm on Monday 24th August 2025.',
      description:
          'Please contact 774073842 to arrange new delivery, thanks.ShipStream Team',
    ),
    NotificationItem(
      title:
          'Dear customer, We attempt to deliver your Shipment with Tracking Number 754322654.',
      description:
          'Please contact 774073842 to arrange new delivery.\nShipStream Team',
    ),
    NotificationItem(
      title: 'Dear Customer, Your Shipment 754322654 is now with Courier.',
      description:
          'Please keep your phone available for calls to receive it.\nShipStream Team',
    ),
  ];

  final List<NotificationItem> importantNotifications = [
    NotificationItem(
      title: 'Important: Shipment Delayed',
      description: 'We have encountered a delay due to weather conditions.',
    ),
  ];

  final List<NotificationItem> commercialNotifications = [
    NotificationItem(
      title: 'Special Offer!',
      description: 'Get 10% off your next shipment. Contact us for more info.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(146),
          child: Column(
            children: [
              CustomAppBar(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Layout();
                  }));
                },
                title: 'Notifications',
              ),
              CustomTabBar(
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Important"),
                  Tab(text: "Commercial"),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CustomNotificationTab(
              notifications: allNotifications,
            ),
            CustomNotificationTab(
              notifications: importantNotifications,
            ),
            CustomNotificationTab(
              notifications: commercialNotifications,
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;

  NotificationItem({
    required this.title,
    required this.description,
  });
}
