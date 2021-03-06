# This script was automatically generated from the dsa-146
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(14983);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "146");
 script_cve_id("CVE-2002-0391");
 script_bugtraq_id(5356);
 script_xref(name: "CERT", value: "192995");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-146 security update');
 script_set_attribute(attribute: 'description', value:
'An integer overflow bug has been discovered in the RPC library used by
dietlibc, a libc optimized for small size, which is derived from the
SunRPC library.  This bug could be exploited to gain unauthorized root
access to software linking to this code.  The packages below also fix
integer overflows in the calloc, fread and fwrite code.  They are also
more strict regarding hostile DNS packets that could lead to a
vulnerability otherwise.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2002/dsa-146');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your dietlibc packages immediately.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA146] DSA-146-2 dietlibc");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-146-2 dietlibc");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'dietlibc-dev', release: '3.0', reference: '0.12-2.4');
deb_check(prefix: 'dietlibc-doc', release: '3.0', reference: '0.12-2.4');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
