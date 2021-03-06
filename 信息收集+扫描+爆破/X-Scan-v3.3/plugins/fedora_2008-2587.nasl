
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2008-2587
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(31970);
 script_version ("$Revision: 1.3 $");
script_name(english: "Fedora 7 2008-2587: gallery2");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2008-2587 (gallery2)");
 script_set_attribute(attribute: "description", value: "The base Gallery 2 installation - the equivalent of upstream's -minimal
package.  This package requires a database to be operational.  Acceptable
database backends include MySQL v 3.x, MySQL v 4.x, PostgreSQL v 7.x,
PostgreSQL v 8.x, Oracle 9i, Oracle 10g, DB2, and MS SQL Server.  All given
package versions are minimums, greater package versions are acceptable.

-
ChangeLog:


Update information :

* Thu Mar 20 2008 John Berninger <john at ncphotography dot com> - 2.2.4-3
- revert to SVN snapshot so that config-time integrity checks don't fail
- remove embedded copy of smarty and use php-Smarty package
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2008-1066");
script_summary(english: "Check for the version of the gallery2 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"gallery2-2.2.4-3.fc7", release:"FC7") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
