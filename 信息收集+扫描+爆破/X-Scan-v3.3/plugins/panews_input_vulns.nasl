#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description) {
  script_id(17574);
  script_version("$Revision: 1.6 $");

  script_cve_id("CVE-2005-0646", "CVE-2005-0647");
  script_bugtraq_id(12687);
  script_xref(name:"OSVDB", value:"15451");
  script_xref(name:"OSVDB", value:"15452");

  script_name(english:"paNews 2.0.4b Multiple Input Validation Vulnerabilities");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP application that suffers from
multiple flaws." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of paNews that suffers from the
following vulnerabilities:

  - SQL Injection Issue in the 'login' method of includes/auth.php.
    A remote attacker can leverage this vulnerability to add 
    users with arbitrary privileges.

  - Local Script Injection Vulnerability in includes/admin_setup.php.
    A user defined to the system (see above) can inject arbitrary
    PHP code into paNews' config.php via the 'comments' and 
    'autapprove' parameters of the 'admin_setup.php'
    script." );
 script_set_attribute(attribute:"see_also", value:"http://www.kernelpanik.org/docs/kernelpanik/panews.txt" );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2005-03/0006.html" );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );
script_end_attributes();

 
  script_summary(english:"Detects input validation vulnerabilities in paNews");
  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
  script_family(english:"CGI abuses");
 
  script_dependencies("panews_detect.nasl");
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_require_ports("Services/www", 80);

  exit(0);
}

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");


port = get_http_port(default:80);
if (!can_host_php(port:port)) exit(0);


# Test an install.
install = get_kb_item(string("www/", port, "/panews"));
if (isnull(install)) exit(0);
matches = eregmatch(string:install, pattern:"^(.+) under (/.*)$");
if (!isnull(matches)) {
  ver = matches[1];

  if (ver && ver =~  "^([0-1]\.|2\.0b[0-4])$")
  {
   security_hole(port);
   set_kb_item(name: 'www/'+port+'/SQLInjection', value: TRUE);
  }
}
