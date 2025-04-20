#let last-page(
  department: "", educational-center: "", address-i: "",
  address-ii: "", department-website: "", background-color: rgb("#000000"),
  body
) = {
  set page(
    footer: [], numbering: none, margin: auto, fill: background-color
  )
  set text(
    font: "Libertinus Serif", lang: "es", size: 11pt, fill: white
  )
  place(
    left + bottom, [
      #department \ #educational-center
      #v(1em)
      #address-i \ #address-ii
      #v(1em)
      #link("https://" + department-website, department-website)
    ]
  )
  body
}