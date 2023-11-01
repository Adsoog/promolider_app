import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CuentaPage extends StatefulWidget {
  @override
  _CuentaPageState createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _biographyController = TextEditingController();
  final TextEditingController _dateBirthController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  Future<void> _updateUserProfile() async {
    final String apiUrl = 'https://crm.promolider.org/api/v1/user/update-user';
    final String accessToken =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOGNlODI3MmUyMjFlMWUxYjU5YjczY2NlYjk0Mzk4ZWFkYzlhZTYzY2NjYzAzYzg5NTA1YWQ5MTRhMzYxYjkxNDZlZmRhMTYwMzYyM2YwYmIiLCJpYXQiOjE2OTg4NDg5MzYuODMzNDUxOTg2MzEyODY2MjEwOTM3NSwibmJmIjoxNjk4ODQ4OTM2LjgzMzQ1NTA4NTc1NDM5NDUzMTI1LCJleHAiOjE3MzA0NzEzMzYuODMxNDQwOTI1NTk4MTQ0NTMxMjUsInN1YiI6IjEiLCJzY29wZXMiOltdfQ.bdx3ZYCRsrcqWCOPNfQrcQs4FHrcp_ThODAPqKUhVb-Es5Z-rBPD8WVZ6_Wco9TkoplBm-50uvnnLGa-8gaqBAeM3IPqkC2jf5fVxmkSamanyKVy28lGzt7qvfG-IxFy6WIqdBPT-k8zbMoPvJv1CqluHTL4v9f1nYNrIdR4DQHLBS9EXNaF66HHLZT9eGivWxFgK1djU_GQNxdJM-XZf-4U5IHU8PkdHueHrJeT4xLUmTU757A4FTqZHAy4dpipsjaD6mGPB4LqI07VWDj2AYQQdl5pZiNe6Jw_rYdhq7zqlbHaMpVe8v-qyf9yoTIUIcKBrzdgd5JaQeD98QAwKfTSJqN5KeKJyBcvOxqQa_oC8oHoFBgh28DBTQ8WtxZTW1e4kB53dao6oWrz_FxcklqYKREcjtokCNcT9ISzN1xT_V6iin8yZCuAc3ajQnEzeVitmVwK-0Dlg0yWOAbpFbGjh1EbA9QUk9F1m40L6VrnBzDirXXWS_HgDF3nGJibfcNzLbJsTGkXWdluiipLchmLqo52gRFL4JkED_Xm6lpTUjQlfDHOOeOdRNsDWoYBtV5bt42Wy8_StqheGPpJkxvy_F0LyR8Hr8I_dmTSR7-1FgFgNJBv-Gvp4ESbaHyJ7-Uky_Q6Q_j7VMSwoy4eOhjzx5t-IG1wkcWVb7Z_B60';
    final Map<String, dynamic> userData = {
      'name': _nameController.text,
      'last_name': _lastNameController.text,
      'email': _emailController.text,
      'phone': _phoneController.text,
      'biography': _biographyController.text,
      'date_birth': _dateBirthController.text,
      'id_country': 1, // Reemplaza con el ID de país correcto
      'city': _cityController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
        body: json.encode(userData),
      );

      if (response.statusCode == 200) {
        
        print('Perfil actualizado con éxito.');
      } else {
        
        print(
            'Error al actualizar el perfil. Código de respuesta: ${response.statusCode}');
      }
    } catch (error) {
      
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _lastNameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Apellido'),
            ),
            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Correo'),
            ),
            TextField(
              controller: _phoneController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Número de teléfono'),
            ),
            TextField(
              controller: _biographyController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Biografía'),
            ),
            TextField(
              controller: _dateBirthController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Fecha de nacimiento'),
            ),
            TextField(
              controller: _countryController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'País'),
            ),
            TextField(
              controller: _cityController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: 'Ciudad'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateUserProfile();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text('Guardar Cambios'),
            ),
          ],
        ),
      ),
    );
  }
}
