const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#12120d", /* black   */
  [1] = "#6A8C26", /* red     */
  [2] = "#DF9E15", /* green   */
  [3] = "#C5B04E", /* yellow  */
  [4] = "#5F6195", /* blue    */
  [5] = "#9353A6", /* magenta */
  [6] = "#759DAE", /* cyan    */
  [7] = "#becdc3", /* white   */

  /* 8 bright colors */
  [8]  = "#858f88",  /* black   */
  [9]  = "#6A8C26",  /* red     */
  [10] = "#DF9E15", /* green   */
  [11] = "#C5B04E", /* yellow  */
  [12] = "#5F6195", /* blue    */
  [13] = "#9353A6", /* magenta */
  [14] = "#759DAE", /* cyan    */
  [15] = "#becdc3", /* white   */

  /* special colors */
  [256] = "#12120d", /* background */
  [257] = "#becdc3", /* foreground */
  [258] = "#becdc3",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
