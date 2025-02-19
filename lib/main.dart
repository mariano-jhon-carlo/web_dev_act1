import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CupertinoApp(
    debugShowCheckedModeBanner: false,
    home: BSCS(),
  ));
}

class BSCS extends StatefulWidget {
  const BSCS({super.key});

  @override
  State<BSCS> createState() => _BSCSState();
}

class _BSCSState extends State<BSCS> {
  final List<Map<String, String>> members = [
    {
      "name": "Janzen S. Decano",
      "email": "janzen.decano@gmail.com",
      "phone": "09368977470",
      "address": "Sta. Maria, Sta. Ana, Pampanga",
      "image": "images/janzen1.jpg"
    },
    {
      "name": "Aero Kenn G. Dela Pena",
      "email": "aerogulapa1423@gmail.com",
      "phone": "09916846532",
      "address": "Talipapa, Pasig, Candaba, Pampanga",
      "image": "images/aero1.jpg"
    },
    {
      "name": "Riane E. Gamboa",
      "email": "rianegamboa441@gmail.com",
      "phone": "09274520404",
      "address": "Sta. Lucia, Sta. Ana, Pampanga",
      "image": "images/riane.jpg"
    },
    {
      "name": "Maricar M. Mangulabnan",
      "email": "maricarmangulabnan@gmail.com",
      "phone": "09618250626",
      "address": "Dulong Ilog, Candaba, Pampanga",
      "image": "images/maricar.jpg"
    },
    {
      "name": "Jhon Carlo R. Mariano",
      "email": "jhon.mariano@email.com",
      "phone": "09518303294",
      "address": "Bahay Pari, Candaba, Pampanga",
      "image": "images/jhon.jpg"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Informations'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: Icon(CupertinoIcons.settings, size: 20, color: CupertinoColors.destructiveRed),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('List Of Members'),
                  content: Container(
                    width: double.maxFinite,
                    height: 200,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      itemCount: members.length,
                      itemBuilder: (context, index) {
                        var member = members[index];
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipOval(
                              child: Image.asset(
                                member["image"]!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(member['name']!, textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
                          ],
                        );
                      },
                    ),
                  ),
                  actions: [
                    CupertinoButton(
                      child: Text('Close', style: TextStyle(color: CupertinoColors.destructiveRed)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: members.map((member) => memberCard(member)).toList(),
          ),
        ),
      ),
    );
  }

  Widget memberCard(Map<String, String> member) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipOval(
                child: Image.asset(
                  member["image"]!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      member["name"]!,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Email: ${member["email"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Phone: ${member["phone"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      "Address: ${member["address"]}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: CupertinoColors.inactiveGray,
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }
}
