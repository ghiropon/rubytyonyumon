require "minruby"

def evaluate(tree, genv, lenv)
  case tree[0]
  when "lit"
    tree[1]
  when "+"
    lenv["plus_count"] += 1 if lenv["plus_count"] != nil
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left + right
  when "-"
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left - right
  when "*"
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left * right
  when "/"
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left / right
  when "%"
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left % right
  when "**"
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left ** right
  when "=="
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left == right
  when "!="
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left != right
  when ">"
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left > right
  when ">="
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left >= right
  when "<"
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left < right
  when "<="
    left = evaluate(tree[1], genv, lenv)
    right = evaluate(tree[2], genv, lenv)
    left <= right
  when "func_call"
    args = []
    i = 0
    while tree[i + 2]
      args[i] = evaluate(tree[i + 2], genv, lenv)
      i = i + 1
    end
    mhd = genv[tree[1]]
    if mhd[0] == "builtin"
      minruby_call(mhd[1], args)
    else
    end
  when "stmts"
    i = 1
    last = nil
    while tree[i] != nil
      last = evaluate(tree[i], genv, lenv)
      i = i + 1
    end
    last
  when "var_assign"
    lenv[tree[1]] = evaluate(tree[2], genv, lenv)
  when "var_ref"
    lenv[tree[1]]
  when "if"
    if evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    else
      evaluate(tree[3], genv, lenv)
    end
  when "while"
    while evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    end
  when "while2"
    evaluate(tree[2], genv, lenv)
    while evaluate(tree[1], genv, lenv)
      evaluate(tree[2], genv, lenv)
    end
  else
    p("wrong parameter => #{tree[0]}")
    pp(tree)
    raise("unknown node")
  end
end

# ①計算式の文字列を読み込む
# str = gets
str = minruby_load()

# ②計算式の文字列を計算の木に変換する
tree = minruby_parse(str)

# ③計算の木を実行（計算）する
genv = { "p" => ["builtin", "p"],
         "raise" => ["builtin", "raise"]
         "add" => ["builtin", "add"] }
lenv = {}
answer = evaluate(tree, genv, lenv)

# ④計算結果を出力する
# p(answer)
