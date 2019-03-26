local Object = {}

function Object:shopObject(data)
  local shop_name = data
  return {
        ["name"] = shop_name .. ".ext",
        ["text"] = shop_name,
        ["icon"] = "shop",
        ["action"] = {
          ["exec"] = "x-terminal-emulator -e ssh -t entrypoint ping " .. shop_name .. ".ext",
        },
      }
end

function Object:cityObject(data)
  local city_name = data
  return {
        ["name"] = city_name,
        ["text"] = city_name,
        ["icon"] = "city",
        ["action"] = {
          --["exec"] = "google-chrome https://www.google.com/maps/place/" .. city_name
          ["exec"] = "city.sh " .. city_name
        },
      }
end

function Object:cashObject(data)
  return {
        ["name"] = data,
        ["text"] = data,
        ["icon"] = "cash",
        ["action"] = {
          --["exec"] = "google-chrome https://www.google.com/maps/place/" .. city_name
          ["exec"] = "cash.sh '" .. data .. "'"
        },
      }
end

function Object:drugsObject(data)
  return {
        ["name"] = data,
        ["text"] = data,
        ["icon"] = "drugs",
        ["action"] = {
          --["exec"] = "google-chrome https://www.google.com/maps/place/" .. city_name
          ["exec"] = "drugs.sh '" .. data .. "'"
        },
      }
end

function Object:stackoverflowObject(data)
  return {
        ["name"] = data,
        ["text"] = data,
        ["icon"] = "stackoverflow",
        ["action"] = {
          --["exec"] = "google-chrome https://www.google.com/maps/place/" .. city_name
          ["exec"] = "stackoverflow.sh '" .. data .. "'"
        },
      }
end


function Object:parse(object_list)
  local result = {}
  for i,obj in pairs(object_list["objects"]) do
    if obj["type"] == "shop" then
      table.insert(result, Object:shopObject(obj["name"]))
    end
    if obj["type"] == "city" then
      table.insert(result, Object:cityObject(obj["name"]))
    end
    if obj["type"] == "cash" then
      table.insert(result, Object:cashObject(obj["name"]))
    end
    if obj["type"] == "drugs" then
      table.insert(result, Object:drugsObject(obj["name"]))
    end
    if obj["type"] == "stackoverflow" then
      table.insert(result, Object:stackoverflowObject(obj["name"]))
    end
  end
  return {
    ["objects"] = result
  }
end

function Object:new()
  local self = {}
  setmetatable(self, { __index = Object })
  return self
end

return Object
