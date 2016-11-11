require "minruby"

def evaluate(tree, env)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    env["plus_count"] += 1 if env["plus_count"] != nil
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left + right
  when "-"
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left - right
  when "*"
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left * right
  when "/"
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left / right
  when "%"
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left % right
  when "**"
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left ** right
  when "=="
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left == right
  when "!="
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left != right
  when ">"
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left > right
  when ">="
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left >= right
  when "<"
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left < right
  when "<="
    left = evaluate(tree[1], env)
    right = evaluate(tree[2], env)
    left <= right
  when "func_call" # 仮の実装
    p(evaluate(tree[2], env))
  when "stmts"
    i = 1
    last = nil
    while tree[i] != nil
      last = evaluate(tree[i], env)
      i = i + 1
    end
    last
  when "var_assign"
    env[tree[1]] = evaluate(tree[2], env)
  when "var_ref"
    env[tree[1]]
  else
    "wrong parameter => #{tree[0]}"
  end
end

# ①計算式の文字列を読み込む
# str = gets
str = minruby_load()

# ②計算式の文字列を計算の木に変換する
tree = minruby_parse(str)

# ③計算の木を実行（計算）する
env = {}
answer = evaluate(tree, env)

# ④計算結果を出力する
# p(answer)
