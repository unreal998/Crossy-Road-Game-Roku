function init()
    m.context = m.top
    m.settingNameLabel = m.context.findNode("settingValues")
end function

function itemContentChanged()
    itemContent = m.context.itemContent
    m.settingNameLabel.text = itemContent.settingValue
end function