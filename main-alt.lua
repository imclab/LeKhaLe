function Initialize()				gameTime = 120
		speed = 1000
		timeRem = gameTime
		startTime = os.time()
		score = 0
		--timeDisplay = {}
		backgrounds = {"back_veg","back_nveg","tablecloth","scoreboard"}
		--vegs = {"Cake","Dabeli","DONUT","DOSA","GRAPES","HOTDOG","IDLI","JALEBI","KELA","MASROOM","PIZZA","SAMOSA","seek paneer","WATER MELON"}
		--nvegs = {"CHICKEN","CRAB","FISH","MEAT","OMLET","PRAWN"}
		vegs = {"Cake","Dabeli","DONUT","DOSA"}
		nvegs = {"CHICKEN","CRAB","FISH","MEAT"}
		--vegs = {"12","13","14"}
		--nvegs = {"1","2","3"}
		foods = {"vegs","nvegs"}
		food = {}
		foodName = nil
		foodCount = 1
		back = {} --}backgrounds[0]
		changeTime = math.random(10,30)
		life = 3
		isVeg = true
		gameOver = false
		lastChange = gameTime				require("sprite")
		physics = require ("physics")
		physics.start()
	    display.setStatusBar( display.HiddenStatusBar )
    	physicsData = (require "shapedefs").physicsData(1.0)
	end
	function Draw()
		Background()
		GUI()
	end
	function Update()
		timerId = timer.performWithDelay(1000,timeDisplay,gameTime - 2 )
		--local logic = timer.performWithDelay( 10000, GameLogic, gameTime /10 - 1)
	end
	function changeBack()
		print (timeRem)
		if(timeRem == lastChange - changeTime) then
			print ("changing")
			ChangeBackground()
			lastChange = lastChange - changeTime
			changeTime = math.random(10,30)
		end
	end
	function ChangeBackground()
		if(back[2].alpha == 0) then
			back[1].alpha = 0
			back[2].alpha = 1
			isVeg = false
		elseif(back[1].alpha == 0) then
			back[2].alpha = 0
			back[1].alpha = 1
			isVeg = true
		end
	end
	function GUI()
		timeRemDisplay = display.newText( timeRem , 370, 275, "Arial", 22 )
		timeRemDisplay:setTextColor( 0, 0, 0)
		
		local scoreText = display.newText( "Score :" , 360, 5, "Arial", 22 )
		scoreDisplay = display.newText( score , 445, 5, "Arial", 22 )
		scoreDisplay:setTextColor( 0, 0, 0)
		
		local lifeText = display.newText( "Life :" , 360, 25, "Arial", 22 )
		lifeDisplay = display.newText( life , 445, 25, "Arial", 22 )
		lifeDisplay:setTextColor( 0, 0, 0)
	end
	
	function GameLogic()
		speed = speed - (10/gameTime * 1000)
		local dropFood = timer.performWithDelay( speed, Food, math.floor(10000/speed) )
	end
	function Background()
		--print (#backgrounds)
		for i=1,#backgrounds,1 do
			if backgrounds[i] == "tablecloth" then
				Player()
			end
			back[i] = display.newImageRect("images/background/".. backgrounds[i] ..".png",480,320)
			back[i].myName = backgrounds[i]
			if back[i] .myName == "tablecloth" then
				physics.addBody ( back[i], "static",physicsData:get(back[i] .myName))
			end
			if back[i] .myName == "back_nveg" then
				back[i].alpha = 0
			end
			back[i].x = display.contentWidth/2
			back[i].y = display.contentHeight/2
			back[i].width = display.viewableContentWidth
			back[i].height = display.viewableContentHeight	
		end
	end
	function Player()		local spriteSheet = sprite.newSpriteSheetFromData( "sprite1.png", require("sprite1").getSpriteSheetData() )
		local idle = sprite.newSpriteSet(spriteSheet, 1, 9)		local eat = sprite.newSpriteSet(spriteSheet, 9, 10)
		playerIdle = sprite.newSprite( idle )		playerIdle.timeScale = 0.3		playerIdle.x = display.contentWidth/2		playerIdle.y = display.contentHeight - playerIdle.height/2		playerIdle.myName = "player"
		playerIdle:play()		physics.addBody( playerIdle, "static",physicsData:get("player"))				playerEat = sprite.newSprite( eat )		playerEat.timeScale = 0.3			playerEat.x = display.contentWidth/2		playerEat.y = display.contentHeight - playerEat.height/2			playerEat.myName = "player"		playerEat.alpha = 0		
		--playerEat:play()				--physics.addBody( playerEat, "static",physicsData:get("player"))						--playerEat.xScale = -1						
		--player = display.newImage ("images/player/player.png")
--		player.x = display.contentWidth/2
	--	player.y = display.contentHeight - player.height/2
		--player.myName = "player"		
	end
	function DrawFood(foodType)
			if foodType == "vegs" then
				foodName = vegs[math.random(#vegs)]
				food[foodCount] = display.newImage("images/food/veg/"..foodName..".png")
				food[foodCount].alpha = 0.9
			elseif foodType == "nvegs" then
				foodName = nvegs[math.random(#nvegs)]
				food[foodCount] = display.newImage("images/food/nonveg/"..foodName..".png")
				food[foodCount].alpha = 1
			end			
			food[foodCount].myName = foodName			
			physics.addBody( food[foodCount], physicsData:get(foodName))
			food[foodCount].x = math.random(food[foodCount].width/2,display.contentWidth - food[foodCount].width/2)
			food[foodCount].y = - math.random(0,50)
			food[foodCount].collision = onLocalCollision
   	 	food[foodCount]:addEventListener( "collision", food[foodCount] )
   	 	foodCount = foodCount + 1
	end	function StartEatAgain()			playerEat.alpha = 0			timer.performWithDelay(10,physics.removeBody(playerEat) ,1)						playerIdle.alpha = 1			playerIdle:play()			physics.addBody(playerIdle, "static",physicsData:get("player"))	end	function spawnObject()				playerIdle.alpha = 0				physics.removeBody(playerIdle) 				playerEat.alpha = 1				playerEat:play()				physics.addBody(playerEat, "static",physicsData:get("player"))				timer.performWithDelay(1000,StartEatAgain,1)	--[[				local spriteSheet = sprite.newSpriteSheetFromData( "sprite1.png", require("sprite1").getSpriteSheetData() )								local eat = sprite.newSpriteSet(spriteSheet, 9, 10)				playerEat = sprite.newSprite( eat )				playerEat.timeScale = 0.3					playerEat.x = display.contentWidth/2				playerEat.y = display.contentHeight - playerEat.height/2					playerEat.myName = "player"	
				playerEat:play()				physics.addBody( playerEat, "static",physicsData:get("player"))	]]	end
	function onLocalCollision( self, event )
    	-- retrieve fixture names from physics data
	   if ( event.phase == "began" ) then
	   	 local selfFixtureId = physicsData:getFixtureId(self.myName, event.selfElement)
		    local otherFixtureId = physicsData:getFixtureId(event.other.myName, event.otherElement)	    
		    -- print collision information
			if otherFixtureId == "eat" then								timer.performWithDelay(10,spawnObject,1)								--playerIdle.alpha = 0
				eatFood(self)
			end
	   --[[print( 
		        self.myName .. ":" .. selfFixtureId ..
		        " collision "..event.phase.." with " .. 
		        event.other.myName .. ":" .. otherFixtureId
		        )
	   ]]
	   end
	end
	function timeDisplay()
		timeRem = gameTime - os.time() + startTime
		timeRemDisplay.text = timeRem
		if(gameOver == false) then 
			DrawFood(foods[math.random(#foods)])
			changeBack()
		end
	end
	function eatFood (obj)
		if ((isVeg == true and math.ceil(obj.alpha*10) == 9) or (isVeg == false and obj.alpha == 1)) then
			score = score + 10
			print ("correct food eaten")
		elseif((isVeg == true and obj.alpha == 1) or (isVeg == false and math.ceil(obj.alpha*10) == 9) ) then
			score = score - 10
			print ("wrong food eaten")
			life = life - 1
			--player:setFillColor(255,0,0)
			--colorTimerId = timer.performWithDelay(1000,ResetPlayerColor,1)
		end				
		obj:removeSelf()
		obj=nil		
		scoreDisplay.text = score
		lifeDisplay.text = life
		if life == 0 then
			gameOver = true
			GameOverAnim()
			physics.stop()
			timer.cancel(timerId)
		end
	end
	function GameOverAnim()
		require "movieclip"
		local anim = movieclip.newAnim({"images/gameover/1.png","images/gameover/2.png","images/gameover/18.png"})
		anim.x = display.contentWidth/2
		anim.y = display.contentHeight/2
		anim:setSpeed(0.1)
		anim:play()
	end
	 function ResetPlayerColor()	 	
			--player:setFillColor(255,255,255)
	 end
	 Initialize()
 	Draw()
 	Update()