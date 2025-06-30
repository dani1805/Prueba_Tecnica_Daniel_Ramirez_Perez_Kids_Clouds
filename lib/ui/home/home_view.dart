// ignore_for_file: type_literal_in_constant_pattern, deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/app/helpers/colors.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/mock/mock_data.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/ui/home/home_bloc.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/widgets/standard_app_bar.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/widgets/standard_button.dart';
import 'package:prueba_tecnica_daniel_ramirez_kids_clouds/widgets/standard_event_card.dart';
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
      backgroundColor: Mcolor.pastel.withOpacity(0.3),
      appBar: StandardAppBar(
        elevation: 0,
        background: Mcolor.pastel,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: PopupMenuButton<int>(
              icon: Icon(Icons.menu, color: Mcolor.blue),
              onSelected: (int item) {
                context.read<HomeBloc>().add(ButtonChildPressed(child: item));
              },
              itemBuilder:
                  (BuildContext context) => <PopupMenuEntry<int>>[
                    PopupMenuItem<int>(
                      value: 0,
                      child: StandardKidsItem(
                        image: Children.daniel.image,
                        title: 'home-page.title_item_daniel'.tr(),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      child: StandardKidsItem(
                        image: Children.hugo.image,
                        title: 'home-page.title_item_hugo'.tr(),
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 2,
                      child: StandardKidsItem(
                        image: Children.ana.image,
                        title: 'home-page.title_item_ana'.tr(),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'home-page.main_title'.tr(),
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        color: Mcolor.blue,
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      height: size.height * .1,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            StandardButton(
                              text: 'home-page.title_activity_food'.tr(),
                              color:
                                  activity == 0 ? Colors.white : Mcolor.pastel,
                              background:
                                  activity == 0 ? Mcolor.pastel : Colors.white,
                              border: Mcolor.pastel,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 0),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              text: 'home-page.title_activity_naps'.tr(),
                              color:
                                  activity == 1 ? Colors.white : Mcolor.pastel,
                              background:
                                  activity == 1 ? Mcolor.pastel : Colors.white,
                              border: Mcolor.pastel,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 1),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              key: Key('activities_key'),
                              text: 'home-page.title_activity_activities'.tr(),
                              color:
                                  activity == 2 ? Colors.white : Mcolor.pastel,
                              background:
                                  activity == 2 ? Mcolor.pastel : Colors.white,
                              border: Mcolor.pastel,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 2),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              text:
                                  'home-page.title_activity_bowel_movements'
                                      .tr(),
                              color:
                                  activity == 3 ? Colors.white : Mcolor.pastel,
                              background:
                                  activity == 3 ? Mcolor.pastel : Colors.white,
                              border: Mcolor.pastel,
                              onTap:
                                  () => context.read<HomeBloc>().add(
                                    ButtonActivityPressed(activity: 3),
                                  ),
                            ),
                            SizedBox(width: 10),
                            StandardButton(
                              text:
                                  'home-page.title_activity_observations'.tr(),
                              color:
                                  activity == 4 ? Colors.white : Mcolor.pastel,
                              background:
                                  activity == 4 ? Mcolor.pastel : Colors.white,
                              border: Mcolor.pastel,
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
                                  return StandardEventCard(event: event);
                                },
                                separatorBuilder:
                                    (context, index) => SizedBox(height: 10),
                              )
                              : Center(
                                child: Text(
                                  'home-page.title_empty_activity'.tr(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.openSans(
                                    fontSize: 20,
                                    color: Mcolor.blue,
                                    fontStyle: FontStyle.italic,
                                  ),
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
