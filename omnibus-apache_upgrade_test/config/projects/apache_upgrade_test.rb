#
# Copyright 2017 YOUR NAME
#
# All Rights Reserved.
#

name "apache_upgrade_test"
maintainer "CHANGE ME"
homepage "https://CHANGE-ME.com"

# Defaults to C:/apache_upgrade_test on Windows
# and /opt/apache_upgrade_test on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# apache_upgrade_test dependencies/components
# dependency "somedep"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
