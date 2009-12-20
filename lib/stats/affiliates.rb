module Stats
	class Affiliates < Stats::Base
		attr_accessor :affiliates

		def create
			self.affiliates = {}

			Affiliate.all.each do |affiliate|
				self.affiliates[affiliate.login] = affiliate.trackbacks.size if affiliate.trackbacks.size > 0 
			end

			self.affiliates = self.affiliates.sort
		end
	end
end
