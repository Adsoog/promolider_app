import 'package:flutter/material.dart';

class RecomprarView extends StatelessWidget {
  const RecomprarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RECOMPRAR OPC',
            style: TextStyle(
                color: Colors.white)), 
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 1,
              color: Colors.grey[300], // Línea gris con fondo claro
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            _buildExpiracionOPCWidget(),
            const SizedBox(height: 20),
            _buildRecomprarTituloWidget(),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Lógica para seleccionar el método de pago
              }, // Texto negro en el botón
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300], // Fondo del botón gris claro
              ),
              child: const Text('Seleccionar Método de Pago',
                  style: TextStyle(
                      color: Colors.black)),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(
                  value: false, // Asegúrate de gestionar el estado del checkbox
                  onChanged: (value) {
                    // Lógica para aceptar los términos y condiciones
                  },
                ),
                const Text('Acepto los Términos y Condiciones',
                    style: TextStyle(color: Colors.white)), // Texto blanco
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para comprar OPC
              }, // Texto blanco en el botón
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Fondo del botón verde
              ),
              child: const Text('COMPRAR',
                  style: TextStyle(
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpiracionOPCWidget() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green), // Borde verde
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expiración de OPC',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.green, fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'Tiempo restante para la expiración de su estado activo',
            style: TextStyle(color: Colors.green),
          ),
          SizedBox(height: 10),
          // Aquí puedes mostrar los días, horas, minutos y segundos restantes en cuenta regresiva
          // usando un widget específico para la cuenta regresiva.
        ],
      ),
    );
  }

  Widget _buildRecomprarTituloWidget() {
    return Container(
      height: 1,
      color: Colors.grey[300], // Línea gris con fondo claro
      margin: const EdgeInsets.symmetric(vertical: 10),
    );
  }
}
