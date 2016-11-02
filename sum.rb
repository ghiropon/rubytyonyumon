require "minruby"

def sum(tree)
  if tree[0] == "lit"
    tree[1]
  else
    # ここではtree[0] == "+"
    left = sum(tree[1])
    right = sum(tree[2])
    left + right
  end
end

tree = minruby_parse("(1 + 2) + (3 + 4)")
pp(tree)
answer = sum(tree)
p(answer)
