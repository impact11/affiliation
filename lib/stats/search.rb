module Stats
	class Search < Stats::Base
		attr_accessor :terms, :page_views
		
		def create
			self.terms = {} 
			@page_views = PageView.all( :default => PageView::DEFAULT )#.select{ |p| end_date.compare_with_coercion(p.created_at) }
			@page_views.each do |view|
				begin
					extra = view.get_extra_data
					term = extra["search_terms"].downcase
					self.terms[term] ||= 0
					self.terms[term] += 1
				rescue Exception
					next
				ensure
					self.terms.delete(nil)
				end	
			end

			self.terms = self.terms.sort.sort{|a,b| a[1] <=> b[1]}.reverse
		end
	end
end
