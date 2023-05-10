import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../componentes/botao.dart';

class Acoes extends StatefulWidget {
  const Acoes({super.key});

  @override
  State<Acoes> createState() => _AcoesState();
}

class _AcoesState extends State<Acoes> {

  String txtIbovespa = 'IBOVESPA: ';
  String txtIfix= 'IFIX: ';
  String txtNasdaq = 'NASDAQ: ';
  String txtDowjones = 'DOWJONES: ';
  String txtCac = 'CAC: ';
  String txtNikkei = 'NIKKEI: ';

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
    Navigator.pushNamed(context, '/bitcoin');
  }

  criaBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Center(child: Text('Ações')),
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
                    Text(txtIbovespa, style: TextStyle(fontSize: 15)),
                    Text(txtNasdaq, style: TextStyle(fontSize: 15)),
                    Text(txtCac, style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(txtIfix, style: TextStyle(fontSize: 15)),
                    Text(txtDowjones, style: TextStyle(fontSize: 15)),
                    Text(txtNikkei, style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Botao(texto: 'Ir para Bitcoin', funcao: proximaTela),
        ],
      ),
    );
  }
}