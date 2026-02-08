
#let PAPER_SIZE_A5 = (148mm, 210mm)
#let MARGIN = 10mm

#set page(
  paper: "a5",
  margin: MARGIN,
  background: rect(
    //stroke: (paint: black, thickness: 1mm),
    radius: MARGIN,
    width: PAPER_SIZE_A5.at(0) - MARGIN,
    height: PAPER_SIZE_A5.at(1) - MARGIN,
  ),
)

#let unicode-page(
  number,
  symbol,
  html: none,
) = grid(
  columns: 100%,
  rows: (3fr, 3fr, 1fr),
  align: center + horizon,

  text(size: 180pt, str(number)),
  text(size: 180pt, symbol),
  if html != none {
    text(size: 80pt, html)
  } else {
    []
  },
)

#let data = json("data.json")

#for item in data.characters {
  unicode-page(
    item.unicode_number,
    item.symbol,
    html: item.at("html", default: none),
  )
}
