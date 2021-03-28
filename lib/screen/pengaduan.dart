import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:pengaduan_masyarakat/screen/register_view.dart';
import 'package:pengaduan_masyarakat/screen/login_view.dart';
import 'package:image_picker/image_picker.dart';

class Pengaduan extends StatefulWidget {
  @override
  static const routeName = "/Pengaduan";
  _PengaduanState createState() => _PengaduanState();
}

class _PengaduanState extends State<Pengaduan> {
  File _image;
  Future getImageGallery() async{
    var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image= imageFile;
    });
  }
  TextEditingController txtPengaduan = TextEditingController();
  // TextEditingController txtPassword = TextEditingController();


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
          padding: EdgeInsets.all(20),
          child: Column(
            children: [

              TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Pengaduan",
                  labelText: "Pengaduan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                controller: txtPengaduan,
              ),
              Padding(padding: EdgeInsets.all(20),),
              Row(
                children: [
                  Center(
                    child: _image== null
                    ? Text("No Image Selected!")
                    : Image.file(_image)),
                  InkWell(
                    child: Icon(Icons.image),
                    onTap: getImageGallery,
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20),),
              Row(
                  children: [
                    Text("Kategori  ",
                      style: TextStyle(fontSize: 20,
                          color:Colors.blue),),
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
              ),

            ],
          ),
        )
    );
  }
}
