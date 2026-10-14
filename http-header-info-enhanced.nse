local shortport = require "shortport"
local http = require "http"

description = [[
Retrieves HTTP response information and checks cookie security attributes.
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

    local output = {
        "HTTP Status: " .. (response.status or "Unknown"),
        "Server: " .. (headers.server or "Unknown"),
        "Date: " .. (headers.date or "Unknown")
    }

    local cookies = headers["set-cookie"]

    if not cookies then
        table.insert(output, "Cookies: None returned")
        return table.concat(output, "\n")
    end

    if type(cookies) == "string" then
        cookies = {cookies}
    end

    for i, cookie in ipairs(cookies) do
        local name = string.match(cookie, "^%s*([^=;]+)")
                    or "unnamed"

        local lower = string.lower(cookie)

        local secure =
            string.find(lower, ";%s*secure%s*[;]") or
            string.match(lower, ";%s*secure%s*$")

        local httponly =
            string.find(lower, ";%s*httponly%s*[;]") or
            string.match(lower, ";%s*httponly%s*$")

        local samesite =
            string.match(cookie,
                "[Ss]ame[Ss]ite%s*=%s*([^;]+)")

        table.insert(output,
            "Cookie " .. i .. ": " .. name)

        table.insert(output,
            "  Secure: " ..
            (secure and "Present" or "Missing"))

        table.insert(output,
            "  HttpOnly: " ..
            (httponly and "Present" or "Missing"))

        table.insert(output,
            "  SameSite: " ..
            (samesite or "Missing"))
    end

    return table.concat(output, "\n")
end
