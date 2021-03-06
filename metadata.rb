name 'plink'
maintainer 'Eagle Genomics Ltd'
maintainer_email 'info@eaglegenomics.com'
license 'Apache-2.0'
description 'Installs/Configures plink'
long_description 'Installs/Configures plink'
version '0.1.13'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
issues_url 'https://github.com/EagleGenomics/plink/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
source_url 'https://github.com/EagleGenomics/plink'

depends 'apt'
depends 'git'
depends 'magic_shell'
