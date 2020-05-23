static const char norm_fg[] = "#f3e3db";
static const char norm_bg[] = "#090E10";
static const char norm_border[] = "#aa9e99";

static const char sel_fg[] = "#f3e3db";
static const char sel_bg[] = "#9C8159";
static const char sel_border[] = "#f3e3db";

static const char urg_fg[] = "#f3e3db";
static const char urg_bg[] = "#4D5961";
static const char urg_border[] = "#4D5961";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
