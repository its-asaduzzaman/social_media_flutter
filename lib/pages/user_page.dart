import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_flutter/components/my_back_button.dart';
import 'package:social_media_flutter/helper/helper_function.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          //any error
          if (snapshot.hasError) {
            displayMessageToUser("something went wrong", context);
          }

          //loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Text("No Data");
          }

          //get all users
          final users = snapshot.data!.docs;
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 25),
                child: Row(
                  children: [
                    MyBackButton(),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    //get individual user
                    final user = users[index];
                    return ListTile(
                      title: Text(user['username']),
                      subtitle: Text(user['email']),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
