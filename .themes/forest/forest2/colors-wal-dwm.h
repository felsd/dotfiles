static const char norm_fg[] = "#becdc3";
static const char norm_bg[] = "#12120d";
static const char norm_border[] = "#858f88";

static const char sel_fg[] = "#becdc3";
static const char sel_bg[] = "#DF9E15";
static const char sel_border[] = "#becdc3";

static const char urg_fg[] = "#becdc3";
static const char urg_bg[] = "#6A8C26";
static const char urg_border[] = "#6A8C26";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
