description = [[
Displays basic information about TCP ports.
]]

author = "Sanchali Shastri"
license = "Same as Nmap"
categories = {"discovery", "safe"}

portrule = function(host, port)
    return port.protocol == "tcp"
end

action = function(host, port)
    local output = {
        "Host: " .. host.ip,
        "Port: " .. port.number,
        "Protocol: " .. port.protocol,
        "State: " .. (port.state or "unknown")
    }

    return table.concat(output, "\n")
end
