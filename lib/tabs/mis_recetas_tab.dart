import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertry/pages/detalles_page.dart';
import 'package:fluttertry/widgets/recetas_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MisRecetasTab extends StatelessWidget {
  const MisRecetasTab({super.key});

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
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  label: 'Editar',
                  icon: MdiIcons.pencil,
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                SlidableAction(
                  onPressed: (BuildContext context) {},
                  label: 'Borrar',
                  icon: MdiIcons.trashCan,
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
              ],
            ),
            child: RecetasWidget(),
          ),
        ],
      ),
    );
  }
}
