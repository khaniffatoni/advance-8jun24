import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../commons/constant.dart';
import '../../provider/main_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
              Text('Nama : Gustav'),
              Text('Domisili : Jakarta'),
              SizedBox(
                height: 20,
              ),
              Text('Gender :'),
              RadioListTile(
                value: 'Male',
                groupValue: provider.genderSelected,
                title: Text('Male'),
                onChanged: (value) =>
                    context.read<MainProvider>().selectGender(value ?? '-'),
              ),
              RadioListTile(
                value: 'Female',
                groupValue: provider.genderSelected,
                title: Text('Female'),
                onChanged: (value) =>
                    context.read<MainProvider>().selectGender(value ?? '-'),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Agama'),
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
              Container(
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
