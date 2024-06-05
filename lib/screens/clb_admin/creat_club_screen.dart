import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/model/clb_list.dart';



class CreateClubScreen extends StatefulWidget {
  final void Function(Club) onAddClub;
  final void Function(int, Club) onUpdateClub;
  final Club? club;
  final int? index;

  CreateClubScreen({
    required this.onAddClub,
    required this.onUpdateClub,
    this.club,
    this.index,
  });

  @override
  _CreateClubScreenState createState() => _CreateClubScreenState();
}

class _CreateClubScreenState extends State<CreateClubScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ownerController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _imagePath = '';
  DateTime selectedDate = DateTime.now();
  final TextEditingController _activeYearsController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (widget.club != null) {
      _nameController.text = widget.club!.name;
      _ownerController.text = widget.club!.owner;
      _locationController.text = widget.club!.location;
      _descriptionController.text = widget.club!.description;
      _imagePath = widget.club!.imageUrl;
      selectedDate = widget.club!.foundingDate;
      _activeYearsController.text = widget.club!.activeYears.toString();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
      });
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget _buildDateButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _selectDate(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey.shade100,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: selectedDate != null
                ? Text(
              "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            )
                : IconButton(
              icon: Icon(Icons.calendar_today, size: 20),
              onPressed: () => _selectDate(context),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final club = Club(
        name: _nameController.text,
        owner: _ownerController.text,
        location: _locationController.text,
        description: _descriptionController.text,
        imageUrl: _imagePath,
        foundingDate: selectedDate,
        activeYears: int.parse(_activeYearsController.text),
        members: [],
      );

      if (widget.index == null) {
        widget.onAddClub(club);
      } else {
        widget.onUpdateClub(widget.index!, club);
      }

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo CLB Mới'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: _imagePath.isNotEmpty ? FileImage(File(_imagePath)) : null,
                  child: _imagePath.isEmpty
                      ? Icon(Icons.camera_alt, size: 80, color: Colors.grey)
                      : null,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.camera),
                    child: Text('Chụp ảnh'),
                  ),
                  ElevatedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: Text('Chọn ảnh từ thư viện'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Tên Câu Lạc Bộ', labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Xin nhập tên câu lạc bộ của bạn';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _ownerController,
                decoration: const InputDecoration(labelText: 'Người sở hữu', labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập đầy đủ thông tin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Địa chỉ', labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập đầy đủ thông tin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Mô tả', labelStyle: TextStyle(fontSize: 18)),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập đầy đủ thông tin';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _activeYearsController,
                decoration: const InputDecoration(labelText: 'Số năm hoạt động', labelStyle: TextStyle(fontSize: 18)),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Vui lòng nhập đầy đu thông tin. VD: '9'";
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Text('Ngày thành lập:', style: TextStyle(fontSize: 18)),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: _buildDateButton(context),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 150,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(widget.index == null ? 'Tạo câu lạc bộ' : 'Update Club', style: TextStyle(fontSize: 20,color: Colors.white,),),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
