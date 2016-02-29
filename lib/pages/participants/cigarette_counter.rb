class Participants
	class CigaretteCounter
		include Capybara::DSL

		def initialize(cigarette_counter)
			@count ||= cigarette_counter[:count]
			@date ||= cigarette_counter[:date]
			@day ||= cigarette_counter[:day]
			@plus_minus_day ||= cigarette_counter[:plus_minus_day]
			@locale ||= cigarette_counter[:locale]
		end

		def landing_page
			if @locale == english
				"#{ENV['Base_URL']}/#/en/cigarette-count"
			else
			"#{ENV['Base_URL']}/#/es/cigarette-count"
			end
		end

		def open
			click_on 'Cigarette Counter'
		end

		def visible_in_eng?
			if @locale == english
				has_text? 'How many cigarettes have you smoked?'
			else
				has_text? '¿Cuántos cigarros ha fumado?'
			end
		end

		def has_count?
			button_group.find('input[type = tel]')
				.has_text? @count.to_s
		end

		def has_count_in_graph?
			find('g', text: @date.strftime('%b %-d'))
				.has_text? @count.to_s
		end

		def increment_decrement_count
			button_group.find('.btn.btn-lg.btn-default', text: @plus_minus_day).click
		end

		private

		def button_group
			find('.pull-left', text: @day)
		end
	end
end
