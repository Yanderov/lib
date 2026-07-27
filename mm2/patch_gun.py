import os

def patch_file(fpath):
    with open(fpath, 'r', encoding='utf-8') as f:
        content = f.read()

    target = '''        elseif v == "Custom 2 (Suppressed)" then
            task.spawn(function() S.CustomGunSoundId = fetchCustomAsset(gunPaths[2] or "Suppressed.mp3", "gun_sounds") end)
        end
    end, 4)'''

    injection = '''        elseif v == "Custom 2 (Suppressed)" then
            task.spawn(function() S.CustomGunSoundId = fetchCustomAsset(gunPaths[2] or "Suppressed.mp3", "gun_sounds") end)
        end
    end, 4)

    mkAction(secCustoms, "Preview Gun Sound", function()
        if S.CustomGunSoundId then
            local s = Instance.new("Sound")
            s.SoundId = S.CustomGunSoundId
            s.Volume = 1.5
            s.Parent = workspace
            s:Play()
            game.Debris:AddItem(s, 3)
        else
            local s = Instance.new("Sound")
            s.SoundId = "rbxassetid://342080352"
            s.Volume = 1
            s.Parent = workspace
            s:Play()
            game.Debris:AddItem(s, 3)
        end
    end, 4.1)'''

    content = content.replace(target, injection)
    
    with open(fpath, 'w', encoding='utf-8') as f:
        f.write(content)

patch_file("C:/Users/sadhasdkfj/Desktop/script/mm2/mm2.lua")
patch_file("C:/Users/sadhasdkfj/Desktop/script/mm2/mm2_mobile.lua")
print("Done patching.")
