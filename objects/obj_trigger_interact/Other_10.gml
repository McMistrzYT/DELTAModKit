var faceallowed = true

if (!face0allowed && global.facing == 0) faceallowed = false
if (!face1allowed && global.facing == 1) faceallowed = false
if (!face2allowed && global.facing == 2) faceallowed = false
if (!face3allowed && global.facing == 3) faceallowed = false

if (faceallowed) {
	if (strict) {
		if (global.interact == 0) myinteract = 3
	} else {
		myinteract = 3
	}
}
