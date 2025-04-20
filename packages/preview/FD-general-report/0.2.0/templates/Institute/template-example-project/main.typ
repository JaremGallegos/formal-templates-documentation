#import "../../../src/lib.typ": *

#set text(font: "Gill Sans MT", lang: "es")
#show: fd-general-report.with(
  title: "Desarrollo de una Plataforma Integral para la Gestión del Aprendizaje y \nAdministración Educacional",
  description: "Proyecto Final de Curso",
  authors: (
    "Pineda Sulca, Ismael Sebastian",
    "Marcano Abreu, Jesus Francisco",
    "Nina Llicahua, Luis Antony",
    "Quispe Tipo, Nayeli Emily",
    "Gallegos Yanarico, Jarem Joseph",
  ),
  date: datetime.today().display("[day] [month repr:long] [year]"),
  course: "Proyecto Integrador",
  department: "Tecnologías de la Información",
  department-full-title: "Computación e Informática",
  address-i: "Av. Porongoche 500, Paucarpata",
  address-ii: "(054) 603- 535",
  department-website: "www.cibertec.edu.pe",

  before: (
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