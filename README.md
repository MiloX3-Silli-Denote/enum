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

to create an 'inout' enum use the ```Enum.newInOutEnum();``` function.
inout enums output the prompted key as a string, this is faster than a normal enum and useful if youre just using it as a string container to allow your IDE to autocomplete the enum instead of risking a type in a string.
```lua
local inout = Enum.newInOutEnum(); -- notice no inputs

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

## Other notes
for normal enums and return enums / reference enums, indexing it with a key that ends in '_' will automatically remove it (if necessary), this gets around some annoying lua stuff like ```table.nil``` will cause an error.
it wont always remove the '_' though, so you can still have a string ending with an '_', you cannot however have an item be different to another only by an ending '_' (hard to put elegantly into words so there is an example below).
additionally, inout enums do NOT support this feature so trying to have a enum.nil_ item will always return "nil_"
```lua
local luaTypes = Enum.newEnum(
    "nil",
    "boolean",
    "number",
    "string",
    "userdata",
    "function",
    "thread",
    "table"
);

local var = nil;

print(type(var) == luaTypes.nil ); -- BAD : causes an error
print(type(var) == luaTypes.nil_); -- GOOD: acts the same as the above line was intended to
```
```lua
local typeExamples = Enum.newReturnEnum(
    "nil", nil,
    "boolean", true,
    "number", 5,
    "string", "str",
    "function", function(a) return a; end,
    "table", {"contents"}
);

local var = nil;

if type(var) == typeExamples.nil_ then
    print(typeExamples().nil ); -- BAD : error
    print(typeExamples().nil_); -- GOOD: no error
end
```
```lua
-- bad usage:

local serverEnums = Enum.newEnum(
    "STARTUP_",   -- when the server starts running
    "CONNECT",    -- when client connects to server
    "DISCONNECT", -- when client disconnects from server
    "DISCONNECT_" -- when the server disconnects a client
);

-- enum is allowed to have the .STARTUP_ item because there isnt a .STARTUP or .STARTUP__ item for it to get confused with
-- enum is NOT allowed to have the .DISCONNECT_ item because it wouldn't know if you were refering to .DISCONNECT_ or .DISCONNECT
```
```lua
-- incompatible usage:

local inout = Enum.newInOutEnum();

local var = nil;

print(type(var) == inout.nil_); -- false
-- intent was to try to use the ending '_' to change the output however inout enums do NOT support this feature
```
