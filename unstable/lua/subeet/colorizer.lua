local color = require('colorizer')
color.setup( {
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; css = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
}, {mode = 'foreground'})
