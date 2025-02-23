import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 400,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/login_page.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Rajshahi University of Engineering And Technology, Rajshahi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Alumni and Students Community',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to Our Community,',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  Widget _buildAppBarText(String text, double size, FontWeight weight) {
    return Text(
      text,
      style: TextStyle(color: Colors.white, fontSize: size, fontWeight: weight),
    );
  }
  void _login(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
  void _navigateToRegister(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.0),
          child: AppBar(
            backgroundColor: Colors.black87,
            elevation: 0,
            centerTitle: true,
            title: Column(
              children: [
                _buildAppBarText("Rajshahi University Of Engineering", 17, FontWeight.bold),
                _buildAppBarText("and Technology, Rajshahi", 17, FontWeight.bold),
                _buildAppBarText("Alumni and Students Community", 14, FontWeight.normal),
              ],
            ),
          ),
        ),
    body:
    Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.amber,
                    width: 2
                  )
                ),
                labelText: " Enter Your Email",
                // labelStyle: TextStyle(color: Colors.black),
                floatingLabelStyle: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                filled: true,
                fillColor: Colors.grey.shade300,
              prefixIcon: Icon(Icons.email,color: Colors.grey,),
              ),

            ),
            SizedBox(height: 16.0),
       // Add this as a state variable in _LoginScreenState

      TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                color: Colors.amber,
                width: 2
            )
        ),
        labelText: "Enter Your Password",
        floatingLabelStyle: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey.shade300,
        prefixIcon: Icon(Icons.lock, color: Colors.grey),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // Toggle password visibility
            });
          },
          icon: Icon(
            _obscureText ? Icons.remove_red_eye : Icons.visibility_off,
            color: Colors.grey,
          ),
        ),
      ),
      obscureText: _obscureText,
      obscuringCharacter: '*',
    ),
            SizedBox(height: 80.0),
            ElevatedButton(
              onPressed: () => _login(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
              ),
              child: Text("Login",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Text("Don't have a account ?",
              style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () => _navigateToRegister(context),
              child: Text("Click here to register",
                style: TextStyle(color: Colors.redAccent,fontSize: 15,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  void _register(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text("Register to Create an Account",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.orangeAccent,
      ),
      body:
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.amber,
                            width: 2
                        )
                    ),
                    labelText: "Enter Your Name",
                    floatingLabelStyle: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: Icon(Icons.face,color: Colors.grey,),),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.amber,
                            width: 2
                        )
                    ),
                    labelText: "Enter Your Email",
                    floatingLabelStyle: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: Icon(Icons.email,color: Colors.grey,),),
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.amber,
                            width: 2
                        )
                    ),
                    labelText: "Enter Your Password",
                    floatingLabelStyle: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    prefixIcon: Icon(Icons.lock,color: Colors.grey,),
                    suffixIcon: IconButton(onPressed:(){},
                        icon: Icon(Icons.remove_red_eye,color: Colors.grey,)),),
                  obscureText: true,
                  obscuringCharacter: '*',
                ),
                SizedBox(height: 80),
                ElevatedButton(
                  onPressed: () => _register(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text("Register",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
    );
  }
}


class HomePage extends StatelessWidget {

  void _logout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Logout"),
          content: Text("Are you sure you want to log out?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // Close dialog
              child: Text("Cancel",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog first
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text("Logout", style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0), // Increase AppBar height
        child:
        AppBar(
          backgroundColor: Colors.black87,
          elevation: 0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Rajshahi University Of Engineering",
                style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "and Technology, Rajshahi",
                style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),
              ),
              Text(
                "Alumni and Students Community", // Second line
                style: TextStyle(color: Colors.white,fontSize: 16),
              ),
            ],
          ),
          centerTitle: true,
          // actions: [
          //   TextButton.icon(
          //     onPressed: () => _logout(context),
          //     icon: Icon(Icons.logout, color: Colors.white),
          //     label: Text("", style: TextStyle(color: Colors.white)),
          //     style: TextButton.styleFrom(
          //       backgroundColor: Colors.red.shade400,
          //       padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
          //     ),
          //   ),
          // ],
          actions: [
            IconButton(
              icon: Icon(Icons.logout, color: Colors.white,),
              style: IconButton.styleFrom(
                backgroundColor: Colors.red.shade400,
              ),
              onPressed: () => _logout(context),
            ),
          ],

        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            _buildContainer(context, "Alumni Directory", Colors.blue.shade300,Alumni_Directory()),
            _buildContainer(context, "  Students\nCommunity", Colors.green.shade300, Students_Community()),
            _buildContainer(context, "Events", Colors.orange.shade300, EventsPage()),
            _buildContainer(context, "Tuition Offers", Colors.red.shade300, TuitionPage()),
            _buildContainer(context, "about_us", Colors.cyan.shade300, about_us()),
            _buildContainer(context, "  Join Our\nCommunity", Colors.purple.shade300, our_community()),
            // _buildContainer(context, "Resources and Important Documents", Colors.purple.shade300, resources()),

          ],
        ),
      ),
    );
  }

  Widget _buildContainer(BuildContext context, String title, Color color, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(

          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              spreadRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}


// Different pages for navigation


class Alumni_Directory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alumni Directory"),
        backgroundColor: Colors.cyan.shade300,
      ),
      body: Center(child: Text("Welcome to Alumni Directory Page", style: TextStyle(fontSize: 24))),
    );
  }
}

class Students_Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green.shade300,
          title: Text("Students Community")),
      body: Center(child: Text("Welcome to our students Community", style: TextStyle(fontSize: 24))),
    );
  }
}

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text("Events announcement")),
      body: Center(child: Text("Welcome to Events Page", style: TextStyle(fontSize: 24))),
    );
  }
}

class TuitionPage extends StatefulWidget {
  @override
  _TuitionPageState createState() => _TuitionPageState();
}

class _TuitionPageState extends State<TuitionPage> {
  final TextEditingController _textController = TextEditingController();
  List<String> _tuitionOffers = [];

  void _addTuitionOffer() {
    if (_textController.text.trim().isNotEmpty) {
      setState(() {
        _tuitionOffers.add(_textController.text.trim());
        _textController.clear();
      });
    }
  }

  void _removeTuitionOffer(int index) {
    setState(() {
      _tuitionOffers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: Text("Tuition Offers",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Colors.deepOrange,
                        width: 2
                    )
                ),
                labelText: "Enter Tuition Offer",
                floatingLabelStyle: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addTuitionOffer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
              child: Text("Add Offer", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _tuitionOffers.isEmpty
                  ? Center(
                child: Text("No tuition offers yet", style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold)),
              )
                  : ListView.builder(
                itemCount: _tuitionOffers.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        _tuitionOffers[index],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _removeTuitionOffer(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class  our_community extends StatelessWidget {
  void _join_page(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Please Provide the following Information",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    _buildInputField("Name"),
                    _buildInputField("Department"),
                    _buildInputField("Series"),
                    _buildInputField("Current University/\nCurrent Company"),
                    _buildInputField("Present Address"),
                    _buildInputField("Facebook ID"),
                    _buildInputField("LinkedIn"),
                    _buildInputField("Email"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => _join_page(context),
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 140, // Fixed width for all labels
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.amber[700],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class about_us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.pink.shade300,
          title: Text("Everything about the app")),
      body: Center(child: Text("why this app is built", style: TextStyle(fontSize: 24))),
    );
  }
}

