// Test term list.

--- terms-constructor ---
// Test with constructor.
#terms(
  ([One], [First]),
  ([Two], [Second]),
)

--- terms-built-in-loop ---
// Test joining.
#for word in lorem(4).split().map(s => s.trim(".")) [
  / #word: Latin stuff.
]

--- terms-multiline ---
// Test multiline.
#set text(8pt)

/ Fruit: A tasty, edible thing.
/ Veggie:
  An important energy source
  for vegetarians.

  And healthy!

--- terms-style-change-interrupted ---
// Test style change.
#set text(8pt)
/ First list: #lorem(6)

#set terms(hanging-indent: 30pt)
/ Second list: #lorem(5)

--- terms-rtl ---
// Test RTL.
#set text(8pt, dir: rtl)

/ פרי: דבר טעים, אכיל. ומקור אנרגיה חשוב לצמחונים.

--- terms-grid ---
// Test grid like show rule.
#show terms: it => table(
  columns: 2,
  inset: 3pt,
  ..it.children.map(v => (emph(v.term), v.description)).flatten(),
)

/ A: One letter
/ BB: Two letters
/ CCC: Three letters

--- terms-syntax-edge-cases ---
/ Term:
Not in list
/Nope

--- terms-missing-colon ---
// Error: 8 expected colon
/ Hello

--- issue-1050-terms-indent ---
#set page(width: 110pt)
#set par(first-line-indent: 0.5cm)

- #lorem(5)
- #lorem(5)

+ #lorem(5)
+ #lorem(5)

/ S: #lorem(5)
/ XXXL: #lorem(5)

--- issue-2530-term-item-panic ---
// Term item (pre-emptive)
#terms.item[Hello][World!]

--- issue-5503-terms-interrupted-by-par-align ---
// `align` is block-level and should interrupt a `terms`
// but not a `par`
#show terms: [Terms]
/ a: a
/ b: b
#par(leading: 5em)[/ c: c]
/ d: d
/ e: e
#par[/ f: f]
/ g: g
/ h: h
#align(right)[/ i: i]
/ j: j

--- issue-5719-terms-nested ---
// Term lists can be immediately nested.
/ Term A: 1
/ Term B: / Term C: 2
          / Term D: 3
