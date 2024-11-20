import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/components/my_drawer.dart';
import 'package:social_media_flutter/components/my_post_button.dart';
import 'package:social_media_flutter/components/my_textfield.dart';
import 'package:social_media_flutter/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  //text controller
  final TextEditingController newPostController = TextEditingController();

  //post message
  void postMessage() {
    //only post this message if there  is something in the text field
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }

    //clear the controller
    newPostController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("W A L L"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          //text field box for user to type something
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                //text button
                Expanded(
                  child: MyTextField(
                    hintText: "say something",
                    obscureText: false,
                    controller: newPostController,
                  ),
                ),
                //post button
                MyPostButton(onTap: postMessage),
              ],
            ),
          )
        ],
      ),
    );
  }
}
