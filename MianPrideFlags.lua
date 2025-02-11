local mutatorName = "MianPrideFlags"
behaviour(mutatorName)

function MianPrideFlags:Awake()
	self.frameworkName = "Custom Flag Framework"
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

function MianPrideFlags:Start()
	local obj = GameObject.Find(self.frameworkName)
	if(obj) then
		self.framework = ScriptedBehaviour.GetScript(obj)
	else
		error("Framework was not found! Please make sure the Custom Flags Framework mutator has been enabled.")
	end

	self.framework:addFlagPack(self)
end