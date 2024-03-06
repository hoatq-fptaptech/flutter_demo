
import 'package:flutter/material.dart';

class SearchBox extends StatefulWidget{
  const SearchBox({Key? key}) : super(key: key);

  _SearchBoxState createState()=> _SearchBoxState();
}
class _SearchBoxState extends State<SearchBox>{
  @override
  Widget build(BuildContext context){
    return Padding(
        padding: EdgeInsets.only(left: 10,top: 20,bottom: 50, right: 10),
        child: SearchBar(
          hintText: "Search",
          hintStyle: MaterialStateProperty.all(
              const TextStyle(
                  color: Colors.grey
              )),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          surfaceTintColor: MaterialStateProperty.all(Colors.white),
          leading: Icon(Icons.search),
          shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          )),
          textStyle: MaterialStateProperty.all(
              const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18
              )
          ),
        ),
    );
  }
}