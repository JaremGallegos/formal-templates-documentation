#let copyright(
  title: "", description: "", authors: (), date: none, educational-center: "",
  department: "", department-full-title: "", address-i: "", address-ii: "", body
) = {
  set page(margin: auto)
  v(1fr) 
  text(weight: "bold", title)
  text(description + " / " + date)
  v(1em)
  text("By")  
  v(-5pt)
  grid(gutter: 5pt, ..authors)
  v(1em)
  grid(
    columns: (auto, 1fr), rows: (auto, auto, auto), gutter: 1em, row-gutter: 1.2em,
      [Copyright:], [Reproduction of this publication in whole or in part must include the customary bibliographic citation, including author attribution, report title, etc.],
      [Cover photo:], [CIBERTEC, 2025],
      [Published by:], [#department, #educational-center, #address-i, #address-ii],)
  pagebreak()
  body
} 