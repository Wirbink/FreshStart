import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fresh_start/shared/presentation/theme/colors.dart';
import 'package:fresh_start/shared/presentation/theme/text_styles.dart';

class LoadingPage extends StatefulWidget {
  final String text;

  const LoadingPage({super.key, this.text = 'Espere un momento...'});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -30, end: 30).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: SvgPicture.asset('assets/svg/Loading.svg',
                  height: 300, width: 300)),
          const SizedBox(height: 30.0),
          Text(widget.text,
              style: AppTextStyles.heading1
                  .copyWith(color: AppColors.colorSecondaryText)),
          SizedBox(
            height: 30.0,
          ),
          CircularProgressIndicator(
            color: AppColors.colorPrimary,
          )
        ],
      )),
    );
  }
}
