sub main()
	screen = createObject("roSGScreen")
	scene = screen.createScene("MainScene")
	screen.Show()
  	port = createObject("roMessagePort")
	screen.setMessagePort(m.port)
	' this loop is necessary to keep the application open
	' otherwise the channel will exit when it reaches the end of main()
	while(true)

	end while
end sub