class SearchVolonteer < ActiveRecord::Base
	validates_format_of :city, :with => /\A\p{Lu}{1}\p{L}{2,}(\-{1}\p{Lu}{1}\p{L}{2,})*\z/,
		:message => "jest niepoprawna!"
		def search_volonteers
		volonteers = Volonteer.all

		volonteers = volonteers.where(["city LIKE ?", "%#{city}%"]) if city.present?
		volonteers = volonteers.where(["volontary_type_id LIKE ?", volontary_type_id]) if volontary_type_id.present?

		return volonteers
	end
end
