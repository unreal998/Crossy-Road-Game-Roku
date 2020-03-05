function init()
    m.context = m.top
    m.mainGameContainer = m.context.findNode("MainGameContainer")
    m.engineTimer = m.context.findNode("engineTimer")
    m.EVENT_TYPES = GetEventType()
    m.isPress = false
    m.engineTimer.ObserveField("fire", "engineTimer")
    m.mainGameContainer.setFocus(true)

    m.CHARACTERS_SIZE = 96
    m.ENEMY_SIZE = 120
    m.HEART_SIZE = 90
end function
 
function _addGameContainers()
    m.arenaContainer = createObject("roSGNode", "Group")
    m.bloodSplatContainer = createObject("roSGNode", "Group")
    m.enemysContainer = createObject("roSGNode", "Group")
    m.context.appendChild(m.arenaContainer)
    m.context.appendChild(m.bloodSplatContainer)
    m.context.appendChild(m.enemysContainer)
end function

function startNewGame(mainGameStatData as Object)
    _addGameContainers()
    buildArena()
    createCharacter(mainGameStatData.playerData)
    createHealthBar(mainGameStatData.playerData)
    m.enemysCount = mainGameStatData.gameProcessData.ENEMYS_COUNT
    m.bloodSplatCount = mainGameStatData.gameProcessData.BLOOD_SPLAT_COUNT
    createEnemy()
    m.engineTimer.control = "start"
end function

function createHealthBar(playerData)
    m.healthBar = createObject("roSGNode", "HealthBar")
    m.healthBar.healthCount = playerData.healthCount
    m.healthBar.translation = [ (1920 - (m.HEART_SIZE * 3)) ,0]
    m.context.appendChild(m.healthBar)
end function

function buildArena()
    for i = 0 to 7
        if (i = 0 or i = 7)
            row = createObject("roSGNode", "StartAndFinishRow")
        else
            row = createObject("roSGNode", "AsphaltRow")
        end if
        row.translation = [0, 135 * i]
        m.arenaContainer.appendChild(row)
    end for
    m.rowsCountWithouStartAndFinish = m.arenaContainer.getChildCount() - 2    
end function

function createEnemy()
    for i = 0 to m.enemysCount
        enemy = createObject("roSGNode", "EnemyCharacterCar")
        randomRow = m.arenaContainer.getChild(Rnd(m.rowsCountWithouStartAndFinish))
        enemy.speed = Rnd(30)
        enemy.translation = [-m.ENEMY_SIZE / 2, randomRow.translation[1]]
        m.enemysContainer.appendChild(enemy)
    end for 
end function

function createCharacter(playerData)
    m.character = createObject("roSGNode", "PlayerCharacter")
    m.character.translation = playerData.PLAYER_START_POSITION
    m.character.speed = playerData.PLAYER_SPEED
    m.character.direction = "down"
    m.context.appendChild(m.character)
    m.character.setFocus(true)
end function

function addEnemyCharacters()
    enemysContainerChildCount = m.enemysContainer.getChildCount() - 1
    if (enemysContainerChildCount < m.enemysCount)
        needAddEnemyValue = m.enemysCount - enemysContainerChildCount 
        for i = 0 to needAddEnemyValue
            enemy = createObject("roSGNode", "EnemyCharacterCar")
            randomRow = m.arenaContainer.getChild(Rnd(m.rowsCountWithouStartAndFinish))
            enemy.speed = Rnd(30)
            enemy.translation = [-m.ENEMY_SIZE / 2, randomRow.translation[1]]
            m.enemysContainer.appendChild(enemy)
        end for 
    end if
end function

function checkEnemyPosition()
    enemysToRemveArray = []
    for i = 0 to m.enemysContainer.getChildCount() - 1
        enemyCharacter = m.enemysContainer.getChild(i)
        if (enemyCharacter.translation[0] > 1920)
            enemysToRemveArray.push(i)
        end if
    end for
    for each enemyIndex in enemysToRemveArray
        m.enemysContainer.removeChildIndex(enemyIndex)
    end for
end function

function createBloodSplat(positionsArray)
    bloodSplat = createObject("roSGNode", "BloodSplat")
    bloodSplat.typeOfBlood = Rnd(4)
    bloodSplat.translation = positionsArray
    if (m.bloodSplatContainer.getChildCount() > m.bloodSplatCount)
        m.bloodSplatContainer.removeChildIndex(0)
    end if
    m.bloodSplatContainer.appendChild(bloodSplat)
end function

function playerDie()
    createBloodSplat(m.character.translation)
    m.context.gameState = m.EVENT_TYPES.WAS_SMASHED
end function

function restartLevel(playerData)
    m.character.translation = playerData.PLAYER_START_POSITION
    m.healthBar.callFunc("removeHealth", {helthCount: playerData.healthCount})
    m.enemysContainer.removeChildrenIndex(m.enemysContainer.getChildCount() - 1, 0)
    createEnemy()
end function

function checkCharactersColision()
    characterMinXPosition = m.character.translation[0] - m.CHARACTERS_SIZE / 2
    characterMaxXPosition = m.character.translation[0] + m.CHARACTERS_SIZE / 2
    characterMinYPosition = m.character.translation[1] - m.CHARACTERS_SIZE / 2
    characterMaxYPosition = m.character.translation[1] + m.CHARACTERS_SIZE / 2
    for i = 0 to m.enemysContainer.getChildCount() - 1
        enemy = m.enemysContainer.getChild(i)
        enemyMinXPosition = enemy.translation[0] - m.ENEMY_SIZE / 2
        enemyMaxXPosition = enemy.translation[0] + m.ENEMY_SIZE / 2
        enemyMinYPosition = enemy.translation[1] - m.ENEMY_SIZE / 2
        enemyMaxYPosition = enemy.translation[1] + m.ENEMY_SIZE / 2
        if ((enemyMaxXPosition > characterMinXPosition and enemyMaxXPosition < characterMaxXPosition) and (characterMaxYPosition > enemyMinYPosition and characterMinYPosition < enemyMaxYPosition ))
            playerDie()
        else if ((characterMaxXPosition > enemyMinXPosition and characterMinXPosition < enemyMaxXPosition ) and (characterMaxYPosition > enemyMinYPosition and characterMinYPosition < enemyMaxYPosition ))    
            playerDie()
        end if
    end for
end function

function playerMovement()
    if (m.isPress)
        if (m.pressedKey = "right")
            if (m.character.translation[0] > 1800)
                m.isPress = false
                return true
            end if
            m.character.translation = [m.character.translation[0] + m.character.speed, m.character.translation[1]]
        else if (m.pressedKey = "down")
            if (m.character.translation[1] > 920)
                playerWin()
                m.isPress = false
                return true
            end if
            m.character.translation = [m.character.translation[0], m.character.translation[1]  + m.character.speed]
        else if (m.pressedKey = "left")
            if (m.character.translation[0] < 0)
                m.isPress = false
                return true
            end if
            m.character.translation = [m.character.translation[0] - m.character.speed, m.character.translation[1]]
        else if (m.pressedKey = "up")
            if (m.character.translation[1] < 0)
                m.isPress = false
                return true
            end if
            m.character.translation = [m.character.translation[0], m.character.translation[1] - m.character.speed]
        end if
        m.character.direction = m.pressedKey
    end if
end function

function playerWin()
    m.context.gameState = m.EVENT_TYPES.PLAYER_WIN
end function

function engineTimer()
    playerMovement()
    for i = 0 to m.enemysContainer.getChildCount() - 1
        enemyCharacter = m.enemysContainer.getChild(i)
        enemyCharacter.translation = [enemyCharacter.translation[0] + enemyCharacter.speed, enemyCharacter.translation[1]]
    end for
    checkCharactersColision()
    checkEnemyPosition()
    addEnemyCharacters()
end function

function onKeyEvent(key, press)
    if (key = "right" or key = "left" or key = "up" or key = "down")
        m.isPress = press
        m.pressedKey = key
    end if
  return false
end function