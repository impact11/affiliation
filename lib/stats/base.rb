module Stats
	class Base
		attr_accessor :start_date, :end_date

		def initialize(options = {})
			self.start_date = ( options[:start_date] ? options[:start_date] : DateTime.now - 30.days ).beginning_of_day
			self.end_date = ( options[:end_date] ? options[:end_date] : DateTime.now ).end_of_day
			self.send(:create) if self.respond_to?(:create)
		end
	end
end
