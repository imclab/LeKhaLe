local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
require "movieclip"

Framecount = 1
screenGroup = nilbuttonHandler = function( event )
		storyboard.gotoScene( "scene2", "fade", 100)
endcheckComplete = function(event)		--print ("Frames "..Framecount)		Framecount = Framecount + 1		if Framecount == 300 then			local images = {"images/start/10104.png","images/start/10105.png"}
			Anim = movieclip.newAnim(images)
			Anim.x = display.contentWidth/2
			Anim.y = display.contentHeight/2
			Anim:setSpeed(0.3)
			Anim:play()			Anim:addEventListener("tap",buttonHandler)			screenGroup:insert(Anim)		endend
function scene:createScene( event )
		screenGroup = self.view		local images = {}
		local count = 1
		for i=10001,10103,1 do
			images[count] = "images/start/"..i..".png"
			count = count+1
		end		anim = movieclip.newAnim(images)
		anim.x = display.contentWidth/2
		anim.y = display.contentHeight/2
		anim:setSpeed(0.3)		screenGroup:insert(anim)
		anim:play{startFrame = 1,endFrame = 103,loop = 1,remove = true}		--screenGroup:insert(anim)		Runtime:addEventListener ( "enterFrame", checkComplete )
end
function scene:enterScene( event )
	storyboard.purgeScene( "scene3" )
end
function scene:exitScene( event )	Anim:removeEventListener("tap",buttonHandler)	Runtime:removeEventListener ( "enterFrame", checkComplete )
end
function scene:destroyScene( event )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )

return scene