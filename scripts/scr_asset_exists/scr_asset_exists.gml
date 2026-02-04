function scr_asset_exists(assetname){
	var asset = asset_get_index(assetname)
	return asset != -1
}