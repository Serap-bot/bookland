import 'package:flutter/material.dart';

Widget menuIconSayfasi(String page) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -3),
              color: Colors.black.withOpacity(0.25),
              blurRadius: 10)
        ],
        color: Colors.white,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          menuIcon(
              iconData: Icons.sensor_door_outlined, active: page == "giris"),
          menuIcon(iconData: Icons.list, active: page == "liste"),
          menuIcon(
              iconData: Icons.featured_play_list_outlined,
              active: page == "detay"),
          menuIcon(iconData: Icons.label, active: page == "etiket")
        ],
      ),
    ),
  );
}

Widget menuIcon({@required IconData iconData, @required bool active}) {
  return Icon(
    iconData,
    size: 20,
    color: Color(active ? (0xFF3E2723) : (0xFFA1887F)),
  );
}
