local shortport = require "shortport"
local http = require "http"

description = [[
Retrieves basic HTTP response information.
]]

author = "Sanchali Shastri"
license = "Same as Nmap"
categories = {"discovery", "safe"}

portrule = shortport.http

action = function(host, port)
    local response = http.get(host, port, "/")

    if not response then
        return "No HTTP response received"
    end

    local headers = response.header or {}

    return "HTTP Status: " .. (response.status or "Unknown") ..
           "\nServer: " .. (headers.server or "Unknown") ..
           "\nDate: " .. (headers.date or "Unknown")
end
