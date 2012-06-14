local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
require "movieclip"

Framecount = 1
screenGroup = nil
		storyboard.gotoScene( "scene2", "fade", 100)
end
			Anim = movieclip.newAnim(images)
			Anim.x = display.contentWidth/2
			Anim.y = display.contentHeight/2
			Anim:setSpeed(0.3)
			Anim:play()
function scene:createScene( event )
		screenGroup = self.view
		local count = 1
		for i=10001,10103,1 do
			images[count] = "images/start/"..i..".png"
			count = count+1
		end
		anim.x = display.contentWidth/2
		anim.y = display.contentHeight/2
		anim:setSpeed(0.3)
		anim:play{startFrame = 1,endFrame = 103,loop = 1,remove = true}
end
function scene:enterScene( event )
	storyboard.purgeScene( "scene3" )
end
function scene:exitScene( event )
end
function scene:destroyScene( event )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene