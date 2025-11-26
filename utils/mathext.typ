/**
 * REFERENCE: https://github.com/dccsillag/moremath.typ
 */

#let ul(x) = math.underline(x)

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


// LOGIC SYMBOLS

#let Box = sym.square.stroked
#let Diamond = sym.diamond
#let vdash = math.op(sym.tack.r)
#let vdashnt = math.op(sym.tack.r.not)
#let models = math.op(sym.tack.r.double)
#let modelsnt = math.op(sym.tack.r.double.not)
#let strictif = symbol("⥽")

#let logical-shorthands(it) = {
  import "@preview/quick-maths:0.2.1": shorthands

  show: shorthands.with(
    ($[]$, sym.square.stroked),
    ($<>$, $diamond$),
    ($|-$, math.op(sym.tack.r)),
    ($|!-$, math.op(sym.tack.r.not)),
    ($|=$, math.op(sym.tack.r.double)),
    ($|!=$, math.op(sym.tack.r.double.not)),
  )
  it
}
