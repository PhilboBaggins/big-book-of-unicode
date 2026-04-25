#import "common.typ": *

#let PAPER_SIZE = (210mm, 297mm) // A4
#let MARGIN_INSIDE = 30mm
#let MARGIN_REST = 15mm
#let FONT_SCALING = 1.0

#let data = json("data.json")
#make-book(data, PAPER_SIZE, MARGIN_INSIDE, MARGIN_REST, FONT_SCALING)
