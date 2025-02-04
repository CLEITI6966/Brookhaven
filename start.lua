-- Carrega e executa o script da URL 2
local url = "https://raw.githubusercontent.com/CLEITI6966/Brookhaven/refs/heads/main/main2.lua"
local response = game:HttpGet(url, true)
loadstring(response)()
