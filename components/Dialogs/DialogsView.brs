function init()
    m.context = m.top
    m.dialogTitle = m.context.findNode("DialogTitle")
    m.dialogList = m.context.findNode("DialogList")
    m.dialogList.itemSize = [400, 50]
    m.dialogTitle.horizAlign = "center"
    m.dialogTitle.vertAlign = "center"
    m.context.translation = [800, 400]
    m.dialogList.setFocus(true)
    m.eventTypes = GetEventType()
    m.context.observeField("dialogType", "setDialogTitle")
end function

function setDialogTitle(dialogTypeEvent)
    dialogType = dialogTypeEvent.getData()
    if (dialogType = m.eventTypes.GAME_OVER)
        m.dialogTitle.text = "YOU LOOSE"
    else if(dialogType = m.eventTypes.PLAYER_WIN)
        m.dialogTitle.text = "YOU WIN"
    end if
end function

function onKeyEvent(key, press)
    if (key = "OK" and press)
        changeAppState()
    end if
  return false
end function

function changeAppState()
   selectedState = m.dialogList.itemSelected
   m.context.selectedState = m.dialogList.content.getChild(selectedState).id
end function