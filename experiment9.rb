require "minruby"

pp(minruby_parse("
i = 10
begin
p(i)
i = i + 1
end while i > 0
"))
