-- HEAD
local stdnse = require "stdnse"
local shortport = require "shortport"
description = [[
  look for open HyperText Transfer Protocol (HTTP) ports on a company’s network and print specific information
]]
author = "Micah Jones"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"safe"}

-- RULES
portrule = shortport.port_or_service(8000, "http-alt")

-- ACTION
action = function(host, port)
    return port.version.name  " is " port.state " and running on port number " port.number "."
end


-- Excecution Syntax: nmap --script [scriptname] [target]


