import 'package:finalproject/core/utilities/logic/delete_dialoug.dart';
import 'package:finalproject/core/utilities/screens.dart';
import 'package:finalproject/core/utilities/styles/fonts.dart';
import 'package:finalproject/core/utilities/logic/responsive.dart';
import 'package:finalproject/features/home/manager/flock_info_upadates.dart/flock_info_cubit.dart';
import 'package:finalproject/features/home/manager/nom_dead_cubit/nom_dead_cubit.dart';
import 'package:finalproject/features/home/presentation/widgets/info_content.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlockInfoContainer extends StatefulWidget {
  const FlockInfoContainer({super.key, required this.flock});
  final FlockModel flock;

  @override
  State<FlockInfoContainer> createState() => _FlockInfoContainerState();
}

class _FlockInfoContainerState extends State<FlockInfoContainer> {
  late int dead;
  late int alive;
  @override
  void initState() {
    BlocProvider.of<NomDeadCubit>(context).getNomOfDead(widget.flock.sId!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FlockInfoCubit>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          gradient: LinearGradient(begin: Alignment.centerRight, colors: [
            const Color(0xff92A3FD).withOpacity(.2),
            const Color(0xff9DCEFF).withOpacity(.2)
          ])),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveCalc().widthRatio(21),
            vertical: ResponsiveCalc().heightRatio(30)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    '${widget.flock.flockName}',
                    style: MyFonts.textStyle16,
                  ),
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(46),
                ),
                Image.asset(
                  'assets/images/Edit Square.png',
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(18),
                ),
                Image.asset(
                  'assets/images/Add User.png',
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(18),
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CustomDialog(
                            onConfirmPressed: () {
                              cubit.updateFlockStatus(
                                  widget.flock.sId!, !widget.flock.active!);
                            },
                            image: 'assets/images/Close Square.png',
                            description:
                                'Are you sure you want to change status of this flock ?',
                          );
                        });
                  },
                  child: Image.asset(
                    'assets/images/Paper Fail.png',
                  ),
                )
              ],
            ),
            SizedBox(
              height: ResponsiveCalc().heightRatio(11),
            ),
            Row(
              children: [
                BlocBuilder<NomDeadCubit, NomDeadState>(
                  builder: (context, state) {
                    if (state is NomDeadSuccess) {
                      return InfoContent(
                          flockNom: widget.flock.number!,
                          dateTime: widget.flock.date!,
                          dead: state.nom);
                    } else if (state is NomDeadLoading) {
                      return InfoContent(
                          flockNom: widget.flock.number!,
                          dateTime: widget.flock.date!,
                          dead: 0);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content:
                              Text('can not load nom of deads , try later')));

                      return InfoContent(
                          flockNom: widget.flock.number!,
                          dateTime: widget.flock.date!,
                          dead: 0);
                    }
                  },
                ),
                SizedBox(
                  width: ResponsiveCalc().widthRatio(70),
                ),
                Expanded(
                    child: SvgPicture.asset('assets/images/Component 1.svg'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
