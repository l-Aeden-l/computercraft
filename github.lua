local args = {...}
local h = nil

if ( not(#args >= 4) ) then
  error("Usage: "..shell.getRunningProgram().." <user> <repo> <branch> [<path>] <save file>")
end

if #args == 4 then
  h = http.get("https://raw.githubusercontent.com/"..args[1].."/"..args[2].."/"..args[3]).readAll()
else
  h = http.get("https://raw.githubusercontent.com/"..args[1].."/"..args[2].."/"..args[3].."/"..args[4]).readAll()
end

if h then

  if #args == 4 then
    file = args[4]
  else
    file = args[5]
  end

  if not fs.exists(file) then
        f = fs.open(file, "w")
        f.write(h)
        f.close()
        print("File '"..file.."' downloaded.")
  else
        error("File '"..file.."' already exists.")
  end

else
  error("Could not download file!")
end