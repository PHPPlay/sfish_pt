
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2008-6440
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(33521);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 9 2008-6440: wireshark");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2008-6440 (wireshark)");
 script_set_attribute(attribute: "description", value: "Wireshark is a network traffic analyzer for Unix-ish operating systems.

This package lays base for libpcap, a packet capture and filtering
library, contains command-line utilities, contains plugins and
documentation for wireshark. A graphical user interface is packaged
separately to GTK+ package.

-
Update Information:

Upgrade to upstream 1.0.2 that fixes several security vulnerabilities:
[9]http://www.wireshark.org/security/wnpa-sec-2008-03.html
[10]http://www.wireshark.org/security/wnpa-sec-2008-04.html
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2008-3137", "CVE-2008-3138", "CVE-2008-3139", "CVE-2008-3140", "CVE-2008-3141", "CVE-2008-3145");
script_summary(english: "Check for the version of the wireshark package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"wireshark-1.0.2-1.fc9", release:"FC9") )
{
 security_warning(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
