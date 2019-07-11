function timer ()
    gametime = GetGameTimer()
    seconds = 20 -- max time (seconds) you want to set
    printtime = seconds
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if printtime > 0 then
                diftime = GetGameTimer() - gametime
                printtime = math.floor(seconds - (diftime/1000))
                drawTxt("Time remaining: " .. printtime .. " seconds")
            else
                Citizen.Wait(1000)
            end
        end
    end)    
end

RegisterCommand("timer", function()
    timer()
end)

function drawTxt(content)
    SetTextFont(4)
    SetTextScale(0.4, 0.4)
    SetTextColour(255,255,255, 255)
    SetTextEntry("STRING")
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    AddTextComponentString(content)
    DrawText(0.5,0.5)
end
