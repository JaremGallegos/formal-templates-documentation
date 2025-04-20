#import "../../../src/lib.typ": *

#set text(font: "Gill Sans MT", lang: "es")
#show: fd-general-report.with(
  title: "Desarrollo del Producto Académico 3 \npara el Curso Estadística y \nProbabilidades",
  description: "Proyecto Final de Curso",
  authors: (
    "Marcio Gonzalo Sequeiros Palomino",
    "Gabriela Sulca Valencia",
    "Jhonsis Yazmani Pacocha Umiyauri",
    "Gallegos Yanarico, Jarem Joseph",
  ),
  date: datetime.today().display("[day] [month repr:long] [year]"),
  course: "Estadística y Prababilidades",
  department: "Universidad Continental",
  department-full-title: "Curso General Interfacultad",
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