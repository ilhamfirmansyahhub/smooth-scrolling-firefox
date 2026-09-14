// Firefox Smooth Scrolling — Lightweight preset
// Managed by: ilhamfirmansyahhub/smooth-scrolling-firefox

// Enable smooth mouse-wheel scrolling.
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.mouseWheel", true);

// Keep the animation short and responsive.
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 280);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 80);

// Smaller wheel steps for a lighter feel.
user_pref("mousewheel.min_line_scroll_amount", 10);

// Keep fling/momentum scrolling enabled.
user_pref("apz.fling.enabled", true);
user_pref("apz.overscroll.enabled", true);

// Light momentum tuning.
user_pref("apz.fling_friction", 0.002);
user_pref("apz.fling_stopped_threshold", 0.0);
