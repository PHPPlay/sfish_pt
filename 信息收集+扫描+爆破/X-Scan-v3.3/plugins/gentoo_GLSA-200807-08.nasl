# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200807-08.xml
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
 script_id(33494);
 script_version("$Revision: 1.5 $");
 script_xref(name: "GLSA", value: "200807-08");
 script_cve_id("CVE-2008-1447");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200807-08 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200807-08
(BIND: Cache poisoning)


    Dan Kaminsky of IOActive has reported a weakness in the DNS protocol
    related to insufficient randomness of DNS transaction IDs and query
    source ports.
  
Impact

    An attacker could exploit this weakness to poison the cache of a
    recursive resolver and thus spoof DNS traffic, which could e.g. lead to
    the redirection of web or mail traffic to malicious sites.
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All BIND users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=net-dns/bind-9.4.2_p1"
    Note: In order to utilize the query port randomization to mitigate the
    weakness, you need to make sure that your network setup allows the DNS
    server to use random source ports for query and that you have not set a
    fixed query port via the "query-source port" directive in the BIND
    configuration.
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:P');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1447');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200807-08.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200807-08] BIND: Cache poisoning');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'BIND: Cache poisoning');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "net-dns/bind", unaffected: make_list("ge 9.4.2_p1"), vulnerable: make_list("lt 9.4.2_p1")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");
