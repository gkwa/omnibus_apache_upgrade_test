name "apache"
default_version "2.4.23"

zip_basedir='Apache24'

case version
when "2.4.23", "2.4.25"
  vc = "VC14"
end

if windows_arch_i386? && version == "2.4.25"
  arch_suffix = "win32" 
  source md5: "259c62962f45b2c1d7fd0ea2b3293760"
elsif !windows_arch_i386? && version == "2.4.25"
  arch_suffix = "win64"
  source md5: "eb6642b253fcf04d288c0f518f131acd"
elsif windows_arch_i386? && version == "2.4.23"
  arch_suffix = "win32" 
  source md5: "a046f2376c41feba8deab6574619aff5"
elsif !windows_arch_i386? && version == "2.4.23"
  arch_suffix = "win64"
  source md5: "0ff8da7a1ba44b9fcce23b7d77721ab0"
end

source url: "http://installer-bin.streambox.com.s3.amazonaws.com/httpd-#{version}-#{arch_suffix}-#{vc}.zip"

build do
  delete "#{zip_basedir}/logs/install.log"
  delete "#{zip_basedir}/lib"
  delete "#{zip_basedir}/*.txt"
  delete "#{zip_basedir}/include"
  delete "#{zip_basedir}/bin/iconv"
  delete "#{zip_basedir}/icons"
  delete "#{zip_basedir}/error"
  delete "#{zip_basedir}/cgi-bin"
  delete "#{zip_basedir}/manual"
  copy "#{zip_basedir}", "#{install_dir}/apache"
end
