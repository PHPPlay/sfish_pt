#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
  script_id(12008);
  script_version("$Revision: 1.11 $");
  script_cve_id("CVE-2004-0068");
  script_bugtraq_id(9424);
  script_xref(name:"OSVDB", value:"3505");

  script_name(english:"PhpDig config.php relative_script_path Parameter Remote File Inclusion");

 script_set_attribute(attribute:"synopsis", value:
"Arbitrary code may be executed on the remote server." );
 script_set_attribute(attribute:"description", value:
"The remote host is running phpdig, an http search engine written in PHP.
There is a flaw in this product which may allow an attacker to execute
arbitrary PHP code on this by forcing this set of CGI to include a PHP
script hosted on a third party host." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to the latest version of this software." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 
  script_summary(english:"Detect phpdig code injection vuln");
  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security, Inc.");
  script_family(english:"CGI abuses");
  script_dependencie("webmirror.nasl", "http_version.nasl");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

if (! can_host_php(port:port) ) exit(0);


function check_dir(path)
{
 local_var u, r, res;
 u = strcat(path, "/includes/config.php?relative_script_path=http://xxxxxxx");
 r = http_send_recv3(method: "GET", item: u, port:port);
 if (isnull(r)) exit(0);
 res = strcat(r[0], r[1], '\r\n', r[2]);
 if ("http://xxxxxxx/libs/.php" >< res) 
 {
  security_hole(port);
  exit(0);
 }
}

foreach dir (cgi_dirs())
{
check_dir(path:dir);
}
