static const char norm_fg[] = "#f6eddf";
static const char norm_bg[] = "#181c1d";
static const char norm_border[] = "#aca59c";

static const char sel_fg[] = "#f6eddf";
static const char sel_bg[] = "#A28B70";
static const char sel_border[] = "#f6eddf";

static const char urg_fg[] = "#f6eddf";
static const char urg_bg[] = "#7A807E";
static const char urg_border[] = "#7A807E";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
