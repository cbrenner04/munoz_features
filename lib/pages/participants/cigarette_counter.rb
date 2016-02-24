class Participants
	class CigaretteCounter
		include Capybara::DSL

		def open
			click_on 'Cigarette Counter'
		end

		def visible?
			has_text? 'How many cigarettes have you smoked?'
		end
	end
end
