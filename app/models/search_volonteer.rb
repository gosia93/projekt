class SearchVolonteer < ActiveRecord::Base
	
		def search_volonteers
		volonteers = Volonteer.all

		volonteers = volonteers.where(["city LIKE ?", "%#{city}%"]) if city.present?
		volonteers = volonteers.where(["volontary_type_id LIKE ?", volontary_type_id]) if volontary_type_id.present?

		return volonteers
	end
end
