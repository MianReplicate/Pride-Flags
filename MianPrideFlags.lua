local mutatorName = "MianPrideFlags"
behaviour(mutatorName)

function MianPrideFlags:Awake()
	self.dataContainer = self.gameObject.GetComponent(DataContainer)
	self.additionalDataContainer = self.targets.AdditionalDataContainer.GetComponent(DataContainer)
	self.CustomFlags = self.dataContainer.GetTextureArray("Flag")
	self.CustomFlagToTeamColors = self.dataContainer.GetColorArray("Flag")

	for _, flag in ipairs(self.additionalDataContainer.GetTextureArray("Flag")) do
		table.insert(self.CustomFlags, flag)
	end

	for _, flag in ipairs(self.additionalDataContainer.GetColorArray("Flag")) do
		table.insert(self.CustomFlagToTeamColors, flag)
	end

	self.cover = self.dataContainer.GetTexture("Cover")
	self.name = mutatorName
end