import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_monday_m1/core/controller/cubit/cubit.dart';
import 'package:group_monday_m1/core/controller/cubit/state.dart';
import 'package:group_monday_m1/core/shared/widgets/my_text_form_field.dart';
import 'package:intl/intl.dart';




class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDataFromDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppInsertDataFromDatabase){
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            key: cubit.scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              automaticallyImplyLeading: false,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isShowBottomSheet) {
                  if(cubit.formKey.currentState!.validate()){
                    cubit.insertDataFromDatabase(
                      title: cubit.titleController.text,
                      time: cubit.timeController.text,
                      date: cubit.dateController.text,
                    );
                    cubit.changeFabIcon(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  }
                } else {
                  cubit.scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.all(
                              20.0,
                            ),
                            child: Form(
                              key: cubit.formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyTextFormField(
                                    controller: cubit.titleController,
                                    type: TextInputType.text,
                                    label: 'title',
                                    prefix: Icons.title,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Title must be not empty';
                                      }
                                      return null;
                                    },
                                    radius: 15.0,
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  MyTextFormField(
                                    controller: cubit.timeController,
                                    type: TextInputType.datetime,
                                    label: 'time',
                                    prefix: Icons.watch_later_outlined,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Time must be not empty';
                                      }
                                      return null;
                                    },
                                    radius: 15.0,
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      ).then(
                                        (value) {
                                          if (value != null) {
                                            if (context.mounted) {
                                              cubit.timeController.text =
                                                  value.format(context);
                                              print(value.format(context));
                                            }
                                          }
                                        },
                                      );
                                    },
                                  ),
                                  const SizedBox(
                                    height: 20.0,
                                  ),
                                  MyTextFormField(
                                    controller: cubit.dateController,
                                    type: TextInputType.datetime,
                                    label: 'date',
                                    prefix: Icons.calendar_month,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Date must be not empty';
                                      }
                                      return null;
                                    },
                                    radius: 15.0,
                                    onTap: () {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      showDatePicker(
                                        context: context,
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.parse(
                                          '2024-12-31',
                                        ),
                                      ).then(
                                        (value) {
                                          if (value != null) {
                                            if (context.mounted) {
                                              cubit.dateController.text =
                                                  DateFormat.yMMMd()
                                                      .format(value);
                                              print(DateFormat.yMMMd()
                                                  .format(value));
                                            }
                                          }
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then(
                    (value) {
                      // setState(() {
                      //   isShowBottomSheet = false;
                      //   fabIcon = Icons.edit;
                      // });
                      cubit.changeFabIcon(
                        isShow: false,
                        icon: Icons.edit,
                      );
                    },
                  );
                  // setState(() {
                  //   isShowBottomSheet = true;
                  //   fabIcon = Icons.add;
                  // });
                  cubit.changeFabIcon(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  30.0,
                ),
              ),
              child: Icon(
                cubit.fabIcon,
                color: Colors.white,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                // setState(() {
                //   currentIndex = index;
                // });
                cubit.changeBottomNav(index);
              },
              type: BottomNavigationBarType.fixed,
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
