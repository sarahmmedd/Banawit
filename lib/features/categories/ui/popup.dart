import 'package:flutter/material.dart';
import 'package:banawit/core/theme/app_colors.dart';

class Popup extends StatefulWidget {
  const Popup({super.key});

  @override
  State<Popup> createState() => _PopupState();
}

class _PopupState extends State<Popup> {
  final TextEditingController controller = TextEditingController();

  String selectedIcon = '🍔';

  final List<String> icons = [
    '🍔',
    '🚒',
    '🛍',
    '🎬',
    '💊',
    '💰',
    '🏠',
    '✈️',
    '🎮',
    '📚',
    '☕️',
    '🎵',
    '💪',
    '🐱',
    '🌸',
    '🎨',
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
<<<<<<< HEAD
        padding:EdgeInsets.all(20),
=======
        padding: EdgeInsets.all(20),
>>>>>>> budget_states
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
<<<<<<< HEAD
                   Text(
=======
                  Text(
>>>>>>> budget_states
                    "Add Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),

<<<<<<< HEAD
               SizedBox(height: 16),

              /// NAME
               Text(
=======
              SizedBox(height: 16),

              /// NAME
              Text(
>>>>>>> budget_states
                "Category Name",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

<<<<<<< HEAD
               SizedBox(height: 8),
=======
              SizedBox(height: 8),
>>>>>>> budget_states

              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "e.g Education",
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

<<<<<<< HEAD
               SizedBox(height: 20),

              /// ICONS
               Text(
=======
              SizedBox(height: 20),

              /// ICONS
              Text(
>>>>>>> budget_states
                "Choose Icon",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

<<<<<<< HEAD
               SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                itemCount: icons.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
=======
              SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: icons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
>>>>>>> budget_states
                  crossAxisCount: 8,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemBuilder: (context, index) {
                  final icon = icons[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIcon = icon;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: selectedIcon == icon
<<<<<<< HEAD
                            ?  Color(0xFFFFE0EF)
=======
                            ? Color(0xFFFFE0EF)
>>>>>>> budget_states
                            : Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                        border: selectedIcon == icon
                            ? Border.all(color: AppColors.primary, width: 2)
                            : null,
                      ),
                      child: Center(
<<<<<<< HEAD
                        child: Text(icon, style:  TextStyle(fontSize: 20)),
=======
                        child: Text(icon, style: TextStyle(fontSize: 20)),
>>>>>>> budget_states
                      ),
                    ),
                  );
                },
              ),

<<<<<<< HEAD
               SizedBox(height: 20),
=======
              SizedBox(height: 20),
>>>>>>> budget_states
              // BUTTONS
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
<<<<<<< HEAD
                      child:  Text("Cancel"),
                    ),
                  ),

                   SizedBox(width: 12),
=======
                      child: Text("Cancel"),
                    ),
                  ),

                  SizedBox(width: 12),
>>>>>>> budget_states

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      onPressed: () {
                        if (controller.text.trim().isEmpty) return;

                        Navigator.pop(context, {
                          "title": controller.text.trim(),
                          "emoji": selectedIcon,
                        });
                      },
<<<<<<< HEAD
                      child:  Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
=======
                      child: Text("Add", style: TextStyle(color: Colors.white)),
>>>>>>> budget_states
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
