import 'package:flutter/material.dart'; 
import 'package:firebase_auth/firebase_auth.dart'; 
import 'package:firebase_database/firebase_database.dart'; 
 
class RegisterScreen extends StatefulWidget { 
  @override 
  _RegisterScreenState createState() => _RegisterScreenState(); 
} 
 
class _RegisterScreenState extends State<RegisterScreen> { 
  final _formKey = GlobalKey<FormState>(); 
  final TextEditingController _nameController = TextEditingController(); 
  final TextEditingController _surnameController = TextEditingController(); 
  final TextEditingController _ageController = TextEditingController(); 
  final TextEditingController _emailController = TextEditingController(); 
  final TextEditingController _passwordController = TextEditingController(); 
  bool _isLoading = false; 
 
  final FirebaseAuth _auth = FirebaseAuth.instance; 
  final DatabaseReference _database = FirebaseDatabase.instance.ref(); 
 
  Future<void> _register() async { 
    if (_formKey.currentState!.validate()) { 
      setState(() { 
        _isLoading = true; 
      }); 
 
      try { 
        // Register the user in Firebase Authentication 
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword( 
          email: _emailController.text.trim(), 
          password: _passwordController.text.trim(), 
        ); 
 
        // Save user information to Realtime Database 
        await _database.child('users').child(userCredential.user!.uid).set({ 
          'name': _nameController.text.trim(), 
          'surname': _surnameController.text.trim(), 
          'age': int.parse(_ageController.text.trim()), 
          'email': _emailController.text.trim(), 
        }); 
 
        ScaffoldMessenger.of(context).showSnackBar( 
          SnackBar(content: Text('Usuario registrado correctamente')), 
        ); 
 
        Navigator.pushReplacementNamed(context, '/catalogo'); 
      } catch (e) { 
        ScaffoldMessenger.of(context).showSnackBar( 
          SnackBar(content: Text('Error: ${e.toString()}')), 
        ); 
      } finally { 
        setState(() { 
          _isLoading = false; 
        }); 
      } 
    } 
  } 
 
  @override 
  Widget build(BuildContext context) { 
    return Scaffold( 
      appBar: AppBar(title: Text('Registro de Usuario')), 
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(16.0), 
        child: Form( 
          key: _formKey, 
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.stretch, 
            children: [ 
              SizedBox(height: 16), 
              TextFormField( 
                controller: _nameController, 
                decoration: InputDecoration(labelText: 'Nombre'), 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Por favor ingresa tu nombre'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 16), 
              TextFormField( 
                controller: _surnameController, 
                decoration: InputDecoration(labelText: 'Apellido'), 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Por favor ingresa tu apellido'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 16), 
              TextFormField( 
                controller: _ageController, 
                decoration: InputDecoration(labelText: 'Edad'), 
                keyboardType: TextInputType.number, 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Por favor ingresa tu edad'; 
                  } 
                  if (int.tryParse(value) == null) { 
                    return 'Por favor ingresa un número válido'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 16), 
              TextFormField(controller: _emailController, 
                decoration: InputDecoration(labelText: 'Correo Electrónico'), 
                keyboardType: TextInputType.emailAddress, 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Por favor ingresa tu correo electrónico'; 
                  } 
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) { 
                    return 'Por favor ingresa un correo válido'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 16), 
              TextFormField( 
                controller: _passwordController, 
                decoration: InputDecoration(labelText: 'Contraseña'), 
                obscureText: true, 
                validator: (value) { 
                  if (value == null || value.isEmpty) { 
                    return 'Por favor ingresa una contraseña'; 
                  } 
                  if (value.length < 6) { 
                    return 'La contraseña debe tener al menos 6 caracteres'; 
                  } 
                  return null; 
                }, 
              ), 
              SizedBox(height: 20), 
              ElevatedButton( 
                onPressed: _isLoading ? null : _register, 
                child: _isLoading 
                    ? CircularProgressIndicator(color: Colors.white) 
                    : Text('Registrar Usuario'), 
              ), 
            ], 
          ), 
        ), 
      ), 
    ); 
  } 
}
