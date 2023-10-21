import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/firebase_sevices/storage.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/shared/snackbar.dart';

class AuthMethods {
  late String message;
  register({
    required email,
    required password,
    required context,
    required username,
    required title,
    required imgName,
    required imgPath,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      String urlll = await getImgURL(
          imgName: imgName, imgPath: imgPath, folderName: 'profileIMG');
      // firebase firestore (Database)
      CollectionReference users =
          FirebaseFirestore.instance.collection('userSSS');

      UserDate userr = UserDate(
        email: email,
        password: password,
        title: title,
        username: username,
        profileImg: urlll,
        uid: credential.user!.uid,
        followers: [],
        following: [],
      );

      users
          .doc(credential.user!.uid)
          .set(userr.convert2Map())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      message = " Registered & User Added 2 DB ♥";
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print(e);
    }
  }

  signIn({required emailll, required passworddd, required context}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailll, password: passworddd);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print(e);
    }
  }

// functoin to get user details from Firestore (Database)
  Future<UserDate> getUserDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('userSSS')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    return UserDate.convertSnap2Model(snap);
  }
}
