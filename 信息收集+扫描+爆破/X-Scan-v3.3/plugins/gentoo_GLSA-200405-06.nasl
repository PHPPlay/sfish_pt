# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200405-06.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(14492);
 script_version("$Revision: 1.6 $");
 script_xref(name: "GLSA", value: "200405-06");
 script_cve_id("CVE-2004-0421");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200405-06 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200405-06
(libpng denial of service vulnerability)


    libpng provides two functions (png_chunk_error and png_chunk_warning) for
    default error and warning messages handling. These functions do not perform
    proper bounds checking on the provided message, which is limited to 64
    bytes. Programs linked against this library may crash when handling a
    malicious PNG image.
  
Impact

    This vulnerability could be used to crash various programs using the libpng
    library, potentially resulting in a denial of service attack on vulnerable
    daemon processes.
  
Workaround

    There is no known workaround at this time. All users are advised to upgrade
    to the latest available version of libpng.
  
');
script_set_attribute(attribute:'solution', value: '
    All users of libpng should upgrade to the latest stable version:
    # emerge sync
    # emerge -pv ">=media-libs/libpng-1.2.5-r5"
    # emerge ">=media-libs/libpng-1.2.5-r5"
    You should also run revdep-rebuild to rebuild any packages that depend on
    older versions of libpng :
    # revdep-rebuild
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CAN-2004-0421');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200405-06.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200405-06] libpng denial of service vulnerability');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'libpng denial of service vulnerability');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "media-libs/libpng", unaffected: make_list("ge 1.2.5-r5"), vulnerable: make_list("le 1.2.5-r4")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
