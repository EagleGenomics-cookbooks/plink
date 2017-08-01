name 'plink'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'Apache-2.0'
description 'Installs/Configures plink'
long_description 'Installs/Configures plink'
version '0.1.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/plink/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/plink'

depends 'apt'

