// Firefox Smooth Scrolling — Smooth + Lightweight preset
// Managed by: ilhamfirmansyahhub/smooth-scrolling-firefox

// Enable smooth mouse-wheel scrolling.
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.mouseWheel", true);

// Short animation keeps scrolling smooth without feeling heavy.
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 280);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 80);

// Smaller wheel steps for smoother, more controlled movement.
user_pref("mousewheel.min_line_scroll_amount", 10);

// Keep Firefox's native fling/momentum and overscroll behavior.
user_pref("apz.fling.enabled", true);
user_pref("apz.overscroll.enabled", true);

// Light momentum tuning.
user_pref("apz.fling_friction", 0.002);
user_pref("apz.fling_stopped_threshold", 0.0);
