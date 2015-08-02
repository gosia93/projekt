class SearchOrganisation < ActiveRecord::Base
	
		def search_organisations
		organisations = Organisation.all

		organisations = organisations.where(["city LIKE ?", "%#{city}%"]) if city.present?
		organisations = organisations.where(["volontary_type_id LIKE ?", volontary_type_id]) if volontary_type_id.present?

		return organisations
	end
end
