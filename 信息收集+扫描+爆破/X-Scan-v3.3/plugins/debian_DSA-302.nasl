# This script was automatically generated from the dsa-302
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15139);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "302");
 script_cve_id("CVE-2003-0261");
 script_bugtraq_id(7521);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-302 security update');
 script_set_attribute(attribute: 'description', value:
'Joey Hess discovered that fuzz, a software stress-testing tool,
creates a temporary file without taking appropriate security
precautions.  This bug could allow an attacker to gain the privileges
of the user invoking fuzz, excluding root (fuzz does not allow itself
to be invoked as root).
For the stable distribution (woody) this problem has been fixed in
version 0.6-6woody1.
The old stable distribution (potato) does not contain a fuzz package.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2003/dsa-302');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2003/dsa-302
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA302] DSA-302-1 fuzz");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-302-1 fuzz");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'fuzz', release: '3.0', reference: '0.6-6woody1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
