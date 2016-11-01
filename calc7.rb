answer = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10
guess = gets.to_i
while guess != answer
  p("はずれ！")
  if guess > answer
    p("それはちょっと大きすぎるよ！")
  else
    p("それはちょっと小さすぎるよ！")
  end
  guess = gets.to_i
end
p("あたり！")
p("また遊んでね！")
