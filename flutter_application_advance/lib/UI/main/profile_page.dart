import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.network(
            'https://marketplace.canva.com/EAFHfL_zPBk/1/0/1600w/canva-yellow-inspiration-modern-instagram-profile-picture-kpZhUIzCx_w.jpg'),
        Card(
          child: Column(
            children: [
              Text('Nama : Gustav'),
              Text('Jenis Kelamin : Pria'),
              Text('Domisili : Jakarta'),
            ],
          ),
        )
      ],
    );
  }
}
