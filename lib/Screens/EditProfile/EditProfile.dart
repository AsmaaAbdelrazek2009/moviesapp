import 'package:flutter/material.dart';
import 'package:moviesapp/Models/AppConstans/AppConstans.dart';
import 'package:moviesapp/Screens/LoginTypes/Login/LoginScreen.dart';
import 'package:moviesapp/Utilites/AppAssets.dart';
import 'package:moviesapp/Utilites/AppTextStyles.dart';
import '../../Models/UserDataModel/useerDM.dart';
import '../../FirebaseUtilities/userCollections.dart';
import '../../Utilites/AppColors.dart';
import '../../Widgets/Button.dart';
import '../../Widgets/TextFiled.dart';
import '../Navigations/ProfilePage/ProfilePage.dart';

class EditProfile extends StatefulWidget {
   EditProfile({super.key});


   @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedAvatar = UserDM.currentUser?.imgPath ?? AppAssets.gamer2;

  @override
  void initState() {
    super.initState();
    nameController.text = UserDM.currentUser?.name ?? "";
    phoneController.text = UserDM.currentUser?.phone ?? "";
  }

  @override
  Widget build(BuildContext context) {
    List<String> avatarpicker = AvatarPicker;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Edit Profile", style: AppTextStyles.yellowText400mediam16),
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: AppColors.yellow,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    buildAvatarpickerBottomSheet(context, avatarpicker);
                  },
                  child: Image.asset(selectedAvatar, height: 150),
                ),
              ),
              SizedBox(height: 19),
              TextField1(
                controller: nameController,
                lableTitle: "name",
                icon1: Icon(Icons.person),
                onChanged: (value) {},
              ),
              SizedBox(height: 19),
              TextField1(
                controller: phoneController,
                lableTitle: "phone",
                icon1: Icon(Icons.person),
                onChanged: (value) {},
              ),
              SizedBox(height: 38),
              InkWell(
                onTap: () {},
                child: Text(
                  "Reset Password",
                  style: AppTextStyles.whitesubHeader400mediam20,
                ),
              ),
              SizedBox(height: 250),
              AppButton(
                text: "Delete Account",
                color1: AppColors.red,
                color2: AppColors.red,
                TextColor: AppColors.white,
                onPressed: () async{
                  bool result = await MyDatabase.deleteAccount();
                  if (result && mounted) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  }

                },
              ),
              SizedBox(height: 0),
              AppButton(
                text: "update Data",
                color1: AppColors.yellow,
                color2: AppColors.yellow,
                TextColor: AppColors.black,
                onPressed: () {
                  handleUpdate();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildAvatarpickerBottomSheet(BuildContext context, List<String> avatarpicker,) {
    var isSelected=0;
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 389,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            border: Border.all(color: AppColors.yellow),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text("Pick Avatar", style: AppTextStyles.yellowText400mediam16),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: avatarpicker.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){

                          setState(() {
                            selectedAvatar = avatarpicker[index];
                          });
                          Navigator.pop(context);

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected==index ?AppColors.yellow:AppColors.black,
                            border: Border.all(color: AppColors.yellow, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(13),
                            child: Image.asset(avatarpicker.elementAt(index)),
                          ),
                        ),

                    );
                  },
                ),
              ), //
            ],
          ),
        );
      },
    );
  }

  void handleUpdate() async {

    UserDM updatedUser = UserDM(
      id: UserDM.currentUser!.id,
      name: nameController.text,
      phone: phoneController.text,
      email: UserDM.currentUser!.email,
      imgPath: selectedAvatar,
    );

    await MyDatabase.updateUserInFirestore(updatedUser);

    UserDM.currentUser = updatedUser;

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Profile Updated Successfully")),
    );
  }
}
