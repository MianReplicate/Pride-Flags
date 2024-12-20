local mutatorName = "MianPrideFlags"
behaviour(mutatorName)

function MianPrideFlags:Awake()
	self.frameworkName = "Flag Framework(Clone)"
	self.dataContainer = self.gameObject.GetComponent(DataContainer)
	self.CustomFlags = self.dataContainer.GetTextureArray("Flag")
	self.CustomFlagTeamColors = self.dataContainer.GetColorArray("Flag")
	self.cover = self.dataContainer.GetTexture("Cover")
end

function MianPrideFlags:Start()
	local obj = GameObject.Find(self.frameworkName)
	if(obj) then
		self.framework = ScriptedBehaviour.GetScript(obj)
	else
		error("Framework was not found! Please make sure the Custom Flags Framework mutator has been enabled.")
	end

	local mutatorData = {
		name = mutatorName,
		cover = self.cover
	}

	for index, texture in pairs(self.CustomFlags) do
		self.framework:addTextureData(mutatorData, texture, self.CustomFlagTeamColors[index])
	end
end