enum Rating {
	S,
	A,
	B,
	C,
	D,
	NONE,
}

function get_rating_str(rating) {
	switch(rating) {
		case Rating.S: return "S"
		case Rating.A: return "A"
		case Rating.B: return "B"
		case Rating.C: return "C"
		case Rating.D: return "D"
	}
}