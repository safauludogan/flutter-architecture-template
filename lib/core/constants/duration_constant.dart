class DurationConstant extends Duration {
  DurationConstant.toastDuration() : super(seconds: 2);
  DurationConstant.lowDuration() : super(milliseconds: 200);
  DurationConstant.zeroDuration() : super(milliseconds: 0);
  DurationConstant.mediumDuration() : super(milliseconds: 500);
  DurationConstant.animatedContainerMediumDuration() : super(milliseconds: 300);
  DurationConstant.semiMediumDuration() : super(milliseconds: 1000);
  DurationConstant.highDuration() : super(milliseconds: 1500); //1500
}
