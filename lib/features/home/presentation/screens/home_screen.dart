import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:promolider_app/features/home/presentation/widgets/home_view.dart';
import 'package:promolider_app/features/home/presentation/widgets/saldo_view.dart';
import 'package:promolider_app/shared/widgets/widgets.dart';
import 'package:promolider_app/features/home/presentation/widgets/recomprar_view.dart';
import 'package:promolider_app/features/home/presentation/widgets/perfil_view.dart';
import 'package:promolider_app/features/home/presentation/widgets/pruebas_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName:
                  Text("Usuario X"), // Reemplaza con el nombre del usuario
              accountEmail: Text(
                  "Correo electrónico"), // Reemplaza con el correo del usuario
              currentAccountPicture: CircleAvatar(
                // Puedes cargar la imagen del usuario aquí
                backgroundImage: AssetImage('ruta/a/tu/imagen.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(TablerIcons.a_b),
              title: const Text('Editar Perfil'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: const Icon(TablerIcons.home),
              title: const Text('Red Binaria'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: const Icon(TablerIcons.inbox),
              title: const Text('Inbox'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: const Icon(TablerIcons.adjustments_check),
              title: const Text('Chats'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: const Icon(TablerIcons.user_check),
              title: const Text('Solicitudes'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: const Icon(TablerIcons.file_text),
              title: const Text('Reportes'),
              onTap: () {
                //
              },
            ),
            ListTile(
              leading: const Icon(TablerIcons.logout),
              title: const Text('Cerrar Sesión'),
              onTap: () {
                //
              },
            ),
          ],
        ),
      ),
      appBar: const CustomAppBar(),
      body: PageView(
        controller: _pageController,
        children: [
          HomeView(),
          SaldoView(),
          PerfilView(),
          RecomprarView(),
          CuentaPage()
        ],
        onPageChanged: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Saldo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Recomprar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pruebas',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}
