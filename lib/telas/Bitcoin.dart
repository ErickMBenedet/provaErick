import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../componentes/botao.dart';

class Bitcoin extends StatefulWidget {
  const Bitcoin({super.key});

  @override
  State<Bitcoin> createState() => _BitcoinState();
}

class _BitcoinState extends State<Bitcoin> {

  String txtBlockchain = 'Blockchain.info: ';
  String txtCoinbase = 'Coinbase: ';
  String txtBitStamp = 'BitStamp: ';
  String txtFoxBit = 'FoxBit: ';
  String txtMercadoBitcoin = 'Mercado Bitcoin: ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finanças de Hoje'),
        backgroundColor: Color.fromARGB(255, 0, 53, 12)
      ),
      body: criaBody()
    );
  }

  proximaTela() {
    Navigator.pushNamed(context, '/principaisMoedas');
  }
  
  criaBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Center(child: Text('Bitcoin')),
      Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(txtBlockchain, style: TextStyle(fontSize: 15)),
                    Text(txtBitStamp, style: TextStyle(fontSize: 15)),
                    Text(txtMercadoBitcoin, style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(txtCoinbase, style: TextStyle(fontSize: 15)),
                    Text(txtFoxBit, style: TextStyle(fontSize: 15)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Botao(texto: 'Página Principal', funcao: proximaTela),
        ],
      ),
    );
  }
}