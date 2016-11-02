require "minruby"

def evaluate(tree)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left + right
  when "-"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left - right
  when "*"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left * right
  when "/"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left / right
  when "%"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left % right
  when "**"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left ** right
  when "=="
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left == right
  when "!="
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left != right
  when ">"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left > right
  when ">="
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left >= right
  when "<"
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left < right
  when "<="
    left = evaluate(tree[1])
    right = evaluate(tree[2])
    left <= right
  end
end

# ①計算式の文字列を読み込む
str = gets

# ②計算式の文字列を計算の木に変換する
tree = minruby_parse(str)

# ③計算の木を実行（計算）する
answer = evaluate(tree)

# ④計算結果を出力する
p(answer)
  
