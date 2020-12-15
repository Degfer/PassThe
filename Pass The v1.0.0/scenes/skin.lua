local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local function wer()
tst = 'img/jet.png';
h = 90;
w = 90;
x = 100;
y = 140;
end

local function wer2()
tst = 'img/jet2.png';
h = 100;
w = 200;
x = 80;
y = 140;
end

local function pere() 
    composer.gotoScene("scenes.menu")
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view

    local bg = display.newImage(sceneGroup, "img/bg2.jpg", _W/2, _H/2)
    bg.height = 300;
    bg.width = 610;

    local name = display.newText(sceneGroup, "Scins", 50, 70, "fonts/Paperfiller", 40 )
    name:setFillColor( 238/255, 110/255, 115/255 )
    


returnButton = widget.newButton {
    shape = 'roundedRect',
    radius = 10,
    width = 100, height = 40,
    x = _W/2, y = _H/2 + 80,
    fontSize = 30,
    fillColor = { default={ 238/255, 110/255, 115/255 }, over={ 244/255, 67/255, 54/255 } },
    labelColor = { default={  250/255, 250/255, 251/255}, over={ 237/255, 238/255, 240/255 } },
    label = "Menu",
    font = 'fonts/Paperfiller',
    onPress = function(event) 

            timer.performWithDelay( 500, pere)
    end
}
    
local jet = display.newImage(sceneGroup, "img/jet.png", 100, 140);
jet.height = 90;
jet.width = 90;

local jet2 = display.newImage(sceneGroup, "img/jet2.png", 300, 140);
jet2.height = 100;
jet2.width = 200;

jet:addEventListener("tap", wer)
jet2:addEventListener("tap", wer2)
sceneGroup:insert(returnButton);
end
 
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
        composer.removeScene("skin")
 
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