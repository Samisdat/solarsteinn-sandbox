-- Hello world, Lua edition: a tour of the syntax.
local M = {}

--[[ block
comment ]]
local greetings = { en = "hello", de = "hallo", fr = "bonjour" }

function M.greet(name, lang)
  lang = lang or "en"
  local text = greetings[lang] or error("unknown language: " .. lang)
  return string.format("%s, %s!", text, name)
end

local Counter = {}
Counter.__index = Counter

function Counter.new()
  return setmetatable({ count = 0 }, Counter)
end

function Counter:increment()
  self.count = self.count + 1
  return self
end

for code, text in pairs(greetings) do
  print(code, text, 0xFF, 1e3, #text, [[long
string]])
end

print(M.greet("world"), Counter.new():increment().count, nil == false)
return M
