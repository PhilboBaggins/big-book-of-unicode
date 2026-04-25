#import "common.typ": *

#let PAPER_SIZE = (148mm, 210mm) // A5
#let MARGIN_INSIDE = 25mm
#let MARGIN_REST = 10mm
#let FONT_SCALING = 0.75

#let data = json("data.json")
#make-book(data, PAPER_SIZE, MARGIN_INSIDE, MARGIN_REST, FONT_SCALING)
