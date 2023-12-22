import 'package:flutter/material.dart';

class ReUseDrawer extends StatelessWidget {
  const ReUseDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: GestureDetector(
              onTap: (){},
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpg"),
                backgroundColor: Colors.grey,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.pink,
            ),
            accountName: Text("Hassan"),
            accountEmail: Text("hassan@gmail.com"),
          ),

          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Home Page"),
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(
                Icons.person,
                color: Colors.red,
              ),
            ),
          ),InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("My Orders"),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.red,
              ),
            ),
          ),InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Categories"),
              leading: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Favorites"),
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
          Divider(
            thickness: 1,
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("Settings"),
              leading: Icon(Icons.settings),
            ),
          ),
          InkWell(
            onTap: (){},
            child: ListTile(
              title: Text("About"),
              leading: Icon(
                Icons.help,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
