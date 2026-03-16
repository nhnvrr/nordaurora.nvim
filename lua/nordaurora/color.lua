local M = {}

local function clamp(value)
  return math.max(0, math.min(255, math.floor(value + 0.5)))
end

function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")

  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

function M.rgb_to_hex(red, green, blue)
  return string.format("#%02x%02x%02x", clamp(red), clamp(green), clamp(blue))
end

function M.blend(foreground, background, alpha)
  if foreground == "NONE" then
    return background
  end

  if background == "NONE" then
    return foreground
  end

  local fr, fg, fb = M.hex_to_rgb(foreground)
  local br, bg, bb = M.hex_to_rgb(background)

  return M.rgb_to_hex(
    (alpha * fr) + ((1 - alpha) * br),
    (alpha * fg) + ((1 - alpha) * bg),
    (alpha * fb) + ((1 - alpha) * bb)
  )
end

return M
