import 'package:flutter/material.dart';

class SaldoView extends StatefulWidget {
  const SaldoView({Key? key}) : super(key: key);

  @override
  _SaldoViewState createState() => _SaldoViewState();
}

class _SaldoViewState extends State<SaldoView> {
  bool isExpanded = false; //
  bool isTransferExpanded =
      false; // VVariable para controlar la expansión del contenido
  bool isRechargeExpanded = false;
  bool isTransferOptionSelected =
      true; // true para Nro de Transferencia, false para Nro Voucher
  bool isCircleFilled = false; // Indica si el círculo está lleno de color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MI BILLETERA'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 1,
              color: Colors.grey, // Línea gris
              margin: const EdgeInsets.symmetric(vertical: 10),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded; // Cambiar el estado de expansión
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Fondo verde
              ),
              child: const Text(
                'Solicitud de Fondos',
                style: TextStyle(color: Colors.black), // Letra negra
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Duración de la animación
              height: isExpanded ? 200 : 0, // Altura del contenido
              child: isExpanded
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText:
                                  'Cantidad de Fondos'), // Cambio del título
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para procesar la solicitud de fondos
                            // ...
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          child: const Text(
                            'Enviar Petición', // Cambio del título
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isTransferExpanded =
                      !isTransferExpanded; // Cambiar el estado de expansión
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Fondo verde
              ),
              child: const Text(
                'Transferir Fondos',
                style: TextStyle(color: Colors.black), // Letra negra
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Duración de la animación
              height: isTransferExpanded ? 200 : 0, // Altura del contenido
              child: isTransferExpanded
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText:
                                  'Cantidad a trasladar'), // Cambio del título
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Mis directos'), // Cambio del título
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para procesar la transferencia de fondos
                            // ...
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Transferir Fondos', // Cambio del título
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isRechargeExpanded =
                      !isRechargeExpanded; // Cambiar el estado de expansión
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Fondo verde
              ),
              child: const Text(
                'Recargar Fondos',
                style: TextStyle(color: Colors.black), // Letra negra
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Duración de la animación
              height: isRechargeExpanded ? 250 : 0, // Altura del contenido
              child: isRechargeExpanded
                  ? Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText:
                                  'Monto a recargar'), // Cambio del título
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText:
                                  'Bancos Disponibles'), // Cambio del título
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTransferOptionSelected =
                                      true; // Seleccionar Nro de Transferencia
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      isTransferOptionSelected && isCircleFilled
                                          ? Colors.green
                                          : Colors.white,
                                  border: Border.all(color: Colors.green),
                                ),
                                child: isTransferOptionSelected
                                    ? const Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Nro de Transferencia'),
                            const SizedBox(width: 16),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTransferOptionSelected =
                                      false; // Seleccionar Nro Voucher
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: !isTransferOptionSelected &&
                                          isCircleFilled
                                      ? Colors.green
                                      : Colors.white,
                                  border: Border.all(color: Colors.green),
                                ),
                                child: !isTransferOptionSelected
                                    ? const Center(
                                        child: Icon(
                                          Icons.check,
                                          size: 14,
                                          color: Colors.white,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Text('Nro Voucher'),
                          ],
                        ),
                        if (isCircleFilled &&
                            !isTransferOptionSelected) // Mostrar campo solo cuando Nro Voucher está seleccionado
                          TextFormField(
                            decoration:
                                const InputDecoration(labelText: 'Número Voucher'),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para procesar la recarga de fondos
                            // ...
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Recargar Fondos',
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
            const Spacer(),
            Row(
              children: [
                Container(
                  height: 1,
                  color: Colors.grey, // Línea gris
                  margin: const EdgeInsets.symmetric(vertical: 10),
                ),
              ],
            ),
            Row(
              children: [
                const Text('Mostrar: '),
                DropdownButton<int>(
                  value:
                      1, // Valor predeterminado, puedes inicializarlo según tus necesidades
                  onChanged: (int? newValue) {
                    // Lógica para manejar la selección del menú desplegable
                  },
                  items: List.generate(
                      10,
                      (index) => DropdownMenuItem<int>(
                          value: index + 1,
                          child: Text('${index + 1} registros'))),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Fecha'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Monto'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Motivo'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: const Text('Ningún dato disponible en esta tabla',
                  style: TextStyle(color: Colors.grey)),
            ),
            const SizedBox(height: 20),
            const Text(
              'TOTAL: \$ 0.00',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
