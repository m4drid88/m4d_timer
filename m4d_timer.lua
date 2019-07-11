function timer()
    gameTime = GetGameTimer()
    seconds = 20 -- max time (seconds) you want to set
    printTime = seconds
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(0)
            if printTime > 0 then
                difTime = GetGameTimer() - gameTime
                printTime = math.floor(seconds - (difTime/1000))
                drawTxt("Time remaining: " .. printTime .. " seconds")
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
