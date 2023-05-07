import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo extends StatelessWidget {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  AndroidDeviceInfo? androidInfo;

  DeviceInfo({super.key});
  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfo.androidInfo;
  }

  Widget showCard(String name, String value) {
    return Card(
      color: Color.fromARGB(255, 177, 245, 245),
      child: ListTile(
        
        title: Text(
          "$name : $value",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 114, 198, 251),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          title: const Text('Información del dispositivo'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
              child: FutureBuilder<AndroidDeviceInfo>(
              future: getInfo(),
              builder: (context, snapshot) {
          final data = snapshot.data!;
          return Column(
            children: [
              showCard('Marca', data.brand!),
              showCard('Dispositivo', data.device!),
              showCard('Modelo', data.model!),
              showCard('Manufacturero', data.manufacturer!),
              showCard('Producto', data.product!),
              showCard('Hardware', data.hardware!),
              showCard('id', data.id!),
              showCard('Procesador', data.board!),
              showCard('Huella', data.fingerprint!),
              showCard('Es dispositivo fisico', data.isPhysicalDevice.toString()),
              showCard('Version de android', data.version.release.toString()),
              showCard('Version de SDK', data.version.sdkInt.toString()),
              showCard('Version de base de banda', data.version.baseOS.toString()),
              showCard('Version de seguridad', data.version.securityPatch.toString()),
              showCard('Version de codigo', data.version.codename.toString()),
              showCard('Version de preview', data.version.previewSdkInt.toString()),
              showCard('Caracteristicas', data.systemFeatures.toString()),
                            
            ],
          );
              },
            )),
        ));
  }
}