

import 'package:flutter/material.dart';
import 'package:lista_de_gastos/components/editor.dart';
import 'package:lista_de_gastos/models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();

  final TextEditingController _controladorCampoData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Anotando Gastos')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(_controladorCampoNumeroConta, 'Valor Gasto', '00.0',
                Icons.monetization_on),
            Editor(_controladorCampoData, 'Data e lugar',
                'Mercado, 29/10/2001 - 12:00', Icons.lock_clock),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                debugPrint('clicou no confirmar');
                final String campoData = _controladorCampoData.text;
                final double? numeroConta =
                double.tryParse(_controladorCampoNumeroConta.text);
                if (numeroConta != null && campoData != null) {
                  final transferenciaCriada =
                  Transferencia(numeroConta, campoData);
                  debugPrint('$transferenciaCriada');
                  Navigator.pop(context, transferenciaCriada);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
