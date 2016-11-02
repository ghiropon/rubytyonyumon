require "minruby"

def max(tree)
  case tree[0]
  when "lit"
    tree[1]
  else
    left = max(tree[1])
    right = max(tree[2])
    if left >= right
      left
    else
      right
    end
  end
end

p(max(minruby_parse("1 + 2 * 3")))
p(max(minruby_parse("1 + 4 + 3")))
