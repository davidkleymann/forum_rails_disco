module ApplicationHelper
	def shallow_args(parent, child)
    child.try(:persisted?) ? child : [parent, child]
	end
end
