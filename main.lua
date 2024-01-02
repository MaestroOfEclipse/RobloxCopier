local my_Goals={
	General={"Name","ClassName"},
}
my_Goals=loadstring(game.HttpGet("https://raw.githubusercontent.com/MaestroOfEclipse/RobloxCopier/main/data.lua"))
local childrens_name="Children"
function tree(input,depth,tableAccess)
	if(tableAccess==nil)then tableAccess={} end
--	input=game.Workspace
	local my_output={}
	for _,v in my_Goals["General"] do
		my_output[v]=input[v]
	end
	for _,v in my_Goals[input.ClassName] do
		my_output[v]=input[v]
	end
	my_output[childrens_name]={}
	my_output["depth"]=depth
--	table.insert(Obj_as_table)
--	input:GetChildren()
	for _,v in pairs(input:GetChildren()) do
		table.insert(my_output[childrens_name],tree(v,depth+1))
	end
	return my_output
end

function main(startOBJ)
	local Obj_as_table={}

	print(tree(startOBJ,1))
end
main(workspace)
