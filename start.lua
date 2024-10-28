-- Carrega e executa o script da URL 2
local url = "https://raw.githubusercontent.com/CLEITIN6966/HUB/refs/heads/main/2.lua"
local response = game:HttpGet(url, true)
loadstring(response)()
