--[[local physics = require("physics")
physics.start()

local grabber = require("SpriteGrabber")
spriteSheet = grabber.grabSheet("spritesheet")

local bk = spriteSheet:grabSprite("14.png",true)
bk.x = 100; bk.y = 100

local sheet1 = sprite.newSpriteSheet( "spritesheet.png", 400, 350 )
local spriteSet1 = sprite.newSpriteSet(sheet1, 2, 8)
sprite.add( spriteSet1, "cat", 1, 8, 1000, 0 ) -- play 8 frames every 1000 ms
local instance1 = sprite.newSprite( spriteSet1 )
instance1:prepare("cat")
instance1:play()

require "movieclip"
local anim = movieclip.newAnim({"images/gameover/1.png","images/gameover/2.png","images/gameover/18.png"})
anim.x = display.contentWidth/2
anim.y = display.contentHeight/2
anim:setSpeed(0.1)
anim:play()
]]
require("sprite")display.setStatusBar(display.HiddenStatusBar)
local spriteSheet = sprite.newSpriteSheetFromData( "sprite1.png", require("sprite1").getSpriteSheetData() )
local idle = sprite.newSpriteSet(spriteSheet, 1, 9)local eat = sprite.newSpriteSet(spriteSheet, 9, 10)
si = sprite.newSprite( idle )si.timeScale = 0.6si.x = 200si.y = 200
si:play()ei = sprite.newSprite( eat )ei.timeScale = 0.3ei.x = 400ei.y = 200ei.xScale = -1
ei:play()