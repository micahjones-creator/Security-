-- Queries usernames on a Linux machine using the finger service.
-- Executes with .nse extension (nmap scripting engine) *not lua ext*

-- HEAD
local comm = require "comm"
local shortport = require "shortport"

description = [[
  Very Simple Finger Scan
]]

author = "Micah Jones"
license = "Same as Nmap--See https://nmap.org/book/man-legal.html"
categories = {"default", "discovery", "safe"}

-- RULES
portrule = shortport.port_or_service(79, "finger")

-- ACTION
action = function(host, port)
    local try = nmap.new_try()

    return try(comm.exchange(host, port, "\r\n", 
{lines=100, 
    proto=port.Protocol, timeout=5000}))
end

-- Execution Syntax, nmap --script scriptname target
-- Output Example: 
-- Starting Nmap 7.80 ( https://nmap.org )
-- Nmap scan report for localhost (IP.IP.IP.IP)
-- Host is up (0.074s latency).
-- Other addresses for localhost (not scanned): ::1
-- PORT      STATE    SERVICE
-- 79/tcp open  finger
-- | finger:
-- | Welcome to Linux version 2.6.31.12-0.2-default at linux-pb94.site !
-- |  01:14am  up  18:54,  4 users,  load average: 0.14, 0.08, 0.01
-- |
-- | Login      Name             Tty        Idle  Login Time   Where
-- | admin     *redacted*            *:0          -     Wed 06:19 console
-- | admin     *redacted*            pts/1    18:54     Wed 06:20
-- | admin     *redacted*           *pts/0       -     Thu 00:41
-- |_admin     *redacted*           *pts/4       3     Thu 01:06