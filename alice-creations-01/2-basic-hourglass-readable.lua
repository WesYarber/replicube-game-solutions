-- Code size: 10
-- Cycles/voxel: 6.395

-- Create hourglass shape by comparing squared distances
if y * y > x * x then
  return YELLOW -- Hourglass material
end

return EMPTY -- Empty space (transparent)