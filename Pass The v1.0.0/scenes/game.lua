
-- requires
local composer = require( "composer" )
 
local physic = require "physics"
physic.start()

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Scene event functions
-- ----------------------------------------------------------------------------------

-- create()

function scene:create( event )
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen

end


function transition_game()
    composer.gotoScene("scenes.records");
end


-- show()
function scene:show( event )
 
    local sceneGroup = self.view

    _W = display.contentWidth;
    _H = display.contentHeight;


    -- Задний фон
    local bg = display.newImage(sceneGroup, "img/bg.jpg", _W/2, _H/2);

    -- Город 1
    city1 = display.newImage(sceneGroup, "img/city.png");
    city1.x = 1;
    city1.y = 200;
    city1.speed = 5;
     
    -- Город 2
    city2 = display.newImage(sceneGroup, "img/city.png");
    city2.x = 959;
    city2.y = 200;
    city2.speed = 5;


    -- Город 3
    city3 = display.newImage(sceneGroup, "img/city.png");
    city3.x = 1;
    city3.y = 230;
    city3.speed = 7;

    -- Город 4
    city4 = display.newImage(sceneGroup, "img/city.png");
    city4.x = 959;
    city4.y = 230;
    city4.speed = 7;

    -- Самолет 
    jet = display.newImage(sceneGroup, tst, _W/2, _H/2);
    jet.height = h;
    jet.width =  w;
    jet.myName = "jet"
    transition.to(jet,{time=2000, x=200, onComplete=jetReady})
    sceneGroup:insert(jet)

    -- Ракета
    rocket = display.newImage(sceneGroup, "img/roket.png", _W/2 + 400, 200);
    rocket.height = 70;
    rocket.width =  70;
    rocket.myName = "rocket"
    physics.addBody( rocket, "static")
    sceneGroup:insert(rocket);

    -- Объект
    ob = display.newImage(sceneGroup, "img/imgst.png")
    ob.x = _W/2;
    ob.y = 360;
    ob.myName = "ob"
    physics.addBody( ob, "static", {isSensor = true})


    function jetReady(self,event)
        print('dyn')
        physics.addBody(jet, "dynamic", {density=.1, bounce=0.1, friction=.2, radius=12.5 })
        jet:addEventListener("tap", activateJets)
    end
    
    function activateJets(self,event)
        jet:applyLinearImpulse(0, -0.08, jet.x, jet.y)
        print("run")
    end 

    function scrollCity (self, event)
        if (self.x < -800) then 
            self.x = 960;
        else self.x = self.x - self.speed;
        end
    end


    function CharcterRoc(self, event)
        transition.to(rocket, {x=_W/2-1000, y=math.random(90, 220), time=3000, onComplete=del_roc})

        function del_roc(self, event)
            transition.to(rocket, {x=_W/2+400, y=math.random(90, 220), time=0})
        end
    end


    function onCollision(event)
        timer.performWithDelay( 500, transition_game, 1)
        jet:removeEventListener("tap", activateJets)
    end

    timer.performWithDelay(5000, CharcterRoc, 0, "t-chr")


    city1.enterFrame = scrollCity;
    Runtime:addEventListener("enterFrame", city1);

    city2.enterFrame = scrollCity;
    Runtime:addEventListener("enterFrame", city2);
    
    city3.enterFrame = scrollCity;
    Runtime:addEventListener("enterFrame", city3);

    city4.enterFrame = scrollCity;
    Runtime:addEventListener("enterFrame", city4);


    Runtime:addEventListener("collision", onCollision);
    
end
    
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then

      Runtime:removeEventListener("collision", onCollision);
        
      Runtime:removeEventListener("enterFrame", city1);
      Runtime:removeEventListener("enterFrame", city2);
      Runtime:removeEventListener("enterFrame", city3);
      Runtime:removeEventListener("enterFrame", city4);


      display.remove(jet)
      display.remove(rocket)

      display.remove(city1)
      display.remove(city2)
      display.remove(city3)
      display.remove(city4)

      display.remove(ob)

      display.remove(bg)

      timer.cancel("t-chr")

    function delete()
        composer.removeScene("game");
    end

    timer.performWithDelay( 500, delete, 1)
end
end


-- destroy()
function scene:destroy( event )
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene