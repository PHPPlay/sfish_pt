
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41144);
 script_version("$Revision: 1.1 $");
 script_name(english: "SuSE9 Security Update:  Security update for tcpdump (11696)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE9 system is missing the security patch 11696");
 script_set_attribute(attribute: "description", value: 'A buffer overflow has been found in tcpdump which can be
triggered while displaying BGP packets. This could be
exploited by an attacker to execute malicious code under the
privileges of the user running tcpdump by presenting
specially prepared BGP packets to tcpdump. This issue is
tracked by CVE-2007-3798.
');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch 11696");
script_end_attributes();

script_cve_id("CVE-2007-3798");
script_summary(english: "Check for the security advisory #11696");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"tcpdump-3.8.1-49.10", release:"SUSE9", cpu: "i586") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
