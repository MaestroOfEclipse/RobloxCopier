local my_Goals
my_Goals=loadstring(game.HttpGet("https://raw.githubusercontent.com/MaestroOfEclipse/RobloxCopier/main/data.lua"))

local childrens_name="Children"
game.Players.LocalPlayer.CharacterAdded:Wait()
wait(1)
function tree(input,depth,tableAccess)
	if(depth==nil)then depth=1 end
	local my_output={}

	for _,v in my_Goals["General"] do
		my_output[v]={value='"'..tostring(input[v])..'"',typeof=typeof(input[v])}
	end
	--[
	for _,v in my_Goals[input.ClassName] do
		my_output[v]=input[v]
	end
	--]]
	my_output[childrens_name]={}
	for _,v in pairs(input:GetChildren()) do
		table.insert(my_output[childrens_name],tree(v,depth+1))
	end
	return my_output
end

function Stringtify (tbl,tab, indent)
	if not indent then indent = 0 end
	if not tab then tab = {} end
	for k, v in pairs(tbl) do
		local	formatting = k .. "= "
		if typeof(k)=="number" then formatting="[" .. k .. "]= ";formatting="" end
		--		formatting=k .. "= "
		if type(v) == "table" then
			table.insert(tab,formatting.."{")
			tab =Stringtify(v,tab, indent+1)
			--			table.insert(tab,"}")
			--			tab[#tab]=tab[#tab].."}"

--		elseif type(v) == 'boolean' then
--			table.insert(tab,formatting .. tostring(v))
		else
			table.insert(tab,formatting .. tostring(v))
		end
		table.insert(tab,",")
	end
	if type(tbl) == "table"and #tbl==0 then table.insert(tab,"{}") end
	table.remove(tab,#tab)
	table.insert(tab,"}")
	if indent==0 then return "return {"..table.concat(tab,"\n")end
	return tab
end

setclipboard(Stringtify(tree(workspace)))
toclipboard(Stringtify(tree(workspace)))
