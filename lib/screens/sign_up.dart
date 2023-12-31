
import 'package:big_fun_app/screens/home_page.dart';
import 'package:big_fun_app/services/user_service.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController userController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool allFieldsFilled = false;

  // Instancia del servicio
  UserService _userService = UserService();

  @override
  void initState() {
    _userService = UserService(); // Inicialización del servicio
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Color colorBackground = Colors.white;
    Color colorTextBox= const Color(0xFF53105C);
    Color colorBorderBox= const Color(0xFF53105C);
    Color colorText = Colors.black;
    Color colorTextButton= Colors.white;

    return Scaffold(
      backgroundColor: colorBackground, // Cambia el color de fondo aquí

      body: SingleChildScrollView(

        child: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const SizedBox(height: 85), // Espacio entre la imagen y los cuadros de texto

              Image.asset(
                'assets/logo.png', // Asegúrate de poner el nombre correcto de tu imagen
                width: 300, // Ajusta el ancho según tus necesidades
              ),

              const SizedBox(height: 20), // Espacio entre la imagen y los cuadros de texto

              SizedBox(
                width: 300,
                child: TextField(

                  controller: userController,   //Asigna el controlador aquí

                  decoration: InputDecoration(
                    labelText: 'UserName',
                    labelStyle: TextStyle(color: colorTextBox),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                  ),
                  style: TextStyle(color: colorText),


                  //VALIDA QUE EL CAMPO ESTE LLENO
                  onChanged: (value){
                    setState(() {
                      allFieldsFilled=true;

                      if (userController.text.isEmpty ||
                          nameController.text.isEmpty ||
                          emailController.text.isEmpty||
                          passwordController.text.isEmpty
                      ) {

                        allFieldsFilled = false;
                      }

                    });
                  },

                ),
              ),

              const SizedBox(height: 20), // Espacio entre la imagen y los cuadros de texto

              SizedBox(
                width: 300,
                child: TextField(

                  controller: nameController,   //Asigna el controlador aquí

                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: colorTextBox),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                  ),
                  style: TextStyle(color: colorText),

                  //VALIDA QUE EL CAMPO ESTE LLENO
                  onChanged: (value){
                    setState(() {
                      allFieldsFilled=true;

                      if (userController.text.isEmpty ||
                          nameController.text.isEmpty ||
                          emailController.text.isEmpty||
                          passwordController.text.isEmpty
                      ) {

                        allFieldsFilled = false;
                      }

                    });
                  },

                ),
              ),

              const SizedBox(height: 10), // Espacio entre los cuadros de texto

              SizedBox(
                width: 300,
                child: TextField(

                  controller: emailController,   //Asigna el controlador aquí

                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: colorTextBox),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                  ),
                  style: TextStyle(color: colorText),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.!#$%&\*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$', );

                    // Imprime la dirección de correo electrónico
                    print('Email: $value');

                    bool isValid = emailRegex.hasMatch(value);

                    if (!isValid) {
                      //print('Valid: $isValid');
                      // Muestra un SnackBar con el mensaje de error
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('The email is incorrect'),
                          behavior: SnackBarBehavior.floating, // Mantener el SnackBar visible
                        ),
                      );
                    } else {
                      //print('Valid: $isValid');
                      // Si el correo es válido, cierra el SnackBar si es el relacionado con el mensaje de correo incorrecto
                      if (ScaffoldMessenger.of(context).mounted) {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      }
                    }

                    setState(() {
                      allFieldsFilled=true;

                      if (userController.text.isEmpty ||
                          nameController.text.isEmpty ||
                          emailController.text.isEmpty||
                          passwordController.text.isEmpty
                      ) {

                        allFieldsFilled = false;
                      }
                    }

                   );
                  },
                ),
              ),

              const SizedBox(height: 10), // Espacio entre los cuadros de texto

              SizedBox(
                width: 300,
                child: TextField(

                  controller: passwordController,   //Asigna el controlador aquí

                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: colorTextBox),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorBorderBox, width: 2.0),
                    ),
                  ),
                  style: TextStyle(color: colorText),
                  obscureText: true, // Para ocultar la contraseña

                  //VALIDA QUE EL CAMPO ESTE LLENO
                  onChanged: (value){
                    setState(() {
                      allFieldsFilled=true;

                      if (userController.text.isEmpty ||
                          nameController.text.isEmpty ||
                          emailController.text.isEmpty||
                          passwordController.text.isEmpty
                      ) {

                        allFieldsFilled = false;
                      }

                    });
                  },

                ),
              ),

              const SizedBox(height: 30), // Espacio entre los cuadros de texto y el botón

              Align(
                alignment: Alignment.center,

                child: ElevatedButton(

                  onPressed: allFieldsFilled ? () async {

                    bool attendeeCreated = await _userService.createUser(
                      userController.text,
                      nameController.text,
                      emailController.text,
                      //passwordController.text,

                    );

                    if (attendeeCreated) {
                      // Si el user fue creado correctamente
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Account created successfully'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(),));

                    };

                  } : null,

                  style: ElevatedButton.styleFrom(
                    primary: colorBorderBox,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80), // Ajusta el radio según tus necesidades
                    ),

                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Ajusta el padding del botón

                    //PARA QUE SE HABILITE O DESHABILITE EL BOTON
                    elevation: 2,// Si no todos los campos están llenos, desactiva la elevación
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: colorTextButton,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

