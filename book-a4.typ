#import "common.typ": *

#let PAPER_SIZE = (210mm, 297mm) // A4
#let MARGIN = 15mm

#let data = json("data.json")
#make-book(data, PAPER_SIZE, MARGIN)
