class Participants
	class CigaretteCounter
		include Capybara::DSL

		def open
			click_on 'Cigarette Counter'
		end

		def visible_in_eng?
			has_text? 'How many cigarettes have you smoked?'
		end

		def visible_in_esp?
			has_text? '¿Cuántos cigarros ha fumado?'
		end
	end
end
