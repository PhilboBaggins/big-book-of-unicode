#import "@preview/oxifmt:1.0.0": strfmt

#let unicode-grid(
  number,
  symbol,
  html,
  font-scaling,
) = grid(
  columns: 100%,
  rows: (3fr, 3fr, 3fr, 2fr),
  align: center + horizon,

  text(size: 180pt * font-scaling, str(number)),
  text(size: 130pt * font-scaling, "0x" + strfmt("{:04X}", number)),
  text(size: 180pt * font-scaling, symbol),
  if html != none {
    text(size: 50pt * font-scaling, "HTML: " + html)
  },
)

#let make-book(data, paper-size, margin-inside, margin-rest, font-scaling) = {
  set page(
    width: paper-size.at(0),
    height: paper-size.at(1),
    margin: (
      inside: margin-inside,
      rest: margin-rest,
    ),
  )

  for item in data.characters {
    rect(
      //stroke: (paint: black, thickness: 1mm),
      radius: margin-rest,
      width: 100%,
      height: 100%,

      unicode-grid(
        item.unicode_number,
        item.at("symbol", default: none),
        item.at("html", default: none),
        font-scaling,
      ),
    )
  }
}
