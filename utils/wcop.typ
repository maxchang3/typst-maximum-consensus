#let min = math.op(" min ", limits: true)
#let max = math.op(" max ", limits: true)
#let st = "  s.t. "

/// A simple environment for writing optimization problems.
#let WCOP(body) = {
  body
}
