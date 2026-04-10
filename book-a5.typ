#import "common.typ": *

#let PAPER_SIZE = (148mm, 210mm) // A5
#let MARGIN = 10mm

#let data = json("data.json")
#make-book(data, PAPER_SIZE, MARGIN)
