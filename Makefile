package_name := telegram-wingpanel-icons

.PHONY: try
try:
	cp icons/*-panel.svg ~/.local/share/icons/hicolor/scalable/apps/

.PHONY: build
build:
	rm -rf build
	mkdir -p build/DEBIAN build/usr/share/icons/hicolor/scalable/apps
	
	envsubst <debian/control >build/DEBIAN/control
	cp icons/*-panel.svg build/usr/share/icons/hicolor/scalable/apps/
	
	dpkg-deb -v --root-owner-group --build build ${package_name}.deb
	lintian ${package_name}.deb
