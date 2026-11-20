--!strict

assert(plugin, "This script must be run as a plugin")

const toolbar = plugin:CreateToolbar("Thumbnail Preview")
const button =
	toolbar:CreateButton("Preview", "Preview the thumbnail camera", "rbxasset://textures/ui/TopBar/inventoryOn.png")
button.ClickableWhenViewportHidden = true

const widgetInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, false, false, 200, 300, 150, 150)
const widget = plugin:CreateDockWidgetPluginGuiAsync("ThumbnailPreview", widgetInfo)
widget.Title = "Thumbnail Preview"

button.Click:Connect(function()
	widget.Enabled = not widget.Enabled
	button:SetActive(widget.Enabled)
end)

widget:BindToClose(function()
	button:SetActive(false)
end)
