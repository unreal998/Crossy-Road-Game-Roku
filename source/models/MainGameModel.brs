function GetMainGameModel()
    if (m._mainGameModel = invalid)
        prototype = {}

        prototype.gameProcessData = {
            BLOOD_SPLAT_COUNT: 15
            ENEMYS_COUNT: 15
        }

        prototype._playerSpeed = 20
        prototype._healthCount = 3

        prototype.decreaseHealth = function()
            m.playerData.healthCount--
        end function
        
        prototype.getGameProcessData = function()
            return m.gameProcessData
        end function

        prototype.getPlayerData = function()
            return m.playerData
        end function

        prototype.setPlayerData = function()
            m.playerData = {
                healthCount: m._healthCount,
                PLAYER_SPEED: m._playerSpeed,
                PLAYER_START_POSITION: [830, 0]
            }
        end function    

        prototype.setHelthCount = function(helthCount)
            m._healthCount = healthCount
        end function

        prototype.setPlayerSpeed = function(playerSpeed)
            m._playerSpeed = playerSpeed
        end function

        m._mainGameModel = prototype 
    end if
    return m._mainGameModel
end function