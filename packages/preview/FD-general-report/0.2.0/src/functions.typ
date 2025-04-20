#let include-files(file-list) = {
  if file-list.len() != 0 {
    let files = file-list.values()
    for file in files {
      file
    }
  }
}

#let todoes = state("todo", [])
#let add-note(content) = {
  let formatted-note = block(
    width: 100%, fill: yellow, radius: 0.5em, stroke: black,
    inset: (top: 0.5em, bottom: 0.5em, left: 1em, right: 1em),
    outset: (top: 0.5em, bottom: 0.5em),
    if type(content) == numbering and content.len() > 1 [
      *Note:*
      #content
    ] else [
      *Note:*
      #content
    ]
  )
  todoes.update(t => t + formatted-note + v(0.5em))
  formatted-note
}

#let show-all-notes() = {
  let notes = context todoes.final()
  if notes != [] {
    block(
      width: 100%, inset: 1em, stroke: black, radius: 0.5em,
      [
        #text(weight: "bold")[All Notes:]
        #v(0.5em)
        #notes
      ]
    )
  }
}

#let custom-heading(it) = [
  #set align(left)
  #set text(weight: "bold", size: 1.8em)

  #if it.numbering != none {
    set text(fill: rgb("#023657"))
    counter(heading).display(it.numbering) + h(3pt)
  }

  #text(it.body)
  #v(-12pt)
  #line(length: 100%, stroke: rgb("#555555"))
]

#let numbering-headline(c) = {
  if c.numbering != none {
    return numbering(c.numbering, ..counter(heading).at(c.location()))
  }
  return ""
}

#let current-h(level: 1) = {
  let elems = query(selector(heading.where(level: level)).after(here()))
  
  if elems.len() != 0 and elems.first().location().page() == here().page() {
    return [#numbering-headline(elems.first()) #elems.first().body]
  } else {
    elems = query(selector(heading.where(level: level)).before(here()))
    if elems.len() != 0 {
      return [#numbering-headline(elems.last()) #elems.last().body]
    }
  }
  return ""
}

#let apply-custom-footer() = {
  set page(footer: context {
    if calc.rem(here().page(), 2) == 0 [
      #align(left, text(current-h(), size: 10pt))
    ] else [
      #align(right, current-h(level: 2))
    ]
  })
}