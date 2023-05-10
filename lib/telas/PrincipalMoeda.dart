import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

import '../componentes/botao.dart';

class PrincipalMoeda extends StatefulWidget {
  const PrincipalMoeda({super.key});

  @override
  State<PrincipalMoeda> createState() => _PrincipalMoedaState();
}

class _PrincipalMoedaState extends State<PrincipalMoeda> {
  @override
  void initState() {
    super.initState();
    buscar();
  }

  String txtDolar = '';
  String txtEuro = '';
  String txtPeso = '';
  String txtYen = '';

  String txtIbovespa = '';
  String txtIfix = '';
  String txtNasdaq = '';
  String txtDowjones = '';
  String txtCac = '';
  String txtNikkei = '';

  String txtBlockchainInfo = '';
  String txtCoinbase = '';
  String txtBitStamp = '';
  String txtFoxBit = '';
  String txtMercadoBitcoin = '';

  //Variação
  double txtVariDolar = 0;
  double txtVariEuro = 0;
  double txtVariPeso = 0;
  double txtVariYen = 0;

  double txtVariIbovespa = 0;
  double txtVariIfix = 0;
  double txtVariNasdaq = 0;
  double txtVariDowjones = 0;
  double txtVariCac = 0;
  double txtVariNikkei = 0;

  double txtVariBlockchainInfo = 0;
  double txtVariCoinbase = 0;
  double txtVariBitStamp = 0;
  double txtVariFoxBit = 0;
  double txtVariMercadoBitcoin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Finanças de Hoje'),
        backgroundColor: const Color.fromARGB(255, 0, 63, 15)
      ),
      body: criaBody(),
    );
  }
  
  

  proximaTela() {
    Navigator.pushNamed(context, '/acoes');
  }

  buscar() async {
    final String urlHGBr = 'https://api.hgbrasil.com/finance?key=4d19a7aa&format=json-cors';
    Response resposta = await get(Uri.parse(urlHGBr));
    Map api = json.decode(resposta.body);
    setState(() {
      String valorDolar = 'Dólar: ${api['results']['currencies']['USD']['buy']}';
      String valorEuro = 'Euro: ${api['results']['currencies']['EUR']['buy']}';
      String valorPeso = 'Peso: ${api['results']['currencies']['ARS']['buy']}';
      String valorYen = 'Yen: ${api['results']['currencies']['JPY']['buy']}';
      txtDolar = valorDolar;
      txtEuro = valorEuro;
      txtPeso = valorPeso;
      txtYen = valorYen;

      String valorIbovespa = 'IBOVESPA: ${api["results"]["stocks"]["IBOVESPA"]["points"]}';
      String valorIfix = 'IFIX: ${api["results"]["stocks"]["IFIX"]["points"]}';
      String valorNasdaq = 'NASDAQ: ${api["results"]["stocks"]["NASDAQ"]["points"]}';
      String valorDowjones = 'DOWJONES: ${api["results"]["stocks"]["DOWJONES"]["points"]}';
      String valorCac = 'CAC: ${api["results"]["stocks"]["CAC"]["points"]}';
      String valorNikkei = 'NIKKEI: ${api["results"]["stocks"]["NIKKEI"]["points"]}';
      txtIbovespa = valorIbovespa;
      txtIfix = valorIfix;
      txtNasdaq = valorNasdaq;
      txtDowjones = valorDowjones;
      txtCac = valorCac;
      txtNikkei = valorNikkei;

      String valorBlockchainInfo = 'Blockchain.info: ${api["results"]["bitcoin"]["blockchain_info"]["last"]}';
      String valorCoinbase = 'Coinbase: ${api["results"]["bitcoin"]["coinbase"]["last"]}';
      String valorBitStamp = 'BitStamp: ${api["results"]["bitcoin"]["bitstamp"]["last"]}';
      String valorFoxBit = 'FoxBit: ${api["results"]["bitcoin"]["foxbit"]["last"]}';
      String valorMercadoBitcoin = 'Mercado Bitcoin: ${api["results"]["bitcoin"]["mercadobitcoin"]["last"]}';
      txtBlockchainInfo = valorBlockchainInfo;
      txtCoinbase = valorCoinbase;
      txtBitStamp = valorBitStamp;
      txtFoxBit = valorFoxBit;
      txtMercadoBitcoin = valorMercadoBitcoin;

      //variação
      double variDolar = api['results']['currencies']['USD']['buy'];
      double variEuro = api['results']['currencies']['EUR']['buy'];
      double variPeso = api['results']['currencies']['ARS']['buy'];
      double variYen = api['results']['currencies']['JPY']['buy'];
      txtVariDolar = variDolar;
      txtVariEuro = variEuro;
      txtVariPeso = variPeso;
      txtVariYen = variYen;

      double variIbovespa = api["results"]["stocks"]["IBOVESPA"]["points"];
      double variIfix = api["results"]["stocks"]["IFIX"]["points"];
      double variNasdaq = api["results"]["stocks"]["NASDAQ"]["points"];
      double variDowjones = api["results"]["stocks"]["DOWJONES"]["points"];
      double variCac = api["results"]["stocks"]["CAC"]["points"];
      double variNikkei = api["results"]["stocks"]["NIKKEI"]["points"];
      txtVariIbovespa = variIbovespa;
      txtVariIfix = variIfix;
      txtVariNasdaq = variNasdaq;
      txtVariDowjones = variDowjones;
      txtVariCac = variCac;
      txtVariNikkei = variNikkei;

      double variBlockchainInfo = api["results"]["bitcoin"]["blockchain_info"]["last"];
      double variCoinbase = api["results"]["bitcoin"]["coinbase"]["last"];
      double variBitStamp = api["results"]["bitcoin"]["bitstamp"]["last"];
      double variFoxBit = api["results"]["bitcoin"]["foxbit"]["last"];
      double variMercadoBitcoin = api["results"]["bitcoin"]["mercadobitcoin"]["last"];
      txtVariBlockchainInfo = variBlockchainInfo;
      txtVariCoinbase = variCoinbase;
      txtVariBitStamp = variBitStamp;
      txtVariFoxBit = variFoxBit;
      txtVariMercadoBitcoin = variMercadoBitcoin;
    });
  }

  criaBody() {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
        Center(child: Text('MOEDAS')),
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
                    Text(txtDolar, style: TextStyle(fontSize: 15)),
                    Text(txtPeso, style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(txtEuro, style: TextStyle(fontSize: 15)),
                    Text(txtYen, style: TextStyle(fontSize: 15))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Botao(texto: 'Ir para Ações', funcao: proximaTela),
        ],
      ),
    );
  }
}