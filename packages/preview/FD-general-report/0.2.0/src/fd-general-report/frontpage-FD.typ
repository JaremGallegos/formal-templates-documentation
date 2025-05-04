#let front-page(
  title: "", course: "", type: "", description: "", authors: (),
  date: none, department: "", department-full-title: "", body
) = {
  set text(size: 10pt, fill: white)
  set par(leading: 1em, justify: true)
  set page(numbering: none, number-align: center, fill: rgb("#013656"), margin: (top: 1.5in, rest: 2in))
  set page(margin: 0.5in)

  let depart = [
    #align(right, [
      #block([
        #align(right)[
          #text(weight: 540, 1.0em, department)
          #v(0.7em, weak: true)
          #text(weight: 540, 1.0em, department-full-title)
          #v(0.7em, weak: true)
          #text(weight: 720, 1.0em, "4657" + " • " + "Sexto Ciclo" + " • " + course)

        ]
      ])
    ])
  ]

  table(
    columns: (auto, 1fr), inset: 0pt, stroke: none, align: horizon,
    table.header(
      [#image("../images/FD/CIBERTEC-Blanco-Logo.svg", width: 6.5em)],
      [#depart]
    ),
  )


  v(4em)
  text(weight: 1000, 23.5pt, title)
  linebreak()
  v(0.9em)
  align(right)[
    #text(12pt, "Docente")
    #v(0.7em, weak: true)
    #text(16pt, "Jorge Valdivia Davalos")
  ]
  v(1em)

  text(12pt, "Autores")
  v(0.9em, weak: true)
  pad(x: 0.1em, grid(
    gutter: 1em, columns: if authors.len() == 0 {2} else {3},
    ..authors.map(author => align(left, author)),
  ),)
  
  place(
    bottom, dx: -72%, dy: 19%, 
    image("../images/FD/CIBERTEC-sede-arequipa.jpg", width: 200%)
  )

  v(41em)
  align(center, text(
    23.5pt, weight: 550, "Perú"
  ))
  v(1em, weak: true)
  align(center, text(
    18pt, weight: 540, date.trim().find("2025")
  ))

  pagebreak()
  body
}