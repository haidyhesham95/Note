import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:note/shared_utils/styles/colors.dart';
import '../View/edit_note.dart';
import 'note_item.dart';

class NoteGrid extends StatefulWidget {
  const NoteGrid({Key? key}) : super(key: key);

  @override
  _NoteGridState createState() => _NoteGridState();
}

class _NoteGridState extends State<NoteGrid> {
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;

  Future<void> getData() async {
    FirebaseFirestore.instance.collection('notes').snapshots().listen((querySnapshot) {
      setState(() {
        data = querySnapshot.docs;
        isLoading = false;
      });
    });
  }

  String formattedData(dynamic data) {
    try {
      Timestamp? timeStamp = data['date'];
      var dateFromTimeStamp = DateTime.fromMicrosecondsSinceEpoch(timeStamp!.seconds * 1000);
      return DateFormat('dd-MM-yyyy hh:mm a').format(dateFromTimeStamp);
    } catch (e) {
      print("Error in formattedData: $e");
      return 'N/A';
    }
  }





  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? const Center(
      child: CircularProgressIndicator(
        color: ColorsAsset.kBrown,
      ),
    )
        : Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 40.h,
          crossAxisSpacing: 10.w,
          crossAxisCount: 2,
          mainAxisExtent: 205.h,
        ),
        itemBuilder: (context, index) {
          return NoteItem(
            onTapDelete: () async {
              await FirebaseFirestore.instance.collection('notes').doc(data[index].id).delete();
            },
            onTapEdit: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditNote(
                    oldSubTitle: data[index]['content'],
                    oldTitle: data[index]['name'],
                    docId: data[index].id,
                  ),
                ),
              );
            },
           // date: formattedData(data[index]['date']),
            date: formattedData(data[index]),

            title: "${data[index]['name']}",
            content: "${data[index]['content']}",
          );
        },
      ),
    );
  }
}


