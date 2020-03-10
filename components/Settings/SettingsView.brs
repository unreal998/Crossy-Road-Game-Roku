function init()
    m.context = m.top
    m.settingsList = m.context.findNode("SettingsList")
    m.settingsList.numRows = 1
    m.settingsList.rowFocusAnimationStyle = "floatingFocus"
    m.settingsList.itemSize = [250, 100]
    m.settingsList.rowFocusAnimationStyle = "fixedFocusWrap"
    m.settingsList.variableWidthItems = [true, true]
	m.settingsList.rowHeights = [150]
    m.settingsList.rowItemSize = [30, 30]
	m.settingsList.itemSpacing = [ 0, 0 ]
	m.settingsList.rowItemSpacing = [230, 0]
	m.settingsList.showRowLabel = true
    m.settingsList.translation = [960, 590]
    m.settingsList.drawFocusFeedback = true
    m.settingsList.setFocus(true)
    prepareSettingsList()
end function

function prepareSettingsList()
    container = createObject("roSGNode", "ContentNode")
    helthCountRowContainer = container.createChild("ContentNode")
    helthCountRowContainer.title = "Health Count"
    for i = 0 to 14
        helthCount = helthCountRowContainer.createChild("SettingsContentModel")
        helthCount.settingValue = (i + 1).toStr()
    end for
    gameModeTypeContainer = container.createChild("ContentNode")
    gameModeTypeContainer.title = "Game mode type"
    verticalValue = gameModeTypeContainer.createChild("SettingsContentModel")
    verticalValue.settingValue = "vertical type"
    verticalValue.id = "vert"
    horizontalValue = gameModeTypeContainer.createChild("SettingsContentModel")
    horizontalValue.settingValue = "horizontal type"
    horizontalValue.id = "horiz"
    m.settingsList.content = container
end function