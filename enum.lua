--[[
https://github.com/MiloX3-Silli-Denote/enum

MIT License

Copyright (c) 2024 Milo:3 Silli Denote

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

local Enum = {};

function Enum.newEnum(...)
    local args = {...};

    local instance = {};

    for _, v in ipairs(args) do
        instance[v] = v;
    end

    return instance;
end

function Enum.newReturnEnum(...)
    local args = {...};

    local ret_ = {};
    local instance = setmetatable({}, {__call = function() return ret_; end});

    for i = 1, #args, 2 do
        instance[args[i]] = args[i];
        ret_[args[i]] = args[i + 1];
    end

    return instance;
end

function Enum.newInOut()
    return setmetatable({}, {__index = function(_, key) return key; end});
end

return Enum;