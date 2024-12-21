local mutatorName = "MianPrideFlags"
behaviour(mutatorName)

function MianPrideFlags:Awake()
	self.frameworkName = "Custom Flag Framework"
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

	self.framework:addTexturePack(mutatorName, self)
end