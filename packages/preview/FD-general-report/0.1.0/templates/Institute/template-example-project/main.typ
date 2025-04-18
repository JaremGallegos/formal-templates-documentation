#import "../../../src/lib.typ": *

#set text(font: "Gill Sans MT", lang: "en")
#show: fd-general-report.with(
  title: "Using Typst Instead Of Latex To Write A \nThesis, DTU Template",
  description: "Master Thesis",
  authors: (
    "Jarem Gallegos",
  ),
  date: datetime.today().display("[day] [month repr:long] [year]"),
  educational-center: "CIBERTEC",
  department: "Tecnología",
  department-full-title: "Department of Applied Mathematics and Computer Science",
  address-i: "Richard Petersens Plads, Bygning 321",
  address-ii: "2800 Kgs. Av. Porongoche",
  department-website: "www.compute.dtu.dk",

  before: (
    summary-english: include "sections/preface/english.typ",
    summary-spanish: include "sections/preface/spanish.typ",
    preface: include "sections/preface/preface.typ",
    acknowledgement: include "sections/preface/acknowledgement.typ",
    contents: include "sections/preface/contents.typ",
    readers-guide: include "sections/preface/readers-guide.typ",
  ),
)

#include "sections/introduction.typ"
#include "sections/conclusion.typ"

#pagebreak()
#bibliography("works.bib")

#pagebreak()
#include "sections/appendix.typ"