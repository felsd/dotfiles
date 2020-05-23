const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#090E10", /* black   */
  [1] = "#4D5961", /* red     */
  [2] = "#9C8159", /* green   */
  [3] = "#75929B", /* yellow  */
  [4] = "#7D8CA2", /* blue    */
  [5] = "#939CAD", /* magenta */
  [6] = "#EDBFAF", /* cyan    */
  [7] = "#f3e3db", /* white   */

  /* 8 bright colors */
  [8]  = "#aa9e99",  /* black   */
  [9]  = "#4D5961",  /* red     */
  [10] = "#9C8159", /* green   */
  [11] = "#75929B", /* yellow  */
  [12] = "#7D8CA2", /* blue    */
  [13] = "#939CAD", /* magenta */
  [14] = "#EDBFAF", /* cyan    */
  [15] = "#f3e3db", /* white   */

  /* special colors */
  [256] = "#090E10", /* background */
  [257] = "#f3e3db", /* foreground */
  [258] = "#f3e3db",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
