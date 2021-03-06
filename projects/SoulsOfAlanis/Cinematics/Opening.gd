extends "Cinematic.gd"

var introText = "This is Alanis, she's a paraplegic cat that lives alone with her Tutor."

var texts = [ "The Tutor has just told her a tale, one about a mighty warrior who was about to lose his wife to a unknown illness.",
				"In the history, the brave warrior went on a quest to find a legendary orb that could grant any wish to whom ever holds it.",
				"It took a lot of afford, but the warrior did manage to get the orb and save his beloved wife.",
				"However, he soon realized that people with bad intentions could use the orb to do what ever they wanted.",
				"So, with the help of his wife, he decided to create a caste and fill it with creatures to protected the orb;",
				"That way only a brave knight of pure heart could retrieve the wishing orb.",
				"Now, Alanis is about to fall asleep, I wonder what would she dream of."]

func _input(event):
	if event.is_action_pressed("player_debug"):
		emit_signal("finished_cinematic", self)
	return

func _ready():
	self.init(self.s, self.introText, self.texts)
	._ready()
	self.start("Intro")
	return

func enabled(b):
	$Background.visible = b
	$Background/Alanis.visible = b
	$Background/FirePlace.visible = b
	$TextBox.enabled(b)
	return
