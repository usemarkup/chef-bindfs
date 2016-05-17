if node[:bindfs][:install]
    include_recipe 'bindfs::install'
end
