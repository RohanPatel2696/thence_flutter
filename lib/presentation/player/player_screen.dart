//======= FLUTTER IMPORTS: =======//
import 'package:flutter/material.dart';

//======= PACKAGE IMPORTS =======//
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//======= PROJECT IMPORTS =======//
import '../../utils/export_utils.dart';
import '../../application/export_blocs.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => PlayerBloc(),
        child: SizedBox(
          height: context.height(),
          child: BlocBuilder<PlayerBloc, PlayerState>(builder: (context, state) {
            return Stack(
              children: [
                Image.asset(
                  AssetsConst.imgBackground,
                  fit: BoxFit.cover,
                  height: context.height(),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(AppPadding.padding16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppRadius.radius36),
                        topRight: Radius.circular(AppRadius.radius36),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5), // Shadow position
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [gradientColorTop, gradientColorBottom],
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        16.height,
                        Text(StringConst.lblInstantCrush, style: boldTextStyle(color: secondaryTextColor, size: AppTextSize.textSize34)),
                        Text(StringConst.lblDescription, style: secondaryTextStyle(size: AppTextSize.textSize16, color: secondaryTextColor)),
                        40.height,
/*                        SizedBox(
                          height: 100,
                          child: AudioWaveform(
                            showActiveWaveform: true,
                            height: 100,
                            width: context.width(),
                            samples: const [10.0, 20.0, 30.0],
                          ),
                        ),*/
                        Container(
                          padding: const EdgeInsets.all(AppPadding.padding12),
                          decoration: boxDecorationWithRoundedCorners(borderRadius: radius(AppRadius.radius40)),
                          child: Icon(state is AudioPlaying ? Icons.pause : Icons.play_arrow, size: 34),
                        ).center().onTap(() {
                          if (state is AudioInitial || state is AudioPaused) {
                            context.read<PlayerBloc>().add(PlayAudio(audioFile));
                          } else {
                            context.read<PlayerBloc>().add(PauseAudio());
                          }
                        }),
                      ],
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
