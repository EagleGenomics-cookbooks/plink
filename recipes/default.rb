#
# Cookbook:: plink
# Recipe:: default
#
# Copyright:: 2017, The Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'apt' if node['platform_family'] == 'debian'

package 'unzip'

plink_zip = 'plink_linux_x86_64.zip'

remote_file "#{Chef::Config[:file_cache_path]}/#{plink_zip}" do
  source "https://www.cog-genomics.org/static/bin/plink171007/#{plink_zip}"
  action :create
end

execute 'unzip plink' do
  command "unzip -o #{plink_zip} -d /usr/local/lib/plink"
  cwd "#{Chef::Config[:file_cache_path]}/"
end

link '/usr/local/bin/plink' do
  to '/usr/local/lib/plink/plink'
  link_type :symbolic
end

link '/usr/local/bin/prettify' do
  to '/usr/local/lib/plink/prettify'
  link_type :symbolic
end

magic_shell_environment 'PLINK_VERSION' do
  value '`plink --version | xargs echo -n`'
end

# can't get source to compile
# include_recipe 'git'

# include_recipe 'build-essential'

# git "#{Chef::Config[:file_cache_path]}/plink" do
#   repository node[:plink][:git_repository]
#   revision node[:plink][:git_revision]
#   action :sync
# end

# g++-multilib
# libopenblas-dev

# # set up more de
# execute 'plink_first_compile' do
#   command './plink_first_compile'
#   cwd "#{Chef::Config[:file_cache_path]}/plink/1.9"
# end

# execute 'make plink' do
#   command 'make plink'
#   cwd "#{Chef::Config[:file_cache_path]}/plink/1.9"
# end
