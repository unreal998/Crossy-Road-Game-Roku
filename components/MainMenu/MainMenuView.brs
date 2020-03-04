function init()
    m.context = m.top
    m.mainMenuListContainer = m.context.findNode("MainMenuList")
    m.mainMenuListContainer.itemSize = [300, 50]
    m.mainMenuListContainer.translation = [800, 400]
    m.mainMenuListContainer.setFocus(true)
end function

function onKeyEvent(key, press)
    if (key = "OK" and press)
        changeAppState()
    end if
  return false
end function

function changeAppState()
   selectedState = m.mainMenuListContainer.itemSelected
   m.context.selectedState = m.mainMenuListContainer.content.getChild(selectedState).TITLE
end function