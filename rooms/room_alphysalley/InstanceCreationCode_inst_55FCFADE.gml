USECUSTOMFUNC = true
CUSTOM_FUNC = function() {
	scr_speaker("none")
	msgset(0, "* (It's a saucer of milk.)/%")
	if scr_havechar(DRCharacter.Susie) {
		scr_speaker("susie")
		msgset(0, "\\E7* Hey Kris^1, this free milk? It's amazing./")
		msgnext("\\E2* It just magically refreshes itself over night./%")
	}
}