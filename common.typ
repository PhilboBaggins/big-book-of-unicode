#import "@preview/oxifmt:1.0.0": strfmt

#let unicode-page(
  number,
  symbol,
  html: none,
) = grid(
  columns: 100%,
  rows: (3fr, 3fr, 3fr, 2fr),
  align: center + horizon,

  text(size: 180pt, str(number)),
  text(size: 130pt, "0x" + strfmt("{:04X}", number)),
  text(size: 180pt, symbol),
  if html != none {
    text(size: 50pt, "HTML: " + html)
  } else {
    []
  },
)

#let make-book(data, paper-size, margin) = {
  set page(
    width: paper-size.at(0),
    height: paper-size.at(1),
    margin: margin,
    background: rect(
      //stroke: (paint: black, thickness: 1mm),
      radius: margin,
      width: paper-size.at(0) - margin,
      height: paper-size.at(1) - margin,
    ),
  )

  for item in data.characters {
    unicode-page(
      item.unicode_number,
      item.symbol,
      html: item.at("html", default: none),
    )
  }
}
