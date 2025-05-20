import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive design',
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F6FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;

          if (constraints.maxWidth < 768) {
            crossAxisCount = 2;
          } else if (constraints.maxWidth <= 1024) {
            crossAxisCount = 3;
          } else {
            crossAxisCount = 4;
          }

          final List<String> flagUrls = [
            'https://flagcdn.com/w320/us.png',
            'https://flagcdn.com/w320/bd.png',
            'https://flagcdn.com/w320/in.png',
            'https://flagcdn.com/w320/jp.png',
            'https://flagcdn.com/w320/fr.png',
            'https://flagcdn.com/w320/de.png',
            'https://flagcdn.com/w320/it.png',
            'https://flagcdn.com/w320/gb.png',
            'https://flagcdn.com/w320/ca.png',
            'https://flagcdn.com/w320/au.png',
            'https://flagcdn.com/w320/sa.png',
            'https://flagcdn.com/w320/ae.png',
            'https://flagcdn.com/w320/ru.png',
            'https://flagcdn.com/w320/cn.png',
            'https://flagcdn.com/w320/es.png',
            'https://flagcdn.com/w320/mx.png',
            'https://flagcdn.com/w320/nz.png',
            'https://flagcdn.com/w320/br.png',
            'https://flagcdn.com/w320/ng.png',
            'https://flagcdn.com/w320/kr.png',
          ];

          final List<String> flagNames = [
            'United States',
            'Bangladesh',
            'India',
            'Japan',
            'France',
            'Germany',
            'Italy',
            'United Kingdom',
            'Canada',
            'Australia',
            'Saudi Arabia',
            'United Arab Emirates',
            'Russia',
            'China',
            'Spain',
            'Mexico',
            'New Zealand',
            'Brazil',
            'Nigeria',
            'South Korea',
          ];

          return GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 3 / 2,
            ),
            itemCount: flagUrls.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      flex: 6,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          flagUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              flagNames[index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(50, 30),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsPage(
                                        countryName: flagNames[index],
                                        flagUrl: flagUrls[index],
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "More",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final String countryName;
  final String flagUrl;

  const DetailsPage({
    super.key,
    required this.countryName,
    required this.flagUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(countryName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(flagUrl, width: 200),
            const SizedBox(height: 20),
            Text(
              "Welcome to $countryName!",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
