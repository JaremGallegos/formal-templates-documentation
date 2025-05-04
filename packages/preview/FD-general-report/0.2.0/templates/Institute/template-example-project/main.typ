#import "../../../src/lib.typ": *

#set text(font: "Gill Sans MT", lang: "es")
#show: fd-general-report.with(
  title: "Propuesta de Solución Logística de Aprovisionamiento Orientada a la Optimización del Sistema Logístico de CASAPI Concesiones S.A. 2025",
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
#include "sections/preface/abstract.typ"
#include "sections/introduction.typ"
#include "sections/diagnostivo.typ"
#include "sections/objetivos-smart.typ"
#include "sections/justificacion.typ"
#include "sections/alcance.typ"
#include "sections/propuesta-accion.typ"
#include "sections/conclusion.typ"
#include "sections/recomendacion.typ"
#include "sections/anexos.typ"

#pagebreak()
//#bibliography("works.bib", title: content, full: true)

#pagebreak()
#include "sections/appendix.typ"