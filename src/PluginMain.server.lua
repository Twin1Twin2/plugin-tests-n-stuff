
local Roact = require(script.Parent.Parent.Roact)

local pluginToolbar = plugin:CreateToolbar("Test Widget Plugin")
local pluginEnableButton = pluginToolbar:CreateButton("Toggle Button", "Toggle Button", "")


local function appElement(props)
    return Roact.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0);
        BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    }, {
        TestButton = Roact.createElement("TextButton", {
            Text = "Click Me!";
            Size = UDim2.new(0, 100, 0, 40);

            [Roact.Event.MouseButton1Click] = function(instance)
                print("Button was clicked!")
            end
        })
    })
end


local info = DockWidgetPluginGuiInfo.new(
    Enum.InitialDockState.Right,
    false,
    false,
    0,
    0
)

local pluginGui = plugin:CreateDockWidgetPluginGui("test_widget", info)
pluginEnableButton:SetActive(pluginGui.Enabled)

Roact.reify(appElement, pluginGui, "Plugin App")

pluginEnableButton.Click:Connect(function()
    pluginGui.Enabled = not pluginGui.Enabled
    pluginEnableButton:SetActive(pluginGui.Enabled)
end)
