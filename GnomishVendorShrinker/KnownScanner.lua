
local myname, ns = ...

local tip = CreateFrame("GameTooltip")
tip:SetOwner(WorldFrame, "ANCHOR_NONE")

local lcache = {}
for i=1,40 do
	lcache[i] = tip:CreateFontString()
	tip:AddFontStrings(lcache[i], tip:CreateFontString())
end

ns.knowns = setmetatable({}, {__index = function(t, i)
	tip:ClearLines()
	if not tip:IsOwned(WorldFrame) then tip:SetOwner(WorldFrame, "ANCHOR_NONE") end
	tip:SetHyperlink(i)
	for i=1,tip:NumLines() do
		if lcache[i]:GetText() == ITEM_SPELL_KNOWN then
			t[i] = true
			return true
		end
	end
end})
