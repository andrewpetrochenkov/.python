USERNAME:=$(shell git config user.name)
REMOTE_URL:=git@github.com:$(USERNAME)/dev-scripts.git

all:
	find -H ~/git -type d -mindepth 1 -maxdepth 1 -exec ln -hfns ~/git/dev-scripts/repo {}/.dev-scripts \;
	# known-issue: not expandable for this repo in IDE (Sublime)
	rm -fr .git
	git init
	git add -A
	git commit -m 'new';:
	git remote add "origin" "$(REMOTE_URL)";:
	git push -f --all origin

