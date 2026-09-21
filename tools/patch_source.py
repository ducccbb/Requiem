import re

path = r'c:\Users\ducsh\Downloads\Luna-Interface-Suite-master\Luna-Interface-Suite-master\source.lua'
with open(path, 'r', encoding='utf-8', errors='ignore') as f:
    src = f.read()

# 1. Replace BlurModule
bm_start = src.find('local function BlurModule(Frame)')
if bm_start != -1:
    bm_end = src.find('local function unpackt(array : table)', bm_start)
    if bm_end != -1:
        src = src[:bm_start] + 'local function BlurModule(Frame)\n\treturn\nend\n\n' + src[bm_end:]
        print('BlurModule replaced!')

# 2. Replace Icons loader
icon_new = """local iconData = nil
		pcall(function()
			iconData = not isStudio and (game:HttpGet("https://cdn.jsdelivr.net/gh/latte-soft/lucide-roblox@master/lib/Icons.luau") or game:HttpGet("https://raw.githubusercontent.com/latte-soft/lucide-roblox/refs/heads/master/lib/Icons.luau"))
		end)
		local icons = {['48px'] = {}}
		pcall(function()
			icons = isStudio and IconModule.Lucide or (iconData and loadstring(iconData)())
		end)
		if typeof(icons) ~= "table" then icons = {['48px'] = {}} end"""

src = re.sub(
    r'local iconData = not isStudio and game:HttpGet\([^\)]+\)\s+local icons = isStudio and IconModule\.Lucide or loadstring\(iconData\)\(\)',
    icon_new,
    src
)

# 3. Replace checkFriends
cf_start = src.find('local function checkFriends()')
if cf_start != -1:
    cf_end = src.find('local function format(Int)', cf_start)
    if cf_end != -1:
        src = src[:cf_start] + 'local function checkFriends()\n\treturn\nend\n\n\t\t' + src[cf_end:]
        print('checkFriends replaced!')

with open(path, 'w', encoding='utf-8') as f:
    f.write(src)

print('Successfully patched source.lua!')
