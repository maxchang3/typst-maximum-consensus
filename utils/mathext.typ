/**
 * REFERENCE: https://github.com/dccsillag/moremath.typ
 */


// PROBABILITY THEORY

#let indep = $perp #h(-1em) perp$ // Independence relation
#let nindep = $cancel(indep)$ // Non-independence relation FIXME
#let Pr = math.op("Pr") // Alternative notation for probability
#let Ex = math.op("Ex") // Alternative notation for expectation
#let Var = math.op("Var") // Variance
#let Cov = math.op("Cov") // Covariance
#let ind = math.bb($1$) // Indicator
#let iid = math.upright("iid")

// ISCELANEOUS IDENTITIES

#let sign = math.op("sign")
#let softmax = math.op("softmax")
#let sigmoid = math.op("sigmoid")
#let argmin = math.op("arg min", limits: true)
#let argmax = math.op("arg max", limits: true)


// Text decoration functions for  equations
// https://github.com/typst/typst/issues/2200

#let ul(x) = math.underline(x)
#let ulb(x) = math.bold(ul(x))
#let st(content) = context {
  let width = measure(content).width
  box[
    #content
    #place(
      dy: -3pt,
      line(stroke: .5pt, length: width)
    )
  ]
}

// LOGIC SYMBOLS

#let Box = sym.square
#let Diamond = sym.diamond
#let vdash = symbol(
  sym.tack.r,
  ("not", sym.tack.r.not),
)
#let models = symbol(
  sym.tack.r.double,
  ("not", sym.tack.r.double.not),
)
#let strictif = symbol("⥽")
#let wp = symbol("℘")
#let asm = math.op("asm")
#let iff = math.op(" iff ")
#let varnothing = math.diameter
#let falsum = sym.bot

#let logical-shorthands(it) = {
  import "@preview/quick-maths:0.2.1": shorthands

  show: shorthands.with(
    ($[]$, Box),
    ($<>$, Diamond),
    ($|-$, math.op(vdash)),
    ($|!-$, math.op(vdash.not)),
    ($|=$, math.op(models)),
    ($|!=$, math.op(models.not)),
  )

  it
}
