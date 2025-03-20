#import "@preview/theorion:0.3.2": *

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

/// 不需要默认的 `quote`，直接用 `theorion` 的 `quote-box`。
#let quote = quote-box
