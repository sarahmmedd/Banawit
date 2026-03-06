<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:banawit/core/theme/app_colors.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Gradient Header
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, const Color(0xFFFF7FA8)],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.r),
                ),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monthly Budget",
                        style: TextStyle(
                          color: AppColors.cardBackground,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
=======
import 'package:banawit/features/home/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/budget_bloc.dart';
import '../cubit/budget_event.dart';
import '../cubit/budget_state.dart';

class BudgetScreen extends StatefulWidget {
  const BudgetScreen({super.key});

  @override
  State<BudgetScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BudgetScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5E8EC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 170,
              padding: const EdgeInsets.symmetric(vertical: 30),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF5F9E), Color(0xFFFF2E63)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      GestureDetector(
                        child: const CircleAvatar(
                          backgroundColor: Color.fromARGB(84, 255, 255, 255),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 22),
                      const Text(
                        "Monthly Budget",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
>>>>>>> budget_states
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),
<<<<<<< HEAD
      

=======

            /// SET BUDGET CARD
>>>>>>> budget_states
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
<<<<<<< HEAD
                
=======
>>>>>>> budget_states
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
<<<<<<< HEAD
                            colors: [Color(0xFFFF5F9E), Color(0xFFFF2E63)],),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
=======
                            colors: [Color(0xFFFF5F9E), Color(0xFFFF2E63)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
>>>>>>> budget_states
                          Icons.trending_up,
                          color: Colors.white,
                        ),
                      ),
<<<<<<< HEAD
                      SizedBox(width: 12),
                      Text(
=======
                      const SizedBox(width: 12),
                      const Text(
>>>>>>> budget_states
                        "Set Monthly Budget",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  const SizedBox(height: 20),
=======

                  const SizedBox(height: 20),

>>>>>>> budget_states
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
<<<<<<< HEAD
                      children: const [
                        Text("\$", style: TextStyle(fontSize: 18)),
                        SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
=======
                      children: [
                        const Text("\$", style: TextStyle(fontSize: 18)),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
>>>>>>> budget_states
                              hintText: "0",
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
<<<<<<< HEAD
      
                  const SizedBox(height: 20),
      
                  // Save Button
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFFF5F9E), Color(0xFFFF2E63)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            "Save Budget",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
=======

                  const SizedBox(height: 20),

                  GestureDetector(
                    onTap: () {
                      final amount = double.tryParse(_controller.text) ?? 0;
                      context.read<BudgetBloc>().add(SetBudget(amount));
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF5F9E), Color(0xFFFF2E63)],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Save Budget",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
>>>>>>> budget_states
                      ),
                    ),
                  ),
                ],
              ),
<<<<<<< HEAD
            ),     
            const SizedBox(height: 25),
      
            
=======
            ),

            const SizedBox(height: 25),

            /// BUDGET OVERVIEW
            BlocBuilder<BudgetBloc, BudgetState>(
              builder: (context, state) {
                if (state.budget == 0) return const SizedBox();

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Budget Overview",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Row(
                        children: const [
                          Text(
                            "spent",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Spacer(),
                          Text(
                            "0%",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 5),

                      LinearProgressIndicator(
                        value: state.percentage,
                        minHeight: 15,
                        borderRadius: BorderRadius.circular(10),
                        backgroundColor: Colors.pink[100],
                      ),

                      const SizedBox(height: 15),

                      /// FIXED ROW
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(205, 243, 229, 234),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Budget",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "\$${state.budget.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(205, 243, 229, 234),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Spent",
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "\$${state.spent.toStringAsFixed(2)}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.pink[500],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(169, 200, 230, 201),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Remaining",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "\$${state.remaining.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.green[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            /// TIPS
>>>>>>> budget_states
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
<<<<<<< HEAD
                
              ),
              child: Column(
=======
              ),
              child: const Column(
>>>>>>> budget_states
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Budget Tips",
<<<<<<< HEAD
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text("• Set a realistic budget based on your income", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  Text("• Track your expenses daily to stay on target", style: TextStyle(fontSize: 14)),
                  SizedBox(height: 10),
                  Text("• Review and adjust your budget monthly", style: TextStyle(fontSize: 14)),
                  
                ],
              ),
            ),
            const SizedBox(height: 40),
          
=======
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 15),
                  Text("• Set a realistic budget based on your income"),
                  SizedBox(height: 10),
                  Text("• Track your expenses daily to stay on target"),
                  SizedBox(height: 10),
                  Text("• Review and adjust your budget monthly"),
                ],
              ),
            ),

            const SizedBox(height: 40),
>>>>>>> budget_states
          ],
        ),
      ),
    );
  }
}
