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
        padding:EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    "Add Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close),
                  ),
                ],
              ),

               SizedBox(height: 16),

              /// NAME
               Text(
                "Category Name",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

               SizedBox(height: 8),

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

               SizedBox(height: 20),

              /// ICONS
               Text(
                "Choose Icon",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),

               SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                itemCount: icons.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
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
                            ?  Color(0xFFFFE0EF)
                            : Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                        border: selectedIcon == icon
                            ? Border.all(color: AppColors.primary, width: 2)
                            : null,
                      ),
                      child: Center(
                        child: Text(icon, style:  TextStyle(fontSize: 20)),
                      ),
                    ),
                  );
                },
              ),

               SizedBox(height: 20),
              // BUTTONS
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child:  Text("Cancel"),
                    ),
                  ),

                   SizedBox(width: 12),

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
                      child:  Text(
                        "Add",
                        style: TextStyle(color: Colors.white),
                      ),
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
