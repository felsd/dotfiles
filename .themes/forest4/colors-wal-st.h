const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0c0a09", /* black   */
  [1] = "#8B766C", /* red     */
  [2] = "#AF8F76", /* green   */
  [3] = "#466383", /* yellow  */
  [4] = "#847D85", /* blue    */
  [5] = "#A3928D", /* magenta */
  [6] = "#D5AF95", /* cyan    */
  [7] = "#f4e4cc", /* white   */

  /* 8 bright colors */
  [8]  = "#aa9f8e",  /* black   */
  [9]  = "#8B766C",  /* red     */
  [10] = "#AF8F76", /* green   */
  [11] = "#466383", /* yellow  */
  [12] = "#847D85", /* blue    */
  [13] = "#A3928D", /* magenta */
  [14] = "#D5AF95", /* cyan    */
  [15] = "#f4e4cc", /* white   */

  /* special colors */
  [256] = "#0c0a09", /* background */
  [257] = "#f4e4cc", /* foreground */
  [258] = "#f4e4cc",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
