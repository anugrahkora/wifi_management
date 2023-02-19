import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiInfoViewScreen extends StatelessWidget {
  const WifiInfoViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wifi List'),
      ),
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FutureBuilder(
              future: WiFiScan.instance.getScannedResults(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                      tileColor: Colors.white,
                      style: ListTileStyle.list,
                      leading: CircleAvatar(
                        
                          backgroundColor:
                              const Color.fromARGB(255, 247, 247, 247),
                          child: Text((index + 1).toString(),),),
                      title: Text(snapshot.data![index].ssid),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data![index].bssid),
                        ],
                      ),
                    ),
                  );
                }
                return const CircularProgressIndicator();
              }),
        ],
      )),
    );
  }
}
