import 'package:ProtonNotes/models/protonNote.dart';
import 'package:flutter/material.dart';

class NoteCustomization extends StatefulWidget {
  final ProtonNote protonNote;

  NoteCustomization({this.protonNote});

  @override
  _NoteCustomizationState createState() => _NoteCustomizationState();
}

class _NoteCustomizationState extends State<NoteCustomization> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  String _titleError;
  Color scaffoldColor = Color(0xffFCDA9C);
  var iconNote = Icons.account_balance;

  @override
  void initState() {
    super.initState();
    if (widget.protonNote != null) {
      _titleController.text = widget.protonNote.title;
      _noteController.text = widget.protonNote.note;
    }
  }

  @override
  void dispose() {
    _titleController.clear();
    _noteController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: Color(0xff303030),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialogFunc(context, true);
                  },
                  child: Container(
                    width: 40,
                    color: scaffoldColor,
                  ),
                ),
                SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    showDialogFunc(context, false);
                  },
                  child: CircleAvatar(
                      backgroundColor: Colors.white, child: Icon(iconNote)),
                ),
                SizedBox(width: 20.0)
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Titulo',
                    border: InputBorder.none,
                    errorText: _titleError,
                  ),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _noteController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nota',
                  ),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                    _validateFields();
                  },
                  child: Text(
                    'Guardar',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showDialogFunc(context, bool isColor) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(25),
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
                child: colorColumn(isColor),
              ),
            ),
          );
        });
  }

  colorColumn(isColor) {
    if (isColor == true) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              colorSelected(Color(0xfff898A4)),
              colorSelected(Color(0xffFCDA9C)),
              colorSelected(Color(0xffF7FAA1)),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              colorSelected(Color(0xffB4F6A4)),
              colorSelected(Color(0xff9BE0F1)),
              colorSelected(Color(0xffA2ACEB)),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconSelected(Icons.add),
              iconSelected(Icons.ac_unit_outlined),
              iconSelected(Icons.account_balance),
            ],
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconSelected(Icons.baby_changing_station),
              iconSelected(Icons.cached),
              iconSelected(Icons.face),
            ],
          ),
        ],
      );
    }
  }

  GestureDetector colorSelected(color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          scaffoldColor = color;
        });
        Navigator.pop(context);
      },
      child: Container(width: 60, height: 60, color: color),
    );
  }

  GestureDetector iconSelected(icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          iconNote = icon;
        });
        Navigator.pop(context);
      },
      child: Container(
          width: 60,
          height: 60,
          child: CircleAvatar(
              backgroundColor: Colors.grey[300], child: Icon(icon))),
    );
  }

  void _validateFields() {
    var hasError = false;
    if (_titleController.text.trim().isEmpty) {
      hasError = true;
      setState(() {
        _titleError = 'El titulo no puede ser vacio';
      });
    }

    if (!hasError) {
      _saveProtonNote();
    }
  }

  void _saveProtonNote() {
    var protonNote = ProtonNote(
      title: _titleController.text,
      note: _noteController.text,
    );
    Navigator.of(context).pop(protonNote);
  }
}
