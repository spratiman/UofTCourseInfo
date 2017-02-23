class Course < ApplicationRecord
	validates :code, uniqueness: true, presence: true
	validates :title, presence: true
	has_many :comments
	has_many :ratings
	has_many :users


	filterrific :default_filter_params => { :sorted_by => 'code_asc' },
			:available_filters => %w[
				sorted_by
				search_query
				with_code
				with_title
			]


	scope :sorted_by, lambda { |sort_option|
		# extract the sort direction from the param value.
	    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
	    case sort_option.to_s
	    when /^code/
	      order("courses.code #{ direction }")
	    when /^title/
	      order("LOWER(courses.title) #{ direction }")
	    else
	      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
	    end
	}


	scope :search_query, lambda { |query|
		return nil if query.blank?

		# condition query, parse into individual keywords
	    terms = query.downcase.split(/\s+/)

	    # replace "*" with "%" for wildcard searches,
	    # append '%', remove duplicate '%'s
	    terms = terms.map { |e|
	      (e.gsub('*', '%') + '%').gsub(/%+/, '%')
	    }

	    # configure number of OR conditions for provision
	    # of interpolation arguments. Adjust this if you
	    # change the number of OR conditions.
	    num_or_conditions = 3
	    where(
	      terms.map {
	        or_clauses = [
	          "LOWER(courses.code) LIKE ?",
	          "LOWER(courses.title) LIKE ?",
	          "LOWER(courses.description) LIKE ?"
	        ].join(' OR ')
	        "(#{ or_clauses })"
	      }.join(' AND '),
	      *terms.map { |e| [e] * num_or_conditions }.flatten
	    )

	}

	scope :with_code, lambda { |code|
		where(:code => [*code])
	}

	scope :with_title, lambda { |title|
		where(:title => [*title])
	}

	scope :with_description, lambda { |description|
		where(:description => [*description])
	}

	def self.options_for_sorted_by
		[
			['Code (a-z)', 'code_asc'],
			['Code (z-a)', 'code_desc'],
			['Title (a-z)', 'title_asc'],
			['Title (z-a)', 'title_desc']
		]
	end

	def self.update_db(code, title, description)
		if Course.exists?(:code => code)
			course = Course.where(code: code)
			course.update(title: title, description: description)
		else
			course = Course.new(code: code, title: title, description: description)
			course.save
		end
	end

	#Initialize Student Session
	def self.initialize(user_session=nil)
	  	if user_session
			@session = user_session
			@session[:student] ||= {}
		end
	end

end
