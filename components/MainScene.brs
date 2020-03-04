function init()
    m.appController = GetAppController()
    m.appContainer = createObject("roSGNode", "AppContainer")
    m.appController.initApp(m.appContainer)
    m.top.appendChild(m.appContainer)
end function