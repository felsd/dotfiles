static const char norm_fg[] = "#c2a79c";
static const char norm_bg[] = "#050403";
static const char norm_border[] = "#87746d";

static const char sel_fg[] = "#c2a79c";
static const char sel_bg[] = "#764F47";
static const char sel_border[] = "#c2a79c";

static const char urg_fg[] = "#c2a79c";
static const char urg_bg[] = "#76442F";
static const char urg_border[] = "#76442F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
