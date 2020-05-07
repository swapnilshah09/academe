import 'package:academe/utils/text_field_validators.dart';
import 'package:flutter/material.dart';
import 'package:academe/components/buttons.dart';
import 'package:academe/components/fields.dart';
import 'package:academe/services/authentication_service.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> updateDetailsFormKey = GlobalKey<FormState>();
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  Future<Map> _userData;

  @override
  void initState() {
    super.initState();
    _userData = AuthenticationService.getLoggedInUserDataFromAPI();
  }

  @override
  void dispose() {
    super.dispose();
    _nameFieldController.dispose();
    _emailFieldController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _userData,
          builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['data'] == null) {
                if (snapshot.data['error'] == true) {
                  return Center(
                      child: Text('Error while loading data, please retry' +
                          snapshot.data['error']['cause']));
                }
                return Center(
                    child: Text('Error while loading data, please retry'));
              }
              Map userDataFromAPI = snapshot.data['data'];
              print('Name from API: ' + userDataFromAPI['name']);
              if (userDataFromAPI['name'] != null) {
                _nameFieldController.text = userDataFromAPI['name'];
              }
              if (userDataFromAPI['email'] != null) {
                _emailFieldController.text = userDataFromAPI['email'];
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
                child: Form(
                  key: updateDetailsFormKey,
                  child: ListView(
                    children: <Widget>[
                      Text('Full Name'),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 18.0),
                        child: Fields.borderedTextFormField(
                          controller: _nameFieldController,
                          textInputType: TextInputType.text,
                          validator: TextFieldValidators.nameValidator,
                        ),
                      ),
                      Text('Email ID'),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 42),
                        child: Fields.borderedTextFormField(
                          controller: _emailFieldController,
                          textInputType: TextInputType.emailAddress,
                          validator: TextFieldValidators.emailValidator,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Buttons.primary(
                            text: 'Update Details',
                            onTap: () {
                              if (updateDetailsFormKey.currentState
                                  .validate()) {
                                updateDetailsFormKey.currentState.save();

                                //PawfectDialogs().showLoadingDialog(context);
//                    Map<String, Object> result =
//                        await ProfileUpdateService().updateName(
//                        user.data,
//                        _nameFieldController.text.trim());
//                    Navigator.of(context, rootNavigator: true)
//                        .pop('dialog');
//                    if (result.containsKey('error')) {
//                      PawfectDialogs().showErrorDialog(
//                          context, 'Oops!', result['error']);
//                      return;
//                    }
//                    reloadStream();
//                    Scaffold.of(context).showSnackBar(SnackBar(
//                        content:
//                        Text('Name successfully updated.')));
                              }
                            }),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ChangePasswordDialog(),
                          );
                        },
                        child: Text(
                          'Change Password',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Error while loading data, please retry'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

class ChangePasswordDialog extends StatelessWidget {
  ChangePasswordDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Scrollbar(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 33, 33, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Current Password',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Fields.borderedTextFormField(
                      //controller: _couponController,
                      controller: null,
                      textInputType: TextInputType.text,
                      validator: TextFieldValidators.passwordValidator,
                    ),
                  ),
                  Text(
                    'New Password',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Fields.borderedTextFormField(
                      //controller: _couponController,
                      controller: null,
                      textInputType: TextInputType.text,
                      validator: TextFieldValidators.passwordValidator,
                    ),
                  ),
                  Text(
                    'Confirm New Password',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
                    child: Fields.borderedTextFormField(
                      //controller: _couponController,
                      controller: null,
                      textInputType: TextInputType.text,
                      validator: TextFieldValidators.passwordValidator,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(33, 0, 33, 33),
              child: Buttons.primary(
                  text: 'Change Password',
                  onTap: () {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
