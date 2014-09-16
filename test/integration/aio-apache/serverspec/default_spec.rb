# Encoding: utf-8

require_relative 'spec_helper'

# apache
if os[:family] == 'RedHat'
  describe service('httpd') do
    it { should be_enabled }
  end
  apache2ctl = '/usr/sbin/apachectl'
else
  describe service('apache2') do
    it { should be_enabled }
  end
  apache2ctl = '/usr/sbin/apachectl'
end
describe port(80) do
  it { should be_listening }
end
describe command("#{apache2ctl} -M") do
  it { should return_stdout(/^ ssl_module/) }
end

# memcache
describe service('memcached') do
  it { should be_enabled }
  it { should be_running }
end
describe port(11_211) do
  it { should be_listening }
end

# mysql-master
if os[:family] == 'RedHat'
  describe service('mysqld') do
    it { should be_enabled }
    it { should be_running }
  end
else
  describe service('mysql') do
    it { should be_enabled }
    it { should be_running }
  end
end
describe port(3306) do
  it { should be_listening }
end

# postgresql-master
if os[:family] == 'RedHat'
  # process is named postgres
  describe service('postgres') do
    it { should be_running }
  end
  # service is named postgresql...
  describe service('postgresql') do
    it { should be_enabled }
  end
  describe service('postgres') do
    it { should be_running }
  end
else
  describe service('postgresql') do
    it { should be_enabled }
    it { should be_running }
  end
  describe service('postgresql') do
    it { should be_running }
  end
end
describe port(5432) do
  it { should be_listening }
end

# varnish
describe service('varnish') do
  it { should be_enabled }
  it { should be_running }
end
describe port(6081) do
  it { should be_listening }
end

# mongo
describe port(27_017) do
  it { should be_listening }
end

# rabbitmq
describe service('rabbitmq-server') do
  it { should be_enabled }
  it { should be_running }
end
describe port(5672) do
  it { should be_listening }
end

# redis
# cannot name the service redis6379 because the check uses ps, not the actual service name
describe service('redis') do
  it { should be_running }
end
if os[:family] == 'RedHat'
  describe service('redis6379') do
    it { should be_enabled }
  end
end
describe port(6379) do
  it { should be_listening }
end

# pythonstack.ini
describe file('/etc/pythonstack.ini') do
  it { should be_file }
end