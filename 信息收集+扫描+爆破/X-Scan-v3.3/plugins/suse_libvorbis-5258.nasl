
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(32473);
 script_version ("$Revision: 1.2 $");
 script_name(english: "SuSE Security Update:  libvorbis security update (libvorbis-5258)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch libvorbis-5258");
 script_set_attribute(attribute: "description", value: "Several security problems were fixed in libvorbis:

* CVE-2008-1419 - Division by zero
* CVE-2008-1420 - integer overflow
* CVE-2008-1423 - integer overflow
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch libvorbis-5258");
script_end_attributes();

script_cve_id("CVE-2008-1419", "CVE-2008-1420", "CVE-2008-1423");
script_summary(english: "Check for the libvorbis-5258 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"libvorbis-1.2.0-11.2", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"libvorbis-32bit-1.2.0-11.2", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"libvorbis-64bit-1.2.0-11.2", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"libvorbis-devel-1.2.0-11.2", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"libvorbis-doc-1.2.0-11.2", release:"SUSE10.3") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");
