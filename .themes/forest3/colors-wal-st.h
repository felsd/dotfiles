const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#181c1d", /* black   */
  [1] = "#7A807E", /* red     */
  [2] = "#A28B70", /* green   */
  [3] = "#C6A578", /* yellow  */
  [4] = "#A5978B", /* blue    */
  [5] = "#D0B296", /* magenta */
  [6] = "#EBCFB2", /* cyan    */
  [7] = "#f6eddf", /* white   */

  /* 8 bright colors */
  [8]  = "#aca59c",  /* black   */
  [9]  = "#7A807E",  /* red     */
  [10] = "#A28B70", /* green   */
  [11] = "#C6A578", /* yellow  */
  [12] = "#A5978B", /* blue    */
  [13] = "#D0B296", /* magenta */
  [14] = "#EBCFB2", /* cyan    */
  [15] = "#f6eddf", /* white   */

  /* special colors */
  [256] = "#181c1d", /* background */
  [257] = "#f6eddf", /* foreground */
  [258] = "#f6eddf",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
