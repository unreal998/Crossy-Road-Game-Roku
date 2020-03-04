function GetMainGameMediator()

    if(m._mainGameMediator = invalid)
        prototype = EventDispatcher()

        prototype.startNewGame = function()
            m.mainGameView = createObject("roSGNode", "MainGameView")
            m.mainGameView.setFocus(true)
        end function
 
        m._mainGameMediator = prototype
    end if

    return m._mainGameMediator 
end function