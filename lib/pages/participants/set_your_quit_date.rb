class Participants
	# Page object for set your quit date.
	class SetYourQuitDate
		include Capybara::DSL

		def visible_in_eng?
			has_text? 'Your Quit Date:'
		end
	end
end
