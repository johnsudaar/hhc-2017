class Entity < ApplicationRecord
	has_many:bloodtypes, :through => :bloodtypes_entities
end
