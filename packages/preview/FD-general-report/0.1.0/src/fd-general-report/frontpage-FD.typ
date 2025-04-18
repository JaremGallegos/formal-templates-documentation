#let front-page(
  title: "", course: "", type: "", description: "", authors: (),
  date: none, educational-center: "", department: "", department-full-title: "", body
) = {
  set text(size: 10pt, fill: white)
  set par(leading: 0.65em, justify: true)
  set page(numbering: none, number-align: center, fill: rgb("#244ea9"), margin: (top: 1.5in, rest: 2in))
  set page(margin: 0.5in)

  let depart = [
    #align(right, [
      #block([
        #align(right)[
          #text(weight: 700, 1.0em, department)
          #v(0.7em, weak: true)
          #text(weight: 400, 1.0em, department-full-title)
          #v(0.7em, weak: true)
          #text(weight: 400, 1.0em, educational-center)
        ]
      ])
    ])
  ]

  table(
    columns: (auto, 1fr), inset: 0pt, stroke: none, align: horizon,
    table.header(
      [#image("../images/FD/CIBERTEC-Blanco-Logo.svg", width: 3.5em)],
      [#depart]
    ),
  )

  v(2em)
  text(weight: 700, 24pt, title)
  linebreak()
  v(1em)
  text(18pt, description)
  v(1.5em)

  pad(x: 0.1em, grid(
    gutter: 1em, columns: if authors.len() == 4 {2} else {3},
    ..authors.map(author => align(left, author)),
  ),)

  place(
    bottom, dx: -7%, dy: 5%, 
    image("../images/FD/CIBERTEC-sede-arequipa.jpg", width: 115%)
  )

  pagebreak()
  body
}