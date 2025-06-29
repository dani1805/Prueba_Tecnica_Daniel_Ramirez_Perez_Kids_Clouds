// ignore_for_file: type_literal_in_constant_pattern

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/helpers/assets.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/widgets/standard_app_bar.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/widgets/standard_button.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/widgets/standard_kids_item.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/widgets/standard_loading.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Size size;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(HomePageLoaded());
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: StandardAppBar(
        elevation: 0,
        background: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: PopupMenuButton<int>(
              icon: Icon(Icons.menu, color: Colors.white),
              onSelected: (int item) {
                context.read<HomeBloc>().add(ButtonChildPressed(child: item));
              },
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<int>>[
                    PopupMenuItem<int>(
                      value: 0,
                      child: StandardKidsItem(
                        image: Assets.appKidsIcon,
                        title: 'Daniel',
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: StandardKidsItem(
                        image: Assets.appKidsIcon,
                        title: 'Hugo',
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: StandardKidsItem(
                        image: Assets.appKidsIcon,
                        title: 'Ana',
                      ),
                    ),
                  ],
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) async {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeLoading:
                return StandardLoading();
              case HomeLoaded:
                final events = context.read<HomeBloc>().events;
                final activity = context.read<HomeBloc>().activity;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('home-page.main_title'.tr()),
                    SizedBox(height: 20),
                    SizedBox(
                      height: size.height * .1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StandardButton(
                              text: 'Alimentación',
                              color:
                                  activity == 0
                                      ? Colors.white
                                      : Colors.blueAccent,
                              background:
                                  activity == 0
                                      ? Colors.blueAccent
                                      : Colors.white,
                              border: Colors.blueAccent,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 0),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              text: 'Siestas',
                              color:
                                  activity == 1
                                      ? Colors.white
                                      : Colors.blueAccent,
                              background:
                                  activity == 1
                                      ? Colors.blueAccent
                                      : Colors.white,
                              border: Colors.blueAccent,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 1),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              text: 'Actividades',
                              color:
                                  activity == 2
                                      ? Colors.white
                                      : Colors.blueAccent,
                              background:
                                  activity == 2
                                      ? Colors.blueAccent
                                      : Colors.white,
                              border: Colors.blueAccent,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 2),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              text: 'Deposiciones',
                              color:
                                  activity == 3
                                      ? Colors.white
                                      : Colors.blueAccent,
                              background:
                                  activity == 3
                                      ? Colors.blueAccent
                                      : Colors.white,
                              border: Colors.blueAccent,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 3),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              text: 'Observaciones',
                              color:
                                  activity == 4
                                      ? Colors.white
                                      : Colors.blueAccent,
                              background:
                                  activity == 4
                                      ? Colors.blueAccent
                                      : Colors.white,
                              border: Colors.blueAccent,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 4),
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Expanded(
                      child:
                          events.isNotEmpty
                              ? ListView.separated(
                                itemCount: events.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final event = events.elementAt(index);
                                  return Card(
                                    color: Colors.white,
                                    child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Flexible(
                                                flex: 1,
                                                child: Image.network(
                                                  event.image,
                                                  width: size.width * .2,
                                                  height: size.width * .2,
                                                ),
                                              ),

                                              Flexible(
                                                flex: 2,
                                                child: Text(event.name),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Text(
                                            event.date,
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Text(event.description),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 10),
                              )
                              : Center(
                                child: Text(
                                  'No hay registro disponibles para esta actividad',
                                ),
                              ),
                    ),
                  ],
                );
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
