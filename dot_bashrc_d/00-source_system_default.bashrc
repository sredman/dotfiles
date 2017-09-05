# Fedora wants to source the default .bashrc. This makes sense. Why doesn't Ubuntu do that?
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi
