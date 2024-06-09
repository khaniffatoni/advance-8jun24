import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../commons/constant.dart';
import '../../provider/main_provider.dart';

class ProfilePage extends StatelessWidget {
  final String username;
  const ProfilePage(this.username, {super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<MainProvider>();
    return ListView(
      children: [
        Image.network(
            'https://marketplace.canva.com/EAFHfL_zPBk/1/0/1600w/canva-yellow-inspiration-modern-instagram-profile-picture-kpZhUIzCx_w.jpg'),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Namas : $username'),
              const Text('Domisili : Jakarta'),
              const SizedBox(
                height: 20,
              ),
              const Text('Gender :'),
              RadioListTile(
                value: 'Male',
                groupValue: provider.genderSelected,
                title: const Text('Male'),
                onChanged: (value) =>
                    context.read<MainProvider>().selectGender(value ?? '-'),
              ),
              RadioListTile(
                value: 'Female',
                groupValue: provider.genderSelected,
                title: const Text('Female'),
                onChanged: (value) =>
                    context.read<MainProvider>().selectGender(value ?? '-'),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Agama'),
                  DropdownButton(
                    value: provider.religionSelected,
                    items: listReligions
                        .map((element) => DropdownMenuItem(
                            value: element, child: Text(element)))
                        .toList(),
                    onChanged: (value) {
                      context.read<MainProvider>().selectReligion(value ?? '');
                    },
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 2,
                child: ListView(
                    children: listHobbies
                        .map(
                          (elementHobby) => CheckboxListTile(
                            value: provider.hobbySelected.contains(elementHobby)
                                ? true
                                : false,
                            title: Text(elementHobby),
                            controlAffinity: ListTileControlAffinity.leading,
                            onChanged: (value) => context
                                .read<MainProvider>()
                                .selectHobby(elementHobby),
                          ),
                        )
                        .toList()),
              )
            ],
          ),
        )
      ],
    );
  }
}
