import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color(0xFFB2E898),
                ),
                child: Center(
                  child: Image.asset('assets/logo.png', height: 60),
                ),
              ),
              _buildDrawerItem(context, 'Veterinário', 'assets/veterinario.jpg'),
              _buildDrawerItem(context, 'Adoção', 'assets/adocao.jpg'),
              _buildDrawerItem(context, 'Banho', 'assets/banho.jpg'),
              _buildDrawerItem(context, 'Vacina', 'assets/vacina.png'),
            ],
          ),
        ),
      ),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xFFB2E898),
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu, color: Colors.green[900]),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          centerTitle: true,
          title: Image.asset(
            'assets/logo.png',
            height: 90,
          ),
        ),
      ),

      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/logo_texto.jpg',
                height: 80,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.95,
                children: [
                  _buildServiceButton('Vacina', 'assets/vacina.png', () {
                    print('Vacina clicado');
                  }),
                  _buildServiceButton('Adoção', 'assets/adocao.jpg', () {
                    print('Adoção clicado');
                  }),
                  _buildServiceButton('Banho', 'assets/banho.jpg', () {
                    print('Banho clicado');
                  }),
                  _buildServiceButton('Veterinário', 'assets/veterinario.jpg', () {
                    print('Veterinário clicado');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
          BottomNavigationBar(
            backgroundColor: const Color(0xFFB2E898),
            selectedItemColor: Colors.green[900],
            unselectedItemColor: Colors.green[900],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
              BottomNavigationBarItem(icon: SizedBox.shrink(), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.share), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
          ),
          Positioned(
            bottom: 8,
            child: Image.asset(
              'assets/logo.png',
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String title, String imagePath) {
    return ListTile(
      leading: Image.asset(imagePath, height: 36),
      title: Text(title, style: TextStyle(fontSize: 18, color: Colors.green[900])),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ServiceDetailScreen(title: title, imagePath: imagePath),
          ),
        );
      },
    );
  }

  Widget _buildServiceButton(String label, String iconPath, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              height: 70,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.green[900],
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceDetailScreen extends StatelessWidget {
  final String title;
  final String imagePath;

  const ServiceDetailScreen({
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB2E898),
        iconTheme: IconThemeData(color: Colors.green[900]),
        title: Text(title, style: TextStyle(color: Colors.green[900])),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}