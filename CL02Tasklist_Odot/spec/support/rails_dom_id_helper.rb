module RailsDomIdHelper
	def domIdFor(model)
		["#",ActionView::RecordIdentifier.dom_id(model)].join
	end
end