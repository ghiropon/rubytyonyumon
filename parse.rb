require "minruby"

tree = minruby_parse("1 + 2 * 4")
p(tree)

pp(minruby_parse("(1 + 2) / 3 * 4 * (56 / 7 + 8 + 9)"))
