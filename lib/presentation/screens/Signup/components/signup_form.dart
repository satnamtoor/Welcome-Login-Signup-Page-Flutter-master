import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

import '../../../../components/already_have_an_account_acheck.dart';
import '../../../../constants/constants.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends StatefulWidget {

  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return _SignUpForm();
  }


}
  class _SignUpForm extends State<SignUpForm> {
    /**
     * Date controllers
     */

    final TextEditingController _dateDOA = TextEditingController();
    final TextEditingController _dateDOB = TextEditingController();
    final TextEditingController _dateValidUpto = TextEditingController();

    /**
     * Edit text controllers
     */

    final TextEditingController _controllerName = TextEditingController();
    final TextEditingController _controllerPassword = TextEditingController();
    final TextEditingController _controllerFatherName = TextEditingController();
    final TextEditingController _controllerBranch = TextEditingController();
    final TextEditingController _controllerPFNo = TextEditingController();
    final TextEditingController _controllerDivision = TextEditingController();
    final TextEditingController _controllerDesignation = TextEditingController();
    final TextEditingController _controllerHQ = TextEditingController();
    final TextEditingController _controllerCAN = TextEditingController();
    final TextEditingController _controllerPassNo = TextEditingController();
    final TextEditingController _controllerIncAmt = TextEditingController();
    final TextEditingController _controllerIncPer = TextEditingController();


    @override
    void initState() {
      _dateDOA.text = "";
      _dateDOB.text = "";
      _dateValidUpto.text = "";
      _controllerName.text="";
      _controllerPassword.text="";
      _controllerFatherName.text="";
      _controllerBranch.text="";
      _controllerPFNo.text="";
      _controllerDivision.text="";
      _controllerDesignation.text="";
      _controllerHQ.text="";
      _controllerCAN.text="";
      _controllerPassNo.text="";
      _controllerIncAmt.text="";
      _controllerIncPer.text="";


      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _controllerName,
            decoration: const InputDecoration(
              hintText: "Your Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: _controllerPassword,
              decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.password),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              controller: _controllerFatherName,
              decoration: const InputDecoration(
                hintText: "Father Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.face),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _dateDOA,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "DOA",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.date_range_outlined),
                ),
              ),
              readOnly: true,  // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime.now()
                );

                if(pickedDate != null ){
                  if (kDebugMode) {
                    print(pickedDate);
                  }  //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  setState(() {
                    _dateDOA.text =
                        formattedDate; //set output date to TextField value.
                  });
                }else{
                  if (kDebugMode) {
                    print("Date is not selected");
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _dateDOB,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "DOB",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.date_range),
                ),
              ),
              readOnly: true,  // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(), //get today's date
                    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime.now()
                );

                if(pickedDate != null ){
                  if (kDebugMode) {
                    print(pickedDate);
                  }  //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  setState(() {
                    _dateDOB.text =
                        formattedDate; //set output date to TextField value.
                  });
                }else{
    if (kDebugMode) {
      print("Date is not selected");
    }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _controllerBranch,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Branch",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.branding_watermark),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _controllerPFNo,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "PF No",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.numbers),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _controllerDivision,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Division",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.developer_board),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _controllerDesignation,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Designation",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.description),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: _controllerHQ,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "HQ",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.question_answer_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _controllerCAN,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "CAN",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.check_box),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _dateValidUpto,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Valid upto",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.check_circle_outline_outlined),
                ),
              ),
              readOnly: true, // when true user cannot edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),//get today's date
                    firstDate: DateTime.now(),// - not to allow to choose before today.
                    lastDate: DateTime(2101)
                );

                if(pickedDate != null ){
                  if (kDebugMode) {
                    print(pickedDate);
                  }  //get the picked date in the format => 2022-07-04 00:00:00.000
                  String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                  setState(() {
                    _dateValidUpto.text =
                        formattedDate; //set output date to TextField value.
                  });
                }else{
                  if (kDebugMode) {
                    print("Date is not selected");
                  }
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: _controllerPassNo,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Pass No.",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.paste_sharp),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              signUpValidations();
              print("button--click");
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
    void signUpValidations () {

    if(_controllerName.text.isEmpty)
      {
        Toast.show("Please enter user name.", duration: Toast.lengthShort, gravity:  Toast.center);
      }
    else if(_controllerName.text.length<4)
    {
      Toast.show("Please enter user more then 3 characters.", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else if(_controllerPassword.text.isEmpty)
    {
      Toast.show("Please enter password", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else if(_controllerPassword.text.length<5)
    {
      Toast.show("Please enter password more then 4 characters.", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else if(_controllerFatherName.text.isEmpty)
    {
      Toast.show("Please enter father name", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else if(_controllerFatherName.text.length<3)
    {
      Toast.show("Please enter correct father name.", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else if(_dateDOA.text.isEmpty)
    {
      Toast.show("Please enter DOA", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else if(_dateDOB.text.isEmpty)
    {
      Toast.show("Please enter DOB", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else if(_controllerHQ.text.isEmpty)
    {
      Toast.show("Please enter HQ", duration: Toast.lengthShort, gravity:  Toast.center);
    }
    else{


      Toast.show("use git pull command--", duration: Toast.lengthShort, gravity:  Toast.center);

    }



    }
    getDriversList() async {
      DatabaseReference starCountRef =
      FirebaseDatabase.instance.ref('/TrainMaster/AgQtd8dnkC5VgJwPbxaU');
      starCountRef.onValue.listen((DatabaseEvent event) {
        final data = event.snapshot.value;
        print(data);
        //updateStarCount(data);
      });
    }

}