import 'package:flutter/material.dart';

class AlcoolGasolina extends StatefulWidget {
  const AlcoolGasolina({super.key});

  @override
  State<AlcoolGasolina> createState() => _AlcoolGasolinaState();
}

class _AlcoolGasolinaState extends State<AlcoolGasolina> {
  TextEditingController controllerAlcool = TextEditingController();
  TextEditingController controllerGasolina = TextEditingController();
  String textoResultado = '';

  void calcular() {
    double? precoAlcool = double.tryParse(controllerAlcool.text);
    double? precoGasolina = double.tryParse(controllerGasolina.text);

    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        textoResultado =
            'Número inválido, digite números maiores que 0 e utilizando (.)';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          textoResultado = 'Melhor abastecer com gasolina';
        });
      } else {
        setState(() {
          textoResultado = 'Melhor abastecer com álcool';
        });
      }
      // limparCampos();
    }
  }

  void limparCampos() {
    controllerAlcool.text = '';
    controllerGasolina.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Image.asset('assets/images/logo.png'),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'Saiba qual a melhor opção para abastecimento o seu carro:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço do Álcool',
                hintText: 'Ex: 1.59',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 22,
              ),
              controller: controllerAlcool,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço do Gasolina',
                hintText: 'Ex: 3.59',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
              ),
              style: const TextStyle(
                fontSize: 22,
              ),
              controller: controllerGasolina,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                onPressed: calcular,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text(
                  'Calcular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                textoResultado,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
