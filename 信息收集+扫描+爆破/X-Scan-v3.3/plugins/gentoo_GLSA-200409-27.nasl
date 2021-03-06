# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200409-27.xml
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
 script_id(14790);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200409-27");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200409-27 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200409-27
(glFTPd: Local buffer overflow vulnerability)


    The glFTPd server is vulnerable to a buffer overflow in the \'dupescan\'
    program. This vulnerability is due to an unsafe strcpy() call which can
    cause the program to crash when a large argument is passed.
  
Impact

    A local user with malicious intent can pass a parameter to the dupescan
    program that exceeds the size of the buffer, causing it to overflow. This
    can lead the program to crash, and potentially allow arbitrary code
    execution with the permissions of the user running glFTPd, which could be
    the root user.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All glFTPd users should upgrade to the latest version:
    # emerge sync
    # emerge -pv ">=net-ftp/glftpd-1.32-r1"
    # emerge ">=net-ftp/glftpd-1.32-r1"
  ');
script_set_attribute(attribute: 'risk_factor', value: 'Medium');
script_set_attribute(attribute: 'see_also', value: 'http://www.securityfocus.com/archive/1/375775/2004-09-17/2004-09-23/0');
script_set_attribute(attribute: 'see_also', value: 'http://www.glftpd.com/modules.php?op=modload&name=News&file=article&sid=23&mode=thread&order=0&thold=0');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200409-27.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200409-27] glFTPd: Local buffer overflow vulnerability');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'glFTPd: Local buffer overflow vulnerability');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "net-ftp/glftpd", unaffected: make_list("ge 1.32-r1"), vulnerable: make_list("lt 1.32-r1")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
