#let mytable(data) = table(
    columns: 3,
    [X value], [Y value], [X+Y],
    ..data.map(((x,y)) => ([#x], [#y], [#x + y])).flatten()
)

#mytable((
    (1, 2),
    (3, 4),
    (5, 6),
))

\

#block(width: 4cm, height: 4cm, {
  place(line(start: (0%, 0%), end: (100%, 100%)))
  place(line(start: (100%,0%), end: (0%, 100%)))
})