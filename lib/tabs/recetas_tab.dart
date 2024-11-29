import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertry/pages/detalles_page.dart';
import 'package:fluttertry/widgets/recetas_widget.dart';

class RecetasTab extends StatelessWidget {
  const RecetasTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Wallpaper.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Slidable(
            startActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => DetallesPage(),
                    );
                    Navigator.push(context, route);
                  },
                  label: 'Detalles',
                  icon: Icons.info,
                  backgroundColor: Color(0XFF59C9F1),
                  foregroundColor: Colors.white,
                )
              ],
            ),
            child: RecetasWidget(),
          ),
        ],
      ),
    );
  }
}
