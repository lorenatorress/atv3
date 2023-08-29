import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fomulario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  String selectedCity = '';
  String selectedVencimento = '10';

  TextEditingController usuarioController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController enderecoController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController observacaoController = TextEditingController();

  bool eletrotecnica = false;
  bool automacao = false;
  bool desenvolvimento = false;
//--------------------------------------------------------

//-----------------------------------------------------------
  @override
  void dispose() {
    usuarioController.dispose();
    cpfController.dispose();
    dataNascimentoController.dispose();
    enderecoController.dispose();
    numeroController.dispose();
    observacaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Formulário de Cadastro'),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                title: Text('Nome Completo'),
                subtitle: TextFormField(
                  controller: usuarioController,
                  decoration:
                      InputDecoration(hintText: 'Informe seu nome completo'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      title: Text('CPF'),
                      subtitle: TextFormField(
                        controller: cpfController,
                        decoration:
                            InputDecoration(hintText: 'Informe o seu CPF'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text('Data de Nascimento'),
                      subtitle: TextFormField(
                        controller: dataNascimentoController,
                        decoration: InputDecoration(
                          hintText: 'Informe a sua data de nascimento',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text('Dia do Vencimento'),
                subtitle: Row(
                  children: [
                    Radio(
                      value: '5',
                      groupValue: selectedVencimento,
                      onChanged: (value) {
                        setState(() {
                          selectedVencimento = value.toString();
                        });
                      },
                    ),
                    Text('5'),
                    Radio(
                      value: '10',
                      groupValue: selectedVencimento,
                      onChanged: (value) {
                        setState(() {
                          selectedVencimento = value.toString();
                        });
                      },
                    ),
                    Text('10'),
                    Radio(
                      value: '15',
                      groupValue: selectedVencimento,
                      onChanged: (value) {
                        setState(() {
                          selectedVencimento = value.toString();
                        });
                      },
                    ),
                    Text('15'),
                  ],
                ),
              ),
              ListTile(
                title: Text(
                  'Escolha a área de Interesse:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              CheckboxListTile(
                title: Text('Eletrotécnica'),
                value: eletrotecnica,
                onChanged: (value) {
                  setState(() {
                    eletrotecnica = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Automação '),
                value: automacao,
                onChanged: (value) {
                  setState(() {
                    automacao = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Desenvolvimento de Sistemas'),
                value: desenvolvimento,
                onChanged: (value) {
                  setState(() {
                    desenvolvimento = value!;
                  });
                },
              ),
              TextFormField(
                controller: enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: numeroController,
                      decoration: InputDecoration(labelText: "numero"),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(labelText: 'Cidade'),
                      value: selectedCity.isEmpty ? null : selectedCity,
                      items: [
                        'Recife',
                        'São Paulo',
                        'João Pessoa',
                        'Jaboatão dos Guararapes',
                      ].map((city) {
                        return DropdownMenuItem(value: city, child: Text(city));
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                controller: observacaoController,
                decoration: InputDecoration(labelText: 'Complementos'),
                maxLines: 1,
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica para cadastrar os dados
                    print('Nome Completo: ${usuarioController.text}');
                    print('CPF: ${cpfController.text}');
                    print(
                        'Data de Nascimento: ${dataNascimentoController.text}');
                    print('Dia de Vencimento: $selectedVencimento');
                    print('Áreas de Interesse:');
                    if (eletrotecnica) print('- Eletrotécnica');
                    if (automacao) print('- Automação');
                    if (desenvolvimento) print('- Desenvolvimento de Sistemas');
                    print('Endereço: ${enderecoController.text}');
                    print('Número: ${numeroController.text}');
                    print('Cidade: $selectedCity');
                    print('Observação: ${observacaoController.text}');
                  },
                  child: Text('Cadastrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
