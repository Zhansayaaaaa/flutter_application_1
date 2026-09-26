import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isFollowing = false;
  int likes = 0;

  void followButton() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }

  void likeButton() {
    setState(() {
      likes = likes + 1;
    });
  }

  void resetButton() {
    setState(() {
      isFollowing = false;
      likes = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Avatar
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),

            // Name
            Text(
              "Mayra",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            // Profile information
            Text(
              "Flutter Student",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),

            Text(
              "IT Student",
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            SizedBox(height: 20),

            // Follow button
            ElevatedButton(
              onPressed: followButton,
              child: Text(
                isFollowing ? "Following" : "Follow",
              ),
            ),

            SizedBox(height: 20),

            // Like button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: () {
                    setState(() {
                      if (likes > 0) {
                        likes = likes - 1;
                      }
                    });
                  },
                  icon: Icon(Icons.remove),
                ),

                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),

                SizedBox(width: 10),

                Text(
                  "$likes",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),

                IconButton(
                  onPressed: likeButton,
                  icon: Icon(Icons.add),
                ),
              ],
            ),

            SizedBox(height: 20),

            // Reset button
            ElevatedButton(
              onPressed: resetButton,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}