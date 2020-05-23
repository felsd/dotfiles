static const char norm_fg[] = "#9ac9d7";
static const char norm_bg[] = "#010016";
static const char norm_border[] = "#6b8c96";

static const char sel_fg[] = "#9ac9d7";
static const char sel_bg[] = "#E84F66";
static const char sel_border[] = "#9ac9d7";

static const char urg_fg[] = "#9ac9d7";
static const char urg_bg[] = "#C43E63";
static const char urg_border[] = "#C43E63";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
