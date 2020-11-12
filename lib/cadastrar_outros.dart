import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pattern_formatter/date_formatter.dart';
import 'package:spinner/spinner.dart';
import 'package:url_launcher/url_launcher.dart';

import 'DropExample.dart';


class CadastrarOutros extends StatefulWidget {
  @override
  _CadastrarOutrosState createState() => _CadastrarOutrosState();
}

class _CadastrarOutrosState extends State<CadastrarOutros> {
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController matricula = TextEditingController();
  TextEditingController rg = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController endereco = TextEditingController();
  TextEditingController profissao = TextEditingController();
  TextEditingController nascimento = TextEditingController();
  TextEditingController senha = TextEditingController();

  Future register() async {
    var url = "http://jcatechnology.com.br/piscina/outros.php";
    //var url = "http://192.168.1.141/piscina/outros.php";
    var response = await http.post(url, body: {
      "nome": nome.text,
      "email": email.text,
      "matricula": matricula.text,
      "rg": rg.text,
      "telefone": telefone.text,
      "endereco": endereco.text,
      "profissao": profissao.text,
      "nascimento": nascimento.text,
      "senha": senha.text,
      "level": "member",
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: "Usuário já existe",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 20.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Cadastro realizado com sucesso!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,
        fontSize: 20.0,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Spinner(),),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.red[800],
        appBar: AppBar(
          title: Text(
            'CBMRN',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[100]),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Card(
              //color: Colors.red[800],
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Cadastrar Usuário',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: nome,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: email,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Matrícula',
                        hintText: 'xxx.xxx-x',
                        prefixIcon: Icon(Icons.perm_identity),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: matricula,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'RG',
                        prefixIcon: Icon(Icons.perm_identity),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: rg,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Telefone',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: telefone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Endereço',
                        prefixIcon: Icon(Icons.home),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: endereco,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Profissão',
                        prefixIcon: Icon(Icons.work),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: profissao,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Data de Nascimento',
                        hintText: 'dd/MM/yyyy',
                        prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      keyboardType: TextInputType.number,

                      inputFormatters: [
                        WhitelistingTextInputFormatter(RegExp(r'\d+|-|/')),
                        DateInputFormatter(),
                      ],
                      style: TextStyle(fontSize: 16.0, color: Colors.black),

                      controller: nascimento,
                    ),
                  ),

                  DropExample(),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      controller: senha,
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: timeDilation != 1.0,
                          onChanged: (bool value) {
                            setState(() {
                              timeDilation = value ? 2.0 : 1.0;
                            });
                          }),
                      Text("Li e aceito os "),

                      InkWell(
                          child: Text("termos de uso!", style: TextStyle(fontStyle: FontStyle.italic, color: Colors.blueAccent ),),
                          onTap: () =>launch ('http://imagescloud.com.br/pp.pdf')
                      ),
                    ],
                  ),
                  MaterialButton(
                          color: Colors.blue,
                          child: Text('Cadastrar',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          onPressed: () {
                            register();
                          },
                        ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
