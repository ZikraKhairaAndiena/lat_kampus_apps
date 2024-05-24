import 'package:flutter/material.dart';
import 'package:lat_kampus_apps/screen_page/page_maps.dart';
import '../Model/model_kampus.dart';

class KampusDetail extends StatelessWidget {
  final Datum kampus;

  KampusDetail({required this.kampus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kampus.namaKampus),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'http://192.168.100.110/latihan kampus apps/gambar/${kampus.gambarKampus}',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
              kampus.namaKampus,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              kampus.lokasiKampus,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8.0),
            Text(
              kampus.profileKampus,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapsPage(
                        latitude: double.parse(kampus.latKampus),
                        longitude: double.parse(kampus.longKampus),
                        namaKampus: kampus.namaKampus,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.map),
                label: Text('Lihat di Peta'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}