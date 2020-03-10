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
            m.setRandomMode()
            m.playerData = {
                gameMode: m.gameMode
                healthCount: m._healthCount,
                playerSpeed: m._playerSpeed,
                playerStartPosition: m._setPlayerStartPosition(),
                tilesCount: m._setTilesCount()
            }
        end function

        prototype._setTilesCount = function()
            tilesCount = 0
            if (m.gameMode = "vert")
                tilesCount = 9
            else if(m.gameMode = "horiz")
                tilesCount = 7
            end if
            return tilesCount
        end function    
        
        prototype._setPlayerStartPosition = function()
            startPosition = []
            if (m.gameMode = "vert")
                startPosition= [0, 400]
            else if(m.gameMode = "horiz")
                startPosition= [800, 0]
            end if
            return startPosition
        end function

        prototype.setRandomMode = function()
            m.gameMode = ""
            randomValue = Rnd(2)
            if (randomValue = 1)
                m.gameMode = "vert"
            else 
                m.gameMode = "horiz"
            end if
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