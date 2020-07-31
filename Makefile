all:
	mix deps.get
	mix deps.compile
	(cd assets && npm install)
