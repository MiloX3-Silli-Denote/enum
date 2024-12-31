# enum
enums for lua

## Usage
download the enum.lua file and place it into your project (license is in the file) and add ```Enum = require("enum");``` in your main file

to create a standard enum use the ```Enum.newEnum(...);``` function with the names (as strings) as the arguments liek so:
```lua
Enum = require("enum");

local colourEnum = Enum.newEnum("red", "blue", "green");

print("red"   == colourEnum.red  ); -- true
print("blue"  == colourEnum.blue ); -- true
print("green" == colourEnum.green); -- true
print("chair" == colourEnum.chair); -- false
```

to create an 'inout' enum use the ```Enum.newInOut();``` function.
inout enums output the prompted key as a string, this is faster than a normal enum and useful if youre just using it as a string container to allow your IDE to autocomplete the enum instead of risking a type in a string.
```lua
local inout = Enum.newInOut(); -- notice no inputs

print("red"   == inout.red  ); -- true
print("blue"  == inout.blue ); -- true
print("green" == inout.green); -- true
print("chair" == inout.chair); -- true
```

to create a return enum / reference enum, use the ```Enum.newReturnEnum(...);``` function with the names and alternate outputs as the arguments (in alternating order like: {x1, y1, x2, y2, x3, y3 ... xN, yN}).
to get the alternate output of a enum value, call the enum before getting the value.
```lua
local retEnum = Enum.newReturnEnum(
    "five", 5,
    "six", 6,
    "seven", 7
);

print("five"  == retEnum.five ); -- true
print("six"   == retEnum.six  ); -- true
print("seven" == retEnum.seven); -- true
print("chair" == retEnum.chair); -- false

-- call the enum before indexing to get the alternate output
print(retEnum().five ); -- 5
print(retEnum().six  ); -- 6
print(retEnum().seven); -- 7
```
