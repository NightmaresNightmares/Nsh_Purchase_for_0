-- 功能选择 (1-3)
local selectedFunction = 2  -- 在这里修改数字来选择不同功能
--1.通用
--2.宠物
--3.马
-- 循环次数设置
local loopCount = 6 -- 在这里修改循环次数
--时装21次
--发型51次
--挂饰80次
--武器皮肤1次
--马类90次（占用背包空间，请确认背包空间后合理调整次数）
--技能皮肤11次（占用背包空间，请确认背包空间后合理调整次数）
--宠物7次
--易容34次

-- 坐标点定义按G7可以获取坐标
local coordinates = {
    -- 功能1的坐标点--通用
    function1 = {
        {x = 39956, y = 19011},  --坐标1 购买1
        {x = 43849, y = 30672}   --坐标  购买2
    },
    
    -- 功能2的坐标点--宠物专用
    function2 = {
        {x = 40468, y = 17857},  --坐标1 购买1
        {x = 44157, y = 29761},  --坐标2 购买2
        {x = 53070, y = 7957},   --坐标3 右上角珍字
        {x = 30838, y = 11054},  --坐标4 黄金时代
        {x = 29335, y = 31279}   --坐标5 宠物
    },
    
    -- 功能3的坐标点--马专用
    function3 = {
        {x = 39854, y = 19739},  --坐标1 购买1
        {x = 43781, y = 31340},  --坐标2 购买2
        {x = 22369, y = 10143}   --坐标6 艮岳奇珍左上角
    }
}

-- 执行双击操作
function doubleClick()
    PressMouseButton(1)
    Sleep(50)
    ReleaseMouseButton(1)
    Sleep(50)

    Sleep(200)
end

-- 移动到指定坐标并双击
function moveAndClick(x, y)
    MoveMouseTo(x, y)
    Sleep(1000)
    doubleClick()
end

-- 功能1的执行函数
function executeFunction1()
    for _, point in ipairs(coordinates.function1) do
        moveAndClick(point.x, point.y)
    end
end

-- 功能2的执行函数
function executeFunction2()
    for _, point in ipairs(coordinates.function2) do
        moveAndClick(point.x, point.y)
    end
end

-- 功能3的执行函数
function executeFunction3()
    for _, point in ipairs(coordinates.function3) do
        moveAndClick(point.x, point.y)
    end
end

-- 获取当前鼠标位置
function getCurrentMousePosition()
    local x, y = GetMousePosition()
    OutputLogMessage("当前鼠标位置: x = %d, y = %d\n", x, y)
end

-- 主循环函数
function OnEvent(event, arg)
    if event == "MOUSE_BUTTON_PRESSED" then
        if arg == 6 then  -- G6键按下
            for i = 1, loopCount do
                OutputLogMessage("执行第 %d 次循环\n", i)
                
                if selectedFunction == 1 then
                    executeFunction1()
                elseif selectedFunction == 2 then
                    executeFunction2()
                elseif selectedFunction == 3 then
                    executeFunction3()
                end
                
                Sleep(500)  -- 每次循环间隔1秒
            end
        elseif arg == 7 then  -- G7键按下
            getCurrentMousePosition()
        end
    end
end
