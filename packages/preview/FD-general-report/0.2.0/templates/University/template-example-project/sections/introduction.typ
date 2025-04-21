#import "../../../../src/lib.typ": *
#import "@preview/mitex:0.2.5": *

= Datos Muestrales Observados
#lorem(30)
#align(center, 
  table(
  align: horizon,
  columns: (1fr, 1fr, 1.1fr, 1.1fr),
  table.header[#text(weight: "bold","Fecha")][#text(weight: "bold", "Unidades Vendidas")][#text(weight: "bold", "Precio Unitario (USD)")][#text(weight: "bold", "Ingresos Totales (USD)")],
  [1/01/2025],  [115], [20],   [2300],
  [2/01/2025],  [36],  [20],   [720],
  [3/01/2025],  [129], [20],   [2580],
  [4/01/2025],  [104], [20],   [2080],
  [5/01/2025],  [113], [20],   [2260],
  [6/01/2025],  [102], [20],   [2040],
  [7/01/2025],  [70],  [20],   [1400],
  [8/01/2025],  [91],  [20],   [1820],
  [9/01/2025],  [134], [20],   [2680],
  [10/01/2025], [91],  [20],   [1820],
  [11/01/2025], [66],  [20],   [1320],
  [12/01/2025], [86],  [20],   [1720],
  [13/01/2025], [76],  [20],   [1520],
  [14/01/2025], [98],  [20],   [1960],
  [15/01/2025], [74],  [20],   [1480],
  [16/01/2025], [70],  [20],   [1400],
  [17/01/2025], [116], [20],   [2320],
  [18/01/2025], [150], [20],   [3000],
  [19/01/2025], [144], [20],   [2880],
  [20/01/2025], [107], [20],   [2140],
  [21/01/2025], [79],  [20],   [1580],
  [22/01/2025], [87],  [20],   [1740],
  [23/01/2025], [158], [20],   [3160],
  [24/01/2025], [131], [20],   [2620],
  [25/01/2025], [74],  [20],   [1480],
  [26/01/2025], [87],  [20],   [1740],
  [27/01/2025], [98],  [20],   [1960],
  [28/01/2025], [133], [20],   [2660],
  [29/01/2025], [99],  [20],   [1980],
  [30/01/2025], [61],  [20],   [1220],
  [31/01/2025], [45],  [20],   [900],
)
)

#pagebreak()
= #text("Tabla de Frecuencia Definida")
#lorem(70)
#let ventas = (115, 36, 129, 104, 113, 102, 70, 91, 134, 91, 66, 86, 76, 98, 74, 70, 116, 150, 144, 107, 79, 87, 158, 131, 74, 87, 98, 133, 99, 61, 45)
#let n = ventas.len()
#let suma = ventas.fold(0, (acc, x) => { acc + x })
#table(
  align: center,
  columns: (1fr, 1fr, 1fr, 1fr, 1fr),
  [$X_(i)$], [$f_(i)$], [$F_(i)$], [$h_(i)$], [$H_(i)$],
  [36], [1], [1], [0.032], [0.032],
  [45], [1], [2], [0.032], [0.064],
  [61], [1], [3], [0.032], [0.096],
  [66], [1], [4], [0.032], [0.128],
  [70], [2], [6], [0.064], [0.192],
  [74], [2], [8], [0.064], [0.256],
  [76], [1], [9], [0.032], [0.288],
  [79], [1], [10], [0.032], [0.320],
  [86], [1], [11], [0.032], [0.352],
  [87], [2], [13], [0.064], [0.416],
  [91], [2], [15], [0.064], [0.480],
  [98], [2], [17], [0.064], [0.544],
  [99], [1], [18], [0.032], [0.576],
  [102], [1], [19], [0.032], [0.608],
  [104], [1], [20], [0.032], [0.640],
  [107], [1], [21], [0.032], [0.672],
  [113], [1], [22], [0.032], [0.704],
  [115], [1], [23], [0.032], [0.736],
  [116], [1], [24], [0.032], [0.768],
  [129], [1], [25], [0.032], [0.800],
  [131], [1], [26], [0.032], [0.832],
  [133], [1], [27], [0.032], [0.864],
  [134], [1], [28], [0.032], [0.896],
  [144], [1], [29], [0.032], [0.928],
  [150], [1], [30], [0.032], [0.960],
  [158], [1], [31], [0.032], [1],
  [#text(weight: "bold", "Total")], [#text(weight: "bold", "31")], [], [#text(weight: "bold", "1")], [],
)

#pagebreak()
= #text("Determinación de Medidas de Posición")
#lorem(50)
== Desarrollo de la Media 
#let media = suma / n
#mitex(`\overline{X} =\frac{\sum _{i=1}^{n} x_{i}}{n} =\frac{3024}{31} \approx 97.55`)
#lorem(60)

== Desarrollo de la Mediana
#let midIndex = calc.floor((n - 1) / 2)
#let mediana = ventas.sorted().at(midIndex)
#mitex(`\overline{X_{m}} =X_{\left(\frac{n+1}{2}\right)} =X_{\left(\frac{31+1}{2}\right)} =X_{16}\rightarrow 98`)
#lorem(60)

== Desarrollo de la Moda
#mitex(`\overline{X_{o}} =70`)
#lorem(60)

== Determinación de los Percentiles
#let pos10 = ((n - 1) * 10) / 100
#let p10 = ventas.sorted().at(int(pos10))
#let pos25 = ((n - 1) * 25) / 100
#let q1 = ventas.sorted().at(int(pos25))
#let pos75 = ((n - 1) * 75) / 100
#let q3 = ventas.sorted().at(int(pos75))
#let pos90 = ((n - 1) * 90) / 100
#let p90 = ventas.sorted().at(int(pos90))
#mitex(`P_{k} =\frac{( n-1) \cdotp k}{100}`)
#lorem(20)
#mitex(`P_{10} =\frac{( 31+1) \cdotp 10}{100} =\frac{32\cdotp 10}{100} =3.2\ ;P=61+0.2\cdotp ( 66-61)\rightarrow X_{4} =66`)
#mitex(`Q_{1} \equiv P_{25} =\frac{( 31+1) \cdotp 25}{100} =\frac{32\cdotp 25}{100} =8\ \rightarrow X_{6} =74`)
#mitex(`Q_{3} \equiv P_{75} =\frac{( 31+1) \cdotp 75}{100} =\frac{32\cdotp 75}{100} =24\rightarrow X_{19} =116`)
#mitex(`P_{90} =\frac{( 31+1) \cdotp 90}{100} =\frac{32\cdotp 90}{100} =28.8\ ;\ P=134+0.8\cdotp ( 144-134)\rightarrow X_{24} =142`)
#lorem(40)

= #text("Determinación de Medidas Dispersión")
#lorem(40)

== Determinación de la Varianza Muestral
#let var = ventas.map((x) => { (x - media) * (x - media) }).fold(0, (acc, x2) => {acc + x2}) / (n - 1)
#mitex(`S^{2} =\frac{\sum _{i=1}^{n}( X_{i} -\overline{X})^{2}}{n-1} =\frac{27051.68}{30} \approx 901.72`)
#lorem(40)

== Determinación de la Desviación Estandar Muestral
#let sd = $ sqrt(902) = 30.03$
#mitex(`S =\sqrt{\frac{\sum _{i=1}^{n}( X_{i} -\overline{X})^{2}}{n-1}} =\sqrt{\frac{27051.68}{30}} =\sqrt{901.72} \approx 30.03`)
#lorem(40)

== Coeficiente de Curtosis Percentílico
#let Kp = (p90 - p10) / (2 * (q3 - q1))
#mitex(`K_{p} =\frac{Q_{3} -Q_{1}}{2\cdotp ( P_{90} -P_{10})} =\frac{116-74}{2\cdotp ( 142-66)} =\frac{42}{2\cdotp 76} =\frac{42}{152} \approx 0.2763`)
#lorem(40)
#mitex(`if\ K_{p}  >0,263\rightarrow platikúrtica`)
#lorem(20)

== Coeficiente de asimetría de Pearson
#let Sp = 3 * (media - mediana) / 30.03
#mitex(`S_{p} =\frac{3\cdotp (\overline{X} -\overline{X}_{m})}{S} =\frac{3\cdotp ( 97.55-98)}{30.03} =\frac{3\cdotp ( -0.45)}{30.03} =\frac{-1.35}{30.03} \approx -0.045`)
#lorem(40)

= #text("Aplicación de Gráfico Histográfico")

Suma: #suma \
Media: #media \ 
Mediana: #mediana\
Moda: 70 (freq. = 2) \

Varianza (muestral): #var \ 
Desviación estandar (muestral): #sd \
Coeficiente de curtosis percentílico (Kp): #Kp \
Coeficiente de asimetría de Pearson (SP): #Sp
#pagebreak()