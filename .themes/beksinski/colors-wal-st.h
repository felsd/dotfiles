const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#050403", /* black   */
  [1] = "#76442F", /* red     */
  [2] = "#764F47", /* green   */
  [3] = "#945431", /* yellow  */
  [4] = "#A45B35", /* blue    */
  [5] = "#9C6134", /* magenta */
  [6] = "#AB6335", /* cyan    */
  [7] = "#c2a79c", /* white   */

  /* 8 bright colors */
  [8]  = "#87746d",  /* black   */
  [9]  = "#76442F",  /* red     */
  [10] = "#764F47", /* green   */
  [11] = "#945431", /* yellow  */
  [12] = "#A45B35", /* blue    */
  [13] = "#9C6134", /* magenta */
  [14] = "#AB6335", /* cyan    */
  [15] = "#c2a79c", /* white   */

  /* special colors */
  [256] = "#050403", /* background */
  [257] = "#c2a79c", /* foreground */
  [258] = "#c2a79c",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
