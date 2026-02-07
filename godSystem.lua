print("[GOD SYSTEM]                                                              ")
print("[GOD SYSTEM] ##### /          # ###        ##### #     ##                 ")
print("[GOD SYSTEM]   ######  /         /  /###  /  ######  /#    #### /         ")
print("[GOD SYSTEM] /#   /  /         /  /  ###/  /#   /  / ##    ###/           ")
print("[GOD SYSTEM] /    /  /         /  ##   ##  /    /  /  ##    # #           ")
print("[GOD SYSTEM]     /  /         /  ###           /  /    ##   #             ")
print("[GOD SYSTEM]    ## ##        ##   ##          ## ##    ##   #             ")
print("[GOD SYSTEM]    ## ##        ##   ##   ###    ## ##     ##  #             ")
print("[GOD SYSTEM]    ## ##        ##   ##  /###  / ## ##     ##  #             ")
print("[GOD SYSTEM]    ## ##        ##   ## /  ###/  ## ##      ## #             ")
print("[GOD SYSTEM]    ## ##        ##   ##/    ##   ## ##      ## #             ")
print("[GOD SYSTEM]    #  ##         ##  ##     #    #  ##       ###             ")
print("[GOD SYSTEM]       /           ## #      /       /        ###             ")
print("[GOD SYSTEM]   /##/           / ###     /    /##/          ##             ")
print("[GOD SYSTEM]  /  ############/   ######/    /  #####                      ")
print("[GOD SYSTEM] /     #########       ###     /     ##                       ")
print("[GOD SYSTEM] #                             #                              ")
print("[GOD SYSTEM]  ##                            ##   GOD SYSTEM by lgn with <3")
print("[GOD SYSTEM]                                                              ")

local pagesDir = fs.get_dir_script().."godSystem/pages/"

print("[GOD SYSTEM] Loading pages from '"..pagesDir.."'.")
local pages = fs.get_directories(pagesDir)
for i = 1, #pages do
    require(pages[i].."/_init.lua")
end

require("godSystem/listener.lua")
ui.popup('GOD SYSTEM', 'Successfully loaded.', Icons.PORTAL, PopupType.BOX)
