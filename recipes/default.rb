execute 'get epel repo' do
  command 'wget --no-check-certificate https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm'
end

execute 'get epel repo' do
  command 'wget --no-check-certificate https://yum.dockerproject.org/repo/main/centos/7'
end

template '/etc/yum.repos.d/epel.repo' do
  source 'epel.repo.erb'
  owner 'root'
  group 'root'
  mode '755'
end

template '/etc/yum.repos.d/docker.repo' do
  source 'docker.repo.erb'
  owner 'root'
  group 'root'
  mode '755'
end

execute 'get gpg key' do
  command 'rpm --import http://download.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
end

execute 'yum update package' do
  command 'yum update -y'
end

package 'docker-engine' do
  version '1.11.1-1.el7.centos'
end

directory '/etc/systemd/system/docker.service.d' do
end

#template '/etc/systemd/system/docker.service.d/daemon.conf' do
#  source 'daemon.conf'
#  owner 'root'
#  group 'root'
#  mode '755'
#end

service 'docker' do
  action :start
end
