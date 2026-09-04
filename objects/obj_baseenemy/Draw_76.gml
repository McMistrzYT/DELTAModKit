// Moved to Here so it is Initialized Before drawing begins, Pre-Draw runs After Create and other things setting stuff, But Before Step.
if !init {
	scr_enemy_set_sprites(enemyId);
	init = true;
}