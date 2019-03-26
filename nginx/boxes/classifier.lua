local Classifier = {}

function Classifier:parse(prog, data_path)
  local cmd = { "/opt/object/bin/classifier.sh", data_path }
	return prog({
	  argv = cmd,
    stdin = data,
	  timeout_fatal = false
	}).stdout
end

function Classifier:new()
  local self = {}
  setmetatable(self, { __index = Classifier })
  return self
end

return Classifier
