description = [[
Displays TCP port information and detected service name.
]]

author = "Sanchali Shastri"
license = "Same as Nmap"
categories = {"discovery", "safe"}

portrule = function(host, port)
    return port.protocol == "tcp"
end

action = function(host, port)
    local service = "unknown"

    if port.service then
        service = port.service.name or "unknown"
    end

    return "Host: " .. host.ip ..
           "\nPort: " .. port.number ..
           "\nProtocol: " .. port.protocol ..
           "\nState: " .. (port.state or "unknown") ..
           "\nService: " .. service
end
