--
-- Project: LeKhaLe
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2012 ABHIJEET GOEL. All Rights Reserved.
-- 
require "movieclip"
screenGroup = nil

function GameOverAnim()		
		local anim = movieclip.newAnim({"images/gameover/1.png","images/gameover/2.png","images/gameover/18.png"})
		anim.x = display.contentWidth/2
		anim.y = display.contentHeight/2
		anim:setSpeed(0.1)
		anim:play()
		screenGroup:insert(anim)
	end
	
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
 
function scene:createScene( event )
        screenGroup = self.view
        local images = {}
		local count = 1
		for i=10001,10044,1 do
			images[count] = "images/gameover/"..i..".png"
			count = count+1
		end
		anim = movieclip.newAnim(images)
		anim.x = display.contentWidth/2
		anim.y = display.contentHeight/2
		anim:setSpeed(0.3)
		--anim:play{startFrame = 1,endFrame = 103,loop = 1,remove = true}
		anim:play()
		screenGroup:insert(anim)
        --GaneOverAnim()
end
function scene:enterScene( event )
       storyboard.purgeScene( "scene2")
end
function scene:exitScene( event )
end
function scene:destroyScene( event )
end
scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene ) 
---------------------------------------------------------------------------------
 
return scene