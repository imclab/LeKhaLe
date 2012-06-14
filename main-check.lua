--
-- Project: LeKhaLe
-- Description: 
--
-- Version: 1.0
-- Managed with http://CoronaProjectManager.com
--
-- Copyright 2012 ABHIJEET GOEL. All Rights Reserved.
-- 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
require "movieclip"
local ui = require("ui")

local buttonHandler = function( event )
	storyboard.gotoScene( "scene2", "fade", 400 )
end
function StartGame()
		local images = {"images/start/10104.png","images/start/10105.png"}
		local anim = movieclip.newAnim(images)
		anim.x = display.contentWidth/2
		anim.y = display.contentHeight/2
		anim:setSpeed(0.3)
		anim:play()
		screenGroup:insert(anim)
end
local onComplete = function(event)
		print ("over")
		StartGame()
end
function scene:createScene( event )	
	screenGroup = self.view	local sheet1 = sprite.newSpriteSheet("sprite1.png",128,128)	local spriteSet1 = sprite.spriteSheet(sheet1,1,6)	sprite.add( spriteSet1, "cat", 1, 8, 1000, 0 )	local instance1 = sprite.newSprite( spriteSet1 )
	instance1:prepare("cat")
	instance1:play()	screenGroup:insert(instance1)
    --media.playVideo("food vd.mov",false,onComplete)    
 	print( "\n1: createScene event")
end
function scene:enterScene( event )
end
function scene:exitScene( event )
	print( "1: exitScene event" )	
end
function scene:destroyScene( event )	
	print( "((destroying scene 1's view))" )
end

scene:addEventListener( "createScene", scene )
scene:addEventListener( "enterScene", scene )
scene:addEventListener( "exitScene", scene )
scene:addEventListener( "destroyScene", scene )
---------------------------------------------------------------------------------
return scene