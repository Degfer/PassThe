local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 

--- Переходы
local function pere() 
    composer.gotoScene("scenes.game");
end
 

local function pere2() 
    composer.gotoScene("scenes.skin");
end
--- 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create() --------------------
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
---------------------------------
 


-- show() -----------------------
function scene:show( event )

    local sceneGroup = self.view

    

--------------------------------
    _W = display.contentWidth;
    _H = display.contentHeight;
--------------------------------


--- Фон ------------------------------
   local bg = display.newImage(sceneGroup, "img/bg2.jpg", _W/2, _H/2)
   bg.height = 300;
   bg.width = 610;
--------------------------------------


--- Название игры --------------------
   local namegame = display.newText(sceneGroup, "Pass The", _W/2, 100, "fonts/Paperfiller", 56 );
   namegame:setFillColor(238/255, 110/255, 115/255)
--------------------------------------


--- Скин -----------------------------
   local jet = display.newImage(sceneGroup, tst, x, y)
   jet.height = h;
   jet.width = w;
--------------------------------------


--- Кнопки ---------------------------

--- Кнопка "старта" ------------------
   startButton = widget.newButton {
    shape = 'roundedRect',
    radius = 10,
    width = 100, height = 40,
    x = _W/2, y = _H/2 + 10,
    fontSize = 30,
    fillColor = { default={ 238/255, 110/255, 115/255 }, over={ 244/255, 67/255, 54/255 } },
    labelColor = { default={  250/255, 250/255, 251/255}, over={ 237/255, 238/255, 240/255 } },
    label = "Start",
    font = 'fonts/Paperfiller',
    onPress = function(event) 

            timer.performWithDelay( 500, pere)
    end
}
--------------------------------------

--- Кнопка "выбора скина" ------------
skinButton = widget.newButton {
    shape = 'roundedRect',
    radius = 10,
    width = 100, height = 40,
    x = _W/2, y = _H/2 + 80,
    fontSize = 30,
    fillColor = { default={ 238/255, 110/255, 115/255 }, over={ 244/255, 67/255, 54/255 } },
    labelColor = { default={  250/255, 250/255, 251/255}, over={ 237/255, 238/255, 240/255 } },
    label = "Scins",
    font = 'fonts/Paperfiller',
    onPress = function(event) 

            timer.performWithDelay( 500, pere2)
    end
}
--------------------------------------

--------------------------------------



------ Присваевание к группе ---------
sceneGroup:insert(startButton);
sceneGroup:insert(skinButton);
--------------------------------------

end 
--------------------------------------
 


-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        display.remove(bg)
        display.remove(namegame)
        display.remove(jet)
        display.remove(startButton)
        display.remove(skinButton)
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        composer.removeScene("menu")
 
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
scene:addEventListener( "destroy", startButton )
-- -----------------------------------------------------------------------------------
 
return scene