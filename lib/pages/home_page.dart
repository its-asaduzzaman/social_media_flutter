import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/components/my_drawer.dart';
import 'package:social_media_flutter/components/my_post_button.dart';
import 'package:social_media_flutter/components/my_textfield.dart';
import 'package:social_media_flutter/database/firestore.dart';

import '../components/my_list_tile.dart';

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
        title: const Text("F E E D"),
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
          ),
          StreamBuilder(
            stream: database.getPostStream(),
            builder: (context, snapshot) {
              //show loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              //get all post

              final posts = snapshot.data!.docs;

              //no data?
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No post.. Post Something!"),
                  ),
                );
              }

              //return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    //get post individual post
                    final post = posts[index];

                    //get data from each post
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];
                    Timestamp timestamp = post['TimeStamp'];

                    //return as a list tile
                    return MyListTile(title: message, subtitle: userEmail);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
