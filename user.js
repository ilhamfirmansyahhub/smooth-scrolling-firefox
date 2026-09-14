// Firefox Smooth Scrolling — Zen-like preset
// Managed by: ilhamfirmansyahhub/smooth-scrolling-firefox
// Inspired by the Zen Smooth Scrolling option from Betterfox Smoothfox.

// Enable Firefox smooth scrolling.
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.mouseWheel", true);

// Enable Firefox's smooth scrolling physics.
user_pref("general.smoothScroll.msdPhysics.enabled", true);

// Blend wheel input for a smoother, more continuous feel.
user_pref("general.smoothScroll.currentVelocityWeighting", "0.15");
user_pref("general.smoothScroll.stopDecelerationWeighting", "0.6");

// Keep wheel input responsive while smoothing the motion.
user_pref("mousewheel.min_line_scroll_amount", 10);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 80);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 300);

// Lightweight Zen-like motion tuning.
user_pref("general.smoothScroll.msdPhysics.continuousMotionMaxDeltaMS", 12);
user_pref("general.smoothScroll.msdPhysics.motionBeginSpringConstant", 600);
user_pref("general.smoothScroll.msdPhysics.regularSpringConstant", 650);
user_pref("general.smoothScroll.msdPhysics.slowdownMinDeltaMS", 25);
user_pref("general.smoothScroll.msdPhysics.slowdownSpringConstant", 250);

// Keep Firefox's native overscroll behavior.
user_pref("apz.overscroll.enabled", true);
