/**
* REFERENCE: https://github.com/dccsillag/moremath.typ
*/


/**
* PROBABILITY THEORY
*/

#let indep = $perp #h(-1em) perp$ // Independence relation
#let nindep = $cancel(indep)$ // Non-independence relation FIXME
#let Pr = math.op("Pr") // Alternative notation for probability
#let Ex = math.op("Ex") // Alternative notation for expectation
#let Var = math.op("Var") // Variance
#let Cov = math.op("Cov") // Covariance
#let ind = math.bb($1$) // Indicator
#let iid = math.upright("iid")

/**
* ISCELANEOUS IDENTITIES
*/
#let sign = math.op("sign")
#let softmax = math.op("softmax")
#let sigmoid = math.op("sigmoid")
#let argmin = math.op("arg min", limits: true)
#let argmax = math.op("arg max", limits: true)

