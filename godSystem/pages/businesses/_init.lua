BUSINESSES_PAGE = ui.new_page("/GS/ Businesses", Icons.CARD)

local subPages = fs.get_files(fs.get_dir_script().."/godSystem/pages/businesses/")
for i = 1, #subPages do
    if not string.find(subPages[i], "_init.lua") then
        require(subPages[i])
    end
end

print("[GOD SYSTEM] Businesses page successfully loaded.")
