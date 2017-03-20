name "apache"
default_version "2.4.25"
skip_transitive_dependency_licensing true

license "Apache License 2.0"
license_file "Apache24/LICENSE.txt"

zip_basedir='Apache24'

case version
when "2.4.23"
  if windows_arch_i386?
    url = 'https://www.apachelounge.com/download/VC10/binaries/httpd-2.4.23-win32.zip'
    md5 = 'ff26d47167e271f4de9d3bd194056225'
  else
    url = 'https://www.apachelounge.com/download/VC10/binaries/httpd-2.4.23-win64.zip'
    md5 =  '84d7465763468d8d47d5c725b3e79171'
  end
when "2.4.25"
  if windows_arch_i386?
    url = 'https://www.apachelounge.com/download/VC14/binaries/httpd-2.4.25-win32-VC14.zip'
    md5 = '259c62962f45b2c1d7fd0ea2b3293760'
  else
    url = 'https://www.apachelounge.com/download/VC14/binaries/httpd-2.4.25-win64-VC14.zip'
    md5 = 'eb6642b253fcf04d288c0f518f131acd'
  end
end

vc = (url.match(/.*(VC\d+)/i).captures)[0]

source url: url, md5: md5

build do
  delete "#{zip_basedir}/logs/install.log"
  delete "#{zip_basedir}/lib"
  delete "#{zip_basedir}/include"
  delete "#{zip_basedir}/bin/iconv"
  delete "#{zip_basedir}/icons"
  delete "#{zip_basedir}/error"
  delete "#{zip_basedir}/cgi-bin"
  delete "#{zip_basedir}/manual"
  copy "#{zip_basedir}", "#{install_dir}/apache"
end
