#import "@preview/theorion:0.5.0": *

#let qcounter = counter("problem")

/// `q` 是 `question` 的缩写，用于展示问题。
/// - content (block): 内容。
/// -> block
#let q(content) = block(
  fill: gray.lighten(90%),
  stroke: .5pt + black,
  radius: 3pt,
  inset: 8pt,
  width: 100%,
  [
    #qcounter.step()
    #context {
      qcounter.display("1.")
    }
    #content
  ],
)

#let quote = quote-block
#let note = note-box
#let emphasis = emph-block
#let warning = warning-block
#let tip = tip-block
#let caution = caution-block
#let important = important-block
#let question = note-box.with(
  fill: rgb("#ff59bf"),
  title: "Question",
  icon-name: "question",
)


#let colorbox(title: "", color: black, ..args, body) = showybox(
  title: title,
  frame: (
    border-color: color,
    title-color: color.lighten(30%),
    body-color: color.lighten(95%),
    footer-color: purple.lighten(80%),
  ),
  ..args,
  body,
)
