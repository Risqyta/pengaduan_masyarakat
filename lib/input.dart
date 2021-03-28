import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:pengaduan_masyarakat/screen/register_view.dart';
import 'package:pengaduan_masyarakat/screen/login_view.dart';

class HomeState extends StatefulWidget {
  @override
  static const routeName = "/HomeState";
  _HomeStateState createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {

  List<String> kategori = ["Kerusakan", "Fasilitas Umum"];
  String _kategori = "Kerusakan";

  void pilihKategori(String value){
    setState(() {
      _kategori=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list),
        title: Text("Formulir"),
        backgroundColor: Colors.blueGrey,
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Kategori",
                labelText: "Kategori",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20),),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                hintText: "Pengaduan",
                labelText: "Pengaduan",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20),),

            Row(
              children: [
                Text("Kategori",
                style: TextStyle(fontSize: 25,
                color:Colors.black),),
                DropdownButton(
                  onChanged: (String value){
                    pilihKategori(value);
                  },
                  value: _kategori,
                  items: kategori.map((String value){
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ]
            )


          ],
        ),
      )
    );
  }
}
