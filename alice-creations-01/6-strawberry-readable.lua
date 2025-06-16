-- Code size: 84
-- Cycles/voxel: 12.240

-- Check for interior voxels (core of the strawberry)
local x_abs = abs(x)
local y_abs = abs(y)
local z_abs = abs(z)

if x_abs < 2 and y_abs < 2 and z_abs < 2 then
  return PEACH -- Interior strawberry color
end

-- Check for dots on the sides
if y == 0 and z == 0 then
  return PEACH -- Side dots pattern
end

-- Check for diagonal dots pattern
local x_squared = x * x
local z_squared = z * z
if x_squared == 1 and y == x and z_squared == 4 then
  return PEACH -- Diagonal dots
end

-- Check for dots below the strawberry
if y == -2 then
  if (x == 0 and z == -1) or (x == 1 and z == 1) then
    return PEACH -- Bottom dots
  end
end

-- Check for top pattern using Manhattan distance
-- Pattern: abs(x) + abs(z) < 3 when y == 2
if y == 2 and x_abs + z_abs < 3 then
  return GREEN -- Top leafy part
end

return RED -- Default strawberry body color