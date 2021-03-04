import 'package:flutter/material.dart';

class ImcPage extends StatefulWidget {
  @override
  _ImcPageState createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final TextEditingController txtPesoCtrl = TextEditingController();
  final TextEditingController txtAlturaCtrl = TextEditingController();

  double imc = 0;
  String image = "assets/images/abaixo.png";

  void calculaIMC() {
    double peso = double.parse(txtPesoCtrl.text);
    double altura = double.parse(txtAlturaCtrl.text);

    setState(() {
      this.imc = peso / ( altura * altura );
      this.image = getImage();
    });
  }

  String getImage() {
    if (this.imc < 17) {
      return "assets/images/magreza.png";
    } else if (this.imc <= 18.49) {
      return "assets/images/abaixo.png";
    } else if (this.imc <= 24.99) {
      return "assets/images/ideal.png";
    } else if (this.imc <= 29.99) {
      return "assets/images/sobre.png";
    } 

    return "assets/images/obesidade.png";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('IMC'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Peso",
                          hintText: "Peso em kg."
                        ),
                        keyboardType: TextInputType.number,
                        controller: txtPesoCtrl,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Altura",
                          hintText: "Altura em metros"
                        ),
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                          signed: false,
                        ),
                        controller: txtAlturaCtrl,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        child: Text(
                          "Calcular IMC",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                        onPressed: () => calculaIMC()
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Seu IMC é ${imc.toStringAsFixed(2)}")
                  ],
                ),
              )
            ),
            Flexible(
              flex: 2,
              child: Center(child: Image.asset(image)) 
            )
          ],
        ),
      ),
    );
  }
}