import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_aoo/core/utilits/my_cashe.dart';
import 'package:shop_aoo/core/utilits/my_cashe_keys.dart';
import 'package:shop_aoo/core/widgets/defaultButton.dart';
import 'package:shop_aoo/core/widgets/helper_function.dart';
import 'package:shop_aoo/features/shop_layout/manager/layout_cubit.dart';
import 'package:shop_aoo/core/utilits/screens.dart' as screens;

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          if (LayoutCubit.get(context).userModel.data == null) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.deepPurple,
            ));
          } else {
            LayoutCubit.get(context).nameController.text =
                LayoutCubit.get(context).userModel.data!.name.toString();
            LayoutCubit.get(context).emailController.text =
                LayoutCubit.get(context).userModel.data!.email.toString();
            LayoutCubit.get(context).phoneController.text =
                LayoutCubit.get(context).userModel.data!.phone.toString();
            return Form(
              key: LayoutCubit.get(context).globalKey,
              child: Column(
                children: [
                  if(state is PutProfileUpdateLoading)
                  const LinearProgressIndicator(color: Colors.deepPurple,),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: LayoutCubit.get(context).nameController,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        labelText: 'Name',
                        prefixIcon: Icon(Icons.person)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Name cant be empty!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: LayoutCubit.get(context).emailController,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'email cant be empty!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: LayoutCubit.get(context).phoneController,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        labelText: 'Phone',
                        prefixIcon: Icon(Icons.phone)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'phone cant be empty!';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: DefaultButton(
                          text: 'Update',
                          onPressed: () async{
                            if (LayoutCubit.get(context)
                                .globalKey
                                .currentState!
                                .validate()) {
                              await LayoutCubit.get(context).updateData(
                                  name: LayoutCubit.get(context)
                                      .nameController
                                      .text,
                                  email: LayoutCubit.get(context)
                                      .emailController
                                      .text,
                                  phone: LayoutCubit.get(context)
                                      .phoneController
                                      .text);
                              HelperFunction.flutterToast(context, message: 'Updated', color: Colors.green);
                            }
                          })),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: DefaultButton(text: 'Logout', onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, screens.loginScreen, (route) => false);
                        MyCache.removeFromCache(key: MyCacheKeys.userToken);
                      })),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
