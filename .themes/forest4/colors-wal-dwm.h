static const char norm_fg[] = "#f4e4cc";
static const char norm_bg[] = "#0c0a09";
static const char norm_border[] = "#aa9f8e";

static const char sel_fg[] = "#f4e4cc";
static const char sel_bg[] = "#AF8F76";
static const char sel_border[] = "#f4e4cc";

static const char urg_fg[] = "#f4e4cc";
static const char urg_bg[] = "#8B766C";
static const char urg_border[] = "#8B766C";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
