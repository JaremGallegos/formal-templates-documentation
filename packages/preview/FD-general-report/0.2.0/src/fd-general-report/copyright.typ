#let copyright(
  title: "", description: "", authors: (), date: none, course: "", educational-center: "",
  department: "", department-full-title: "", address-i: "", address-ii: "", body
) = {
  set page(margin: auto)
  v(1fr) 
  text(weight: "bold", title)
  v(0.1em)
  text(course + " / " + date)
  v(1em)
  text("Por")  
  v(-5pt)
  grid(gutter: 5pt, ..authors)
  v(1em)
  grid(
    columns: (auto, 1fr), rows: (auto, auto, auto), gutter: 1em, row-gutter: 1em,
      [Copyright:], [El desarrollo del presente proyecto y su diseño están protegidos por derechos de autor, con todos los derechos reservados para el autor Gallegos Yanarico, Jarem Joseph, y derechos restringidos bajo licencia Creative Commons (CC).],
      [Foto de Portada:], [CIBERTEC sede Arequipa, 2025])
  pagebreak()
  body
} 