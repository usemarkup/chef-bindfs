case node[:platform_family]
when 'debian'
    package 'bindfs'
when 'rhel'
    package 'fuse'
    package 'fuse-devel'

    include_recipe 'build-essential::default'

    remote_file "#{Chef::Config[:file_cache_path]}/bindfs-#{node[:bindfs][:version]}.tar.gz" do
      source    "#{node[:bindfs][:mirror]}/downloads/bindfs-#{node[:bindfs][:version]}.tar.gz"
      checksum  node[:bindfs][:checksum]
      notifies  :run, "bash[unpackbindfs]", :immediately
    end

    bash 'unpackbindfs' do
      code      "tar xzf #{Chef::Config[:file_cache_path]}/bindfs-#{node[:bindfs][:version]}.tar.gz -C #{Chef::Config[:file_cache_path]}"
      not_if    "test -d #{Chef::Config[:file_cache_path]}/bindfs-#{node[:bindfs][:version]}"
      action    :nothing
      notifies  :run, "bash[installbindfs]", :immediately
    end

    bash 'installbindfs' do
      code      "cd #{Chef::Config[:file_cache_path]}/bindfs-#{node[:bindfs][:version]} && ./configure && make && make install"
      not_if    "which bindfs"
      action    :nothing
    end
end
