local args = {...}

if #args ~= 5 then
  error("Usage: "..shell.getRunningProgram().." <user> <repo> <branch> <path> <save file>")
end

local h = http.get("https://raw.github.com/"..args[1].."/"..args[2].."/"..args[3].."/"..args[4]).readAll()

if h then
  if not fs.exists(args[5]) then
        f = fs.open(args[5], "w")
        f.write(h)
        f.close()
        print("File '"..args[5].."' downloaded.")
  else
        error("File '"..args[5].."' already exists.")
  end
else
  error("Could not download file!")
end