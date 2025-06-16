-- Code size: 52
-- Cycles/voxel: 8.504

-- This code uses carving approach - removing voxels from a solid block
-- rather than drawing individual parts

-- Carve out the top and front area (make it empty)
if y > -1 and z > -1 then
  return EMPTY -- Remove top-front area
end

-- Carve out the back support (except at specific heights)
if x == 0 and y ~= -1 and y ~= 2 then
  return EMPTY -- Remove back support middle section
end

-- Carve out the seat area from below
if y < -1 and z == 0 then
  return EMPTY -- Remove under-seat area
end

-- Keep the chair structure (legs, seat, backrest)
local x_abs = abs(x)
local z_abs = abs(z)

if x_abs < 2 and y < 3 and z_abs < 2 then
  return ORANGE -- Chair material
end

return EMPTY -- Everything else is empty space