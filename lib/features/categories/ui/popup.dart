import 'package:banawit/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {

  final TextEditingController _controller = TextEditingController();

  final List<String> _icons = const [
    '🍔','🚒','🛍','🎬','💊','💰','🏠','✈️',
    '🎮','📚','☕️','🎵','💪','🐱','🌸','🎨',
  ];

  String selectedIcon = '🍔';

  @override
  Widget build(BuildContext context) {
     return  Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ---- Header ----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    'Add Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
               SizedBox(height: 16),

              // ---- Category Name ----
               Text(
                'Category Name',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
               SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: 'e.g., Education',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
               SizedBox(height: 20),

              // ---- Choose Icon ----
               Text(
                'Choose Icon',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              ),
               SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: _icons.length,
                itemBuilder: (context, index) {
                  final icon = _icons[index];
                  return GestureDetector(
                    onTap: () {}, // هيتكتب في الـ Cubit
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(icon, style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  );
                },
              ),
               SizedBox(height: 20),

              // ---- Preview ----
              // Container(
              //   width: double.infinity,
              //   padding:  EdgeInsets.symmetric(vertical: 20),
              //   decoration: BoxDecoration(
              //     color:  Color(0xFFFCE4EC),
              //     borderRadius: BorderRadius.circular(16),
              //   ),
              //   child: Column(
              //     children: [
              //       Text(
              //         'Preview',
              //         style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
              //       ),
              //       SizedBox(height: 12),
              //       // الأيكون والاسم هيجوا من الـ Cubit
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 20),
              // ---- Buttons ----
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding:  EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: Colors.grey[300]!),
                      ),
                      child:  Text('Cancel', style: TextStyle(color: Colors.grey)),
                    ),
                  ),
                   SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {}, // هيتكتب في الـ Cubit
                      style: ElevatedButton.styleFrom(
                        padding:  EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child:  Text('Add', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}