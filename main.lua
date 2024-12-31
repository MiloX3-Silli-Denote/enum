-- testing

Enum = require("enum");

local colourEnum = Enum.newEnum("red", "blue", "green");

print("red" == colourEnum.red);     -- true
print("blue" == colourEnum.blue);   -- true
print("green" == colourEnum.green); -- true
print("chair" == colourEnum.chair); -- false

local inout = Enum.newInOut();

print("red" == inout.red);     -- true
print("blue" == inout.blue);   -- true
print("green" == inout.green); -- true
print("chair" == inout.chair); -- true

local retEnum = Enum.newReturnEnum(
    "five", 5,
    "six", 6,
    "seven", 7
);

print("five" == retEnum.five);   -- true
print("six" == retEnum.six);     -- true
print("seven" == retEnum.seven); -- true
print("chair" == retEnum.chair); -- false

print(retEnum().five);  -- 5
print(retEnum().six);   -- 6
print(retEnum().seven); -- 7