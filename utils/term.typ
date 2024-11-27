// Colorscheme
// https://www.schemecolor.com/macos-window-ui-colors.php

#let width = 300pt
#let inset_size = 10pt
#let radius_size = 6pt

#let button_size = 10pt
#let button_spacing = 10pt

#let button_red_color = rgb("FF605C")
#let button_orange_color = rgb("FFBD44")
#let button_green_color = rgb("00CA4E")
#let toolbar_bg_color = rgb("F5F5F5")
#let stroke_color = rgb("E1DFE1")
#let main_bg_color = rgb("000")

#let main(content: []) = [
  #set align(left)
  #show raw: set text(
    // fill: rgb("#ccc"),
    font: ("Noto Sans Mono CJK SC", "monospace"),
    weight: "medium",
  )
  #block(
    width: 100%,
    inset: inset_size,
    radius: radius_size,
    // fill: main_bg_color,
    stroke: stroke_color,
    [
      // #content
      #raw(content.text, lang: "shell-unix-generic")

    ],
  )
]

#let term(content, size: none) = [
  #align(center, main(content: content))
]
