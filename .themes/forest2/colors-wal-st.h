const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#2f2e1f", /* black   */
  [1] = "#B1B6AD", /* red     */
  [2] = "#CBB991", /* green   */
  [3] = "#C5BDA6", /* yellow  */
  [4] = "#BDC2BA", /* blue    */
  [5] = "#DBC59C", /* magenta */
  [6] = "#D0C7B0", /* cyan    */
  [7] = "#ebe1d0", /* white   */

  /* 8 bright colors */
  [8]  = "#a49d91",  /* black   */
  [9]  = "#B1B6AD",  /* red     */
  [10] = "#CBB991", /* green   */
  [11] = "#C5BDA6", /* yellow  */
  [12] = "#BDC2BA", /* blue    */
  [13] = "#DBC59C", /* magenta */
  [14] = "#D0C7B0", /* cyan    */
  [15] = "#ebe1d0", /* white   */

  /* special colors */
  [256] = "#2f2e1f", /* background */
  [257] = "#ebe1d0", /* foreground */
  [258] = "#ebe1d0",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
