# Install a package from the repo (yum)
package 'vim' do
    action :install
end

# Manage a file
file '/example-file' do
    owner 'root'
    group 'root'
    mode '0755'
    action :create
    content "hello"
end

# Use erb to manage file
template '/example-template' do
    source 'template.erb'
    owner 'root'
    group 'root'
    mode '0755'
    variables({
        :value => node[:chef_template][:value]
    })
end
