const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#010016", /* black   */
  [1] = "#C43E63", /* red     */
  [2] = "#E84F66", /* green   */
  [3] = "#FE6E67", /* yellow  */
  [4] = "#FE956A", /* blue    */
  [5] = "#FCDB76", /* magenta */
  [6] = "#23479B", /* cyan    */
  [7] = "#9ac9d7", /* white   */

  /* 8 bright colors */
  [8]  = "#6b8c96",  /* black   */
  [9]  = "#C43E63",  /* red     */
  [10] = "#E84F66", /* green   */
  [11] = "#FE6E67", /* yellow  */
  [12] = "#FE956A", /* blue    */
  [13] = "#FCDB76", /* magenta */
  [14] = "#23479B", /* cyan    */
  [15] = "#9ac9d7", /* white   */

  /* special colors */
  [256] = "#010016", /* background */
  [257] = "#9ac9d7", /* foreground */
  [258] = "#9ac9d7",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
