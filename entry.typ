#import "utils/font.typ": *
#import "utils/mathext.typ": *
#import "utils/wcop.typ"
#import "@preview/codly:1.0.0": *
#import "@preview/tablex:0.0.8": tablex, rowspanx, colspanx, hlinex

#let tlt(..args) = tablex(
  auto-lines: false,
  align: (x, y) => (
    horizon + if y == 0 {
      center
    } else {
      left
    }
  ),
  hlinex(y: 0, stroke: +1.5pt),
  hlinex(y: 1),
  ..args,
  hlinex(stroke: +1.5pt),
)

#let report_header(
  title,
  course,
  date,
  class,
  name,
  id,
  institute,
  teacher,
) = align(center)[
  #text(font: kaiti, size: font_size.erhao, weight: "bold")[#title]
  #set text(font: heiti, weight: "semibold")
  #align(
    center,
    table(
      columns: 6,
      rows: 2,
      stroke: none,
      align: center,
      [班#h(2em)级：],
      table.hline(start: 1, end: 2, stroke: .5pt),
      [#class],
      [姓#h(2em)名：],
      table.hline(start: 3, end: 4, stroke: .5pt),
      [#name],
      [学#h(2em)号：],
      table.hline(start: 5, end: 6, stroke: .5pt),
      [#id],
    ),
  )
]

#let essay_header(
  title,
  course,
  date,
  class,
  name,
  id,
  teacher,
  abstract,
) = [
  #align(center)[
    #text(font: kaiti, size: font_size.erhao, weight: "bold")[#title]

    #name（#class #id）
  ]
  #text(font: "Source Han Sans SC")[
    *摘要*] #abstract
]

#let header = (
  report: report_header,
  essay: essay_header,
)

#let fmtdate = date => date.format("YYYY 年 MM 月 DD 日")
#let probcounter = counter("probcounter")
#let cpp() = {
  probcounter.step()
}

#let problem(prob, ans) = [
  #set text(font: "Source Han Sans SC", weight: "regular")
  #set enum(numbering: "①")
  #probcounter.step()
  #block(
    fill: rgb("#f1f1fe"),
    inset: 8pt,
    width: 100%,
    [
      *#context {
        "题目" + probcounter.display()+"."
      }* #h(1em)
      #prob
    ],
  )
  // *解答.* #h(1em)
  #ans
]

#let prob = problem

#let tblock = (block_type: "算法", title: "", body) => grid(
  block(
    fill: rgb("#4e4e77"),
    width: 100%,
    inset: 5pt,
    radius: (
      top: 2pt,
    ),
  )[
    #set text(fill: white, font: heiti)
    #counter(block_type).step()
    #context [
      *#block_type #counter(block_type).display()*
    ]
    #title
  ],block(
    inset: 10pt,
    width: 100%,
    fill: rgb("#F1F1FD"),
    radius: (
      bottom: 2pt,
    ),
  )[
    #body
    #v(-1em)
    #par()[#text(size: 0.0em)[#h(0em)]]
  ]
)

#let conf(
  title: "",
  class: "",
  course: "",
  date: datetime.today(),
  name: "",
  id: "",
  institute: "",
  teacher: "",
  abstract: "",
  type: "report",
  headerType: "课程作业",
  hideHeader: false,
  doc,
) = {
  set page(margin: (top: 2.54cm, bottom: 2.54cm, left: 3.18cm, right: 3.18cm))
  set document(title: title, author: name, date: date)
  set text(
    font: "Source Han Serif SC",
    size: 10pt,
    lang: "zh",
    region: "cn",
  )
  set bibliography(style: "gb-7714-2015-numeric")
  set heading(numbering: (..args) => {
    let nums = args.pos()
    if nums.len() == 1 {
      return numbering("一、", ..nums)
    } else if nums.len() == 2 {
      return numbering("1. ", ..nums.slice(1))
    } else {
      return numbering("1.1)", ..nums.slice(1))
    }
  })
  show heading: it => {
    if (it.level == 1) {
      context {
        probcounter.update(0)
      }
      set text(size: .8em)
      it
      v(.5em)
    } else {
      set text(size: .8em)
      it
    }
  }
  set math.equation(numbering: "(1.1)")
  set page(
    header: [
      #text(font: kaiti, weight: "bold")[
        《#course》#headerType
      ]
      #v(.5em)
      #{
        set block(above: 2pt)
        line(length: 100%, stroke: 0.5pt)
      }
    ],
    footer: context {
      h(1fr)
      counter(page).display()
      line(length: 100%, start: (0pt, -25pt), stroke: 0.4pt)
    },
  )
  show: codly-init.with()
  show raw.where(block: true): set par(justify: false)
  show raw.where(block: true): it => {
    block(stroke: .5pt + black, inset: 1pt)[
      #it
      #v(-1em)
      #par()[#text(size: 0.0em)[#h(0em)]]
    ]
  }
  show raw: set text(font: ("Menlo", "Source Han Sans SC"), lang: "zh")
  codly(number-format: none)
  assert(("report", "essay").contains(type))
  if not hideHeader {
    if type == "report" {
      (header.report)(title, course, date, class, name, id, institute, teacher)
    } else {
      (header.essay)(title, course, date, class, name, id, institute, abstract)
    }
  }
  doc
}
