static const char norm_fg[] = "#ebe1d0";
static const char norm_bg[] = "#2f2e1f";
static const char norm_border[] = "#a49d91";

static const char sel_fg[] = "#ebe1d0";
static const char sel_bg[] = "#CBB991";
static const char sel_border[] = "#ebe1d0";

static const char urg_fg[] = "#ebe1d0";
static const char urg_bg[] = "#B1B6AD";
static const char urg_border[] = "#B1B6AD";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
