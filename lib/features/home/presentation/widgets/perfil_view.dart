import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: PerfilView(),
  ));
}

Future<Map<String, dynamic>> fetchData() async {
  final response = await http.post(
    Uri.parse('https://crm.promolider.org/api/v1/auth/login'),
    body: {"username": "admin", "password": "secret"},
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data['data']['user'];
  } else {
    throw Exception('Failed to load data');
  }
}

class PerfilView extends StatefulWidget {
  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  bool _showAccountForm = false;
  bool _showSecurityForm = false;
  bool _showShareLinkForm = false;
  bool _showMembershipsForm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AJUSTES DE PERFIL'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenido del perfil
            FutureBuilder<Map<String, dynamic>>(
              future: fetchData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final Map<String, dynamic> data = snapshot.data!;
                  final String name = data['name'] ?? 'Nombre no disponible';
                  final String email = data['email'] ?? 'Email no disponible';
                  final String statusUser =
                      data['status_user'] ?? 'Estado del usuario no disponible';
                  final String role = data['role'] ?? 'Rol no disponible';
                  final String nroDocument = data['nro_document'] ??
                      'Número de documento no disponible';
                  final String phone =
                      data['phone'] ?? 'Teléfono no disponible';

                  return Container(
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/user_avatar.jpg'),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nombre del Usuario',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                const SizedBox(height: 10),
                                _buildRoleChip(role),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _buildDetailRow('Usuario', name),
                        _buildDetailRow('Correo', email),
                        _buildDetailRow('Estado', statusUser),
                        _buildDetailRow('Rol', role),
                        _buildDetailRow('Número de documento', nroDocument),
                        _buildDetailRow('Número de contacto', phone),
                      ],
                    ),
                  );
                }
              },
            ),
            // Barra de botones
            ElevatedButton(
              onPressed: () {
                _showForm(_showAccountForm, 'Cuenta');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text('Cuenta'),
            ),
            if (_showAccountForm) _buildAccountForm(),
            ElevatedButton(
              onPressed: () {
                _showForm(_showSecurityForm, 'Seguridad');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text('Seguridad'),
            ),
            if (_showSecurityForm) _buildSecurityForm(),
            ElevatedButton(
              onPressed: () {
                _showForm(_showShareLinkForm, 'Compartir enlace');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text('Compartir enlace'),
            ),
            if (_showShareLinkForm) _buildShareLinkForm(),
            ElevatedButton(
              onPressed: () {
                _showForm(_showMembershipsForm, 'Membresias');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text('Membresias'),
            ),
            if (_showMembershipsForm) _buildMembershipsForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleChip(String role) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(role, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAccountForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          Text('Formulario para Cuenta'),
          // Implementa los campos del formulario para cuenta aquí
        ],
      ),
    );
  }

  Widget _buildSecurityForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          Text('Formulario para Seguridad'),
          // Implementa los campos del formulario para seguridad aquí
        ],
      ),
    );
  }

  Widget _buildShareLinkForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          Text('Formulario para Compartir enlace'),
          // Implementa los campos del formulario para compartir enlace aquí
        ],
      ),
    );
  }

  Widget _buildMembershipsForm() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        border: Border.all(color: Colors.green),
      ),
      child: Column(
        children: [
          Text('Formulario para Membresías'),
          // Implementa los campos del formulario para membresías aquí
        ],
      ),
    );
  }

  void _showForm(bool formState, String formType) {
    setState(() {
      switch (formType) {
        case 'Cuenta':
          _showAccountForm = !formState;
          _showSecurityForm = false;
          _showShareLinkForm = false;
          _showMembershipsForm = false;
          break;
        case 'Seguridad':
          _showAccountForm = false;
          _showSecurityForm = !formState;
          _showShareLinkForm = false;
          _showMembershipsForm = false;
          break;
        case 'Compartir enlace':
          _showAccountForm = false;
          _showSecurityForm = false;
          _showShareLinkForm = !formState;
          _showMembershipsForm = false;
          break;
        case 'Membresias':
          _showAccountForm = false;
          _showSecurityForm = false;
          _showShareLinkForm = false;
          _showMembershipsForm = !formState;
          break;
      }
    });
  }
}
