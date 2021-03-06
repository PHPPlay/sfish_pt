
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2006-878
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(24166);
 script_version ("$Revision: 1.4 $");
script_name(english: "Fedora 4 2006-878: libtiff");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2006-878 (libtiff)");
 script_set_attribute(attribute: "description", value: "The libtiff package contains a library of functions for manipulating
TIFF (Tagged Image File Format) image format files.  TIFF is a widely
used file format for bitmapped images.  TIFF files usually end in the
.tif extension and they are often quite large.

The libtiff package should be installed if you need to manipulate TIFF
format image files.

Update Information:

The libtiff package contains a library of functions for
manipulating TIFF (Tagged Image File Format) files.

Tavis Ormandy of Google discovered a number of flaws in
libtiff during a security audit. An attacker could create a
carefully crafted TIFF file in such a way that it was
possible to cause an application linked with libtiff to
crash or possibly execute arbitrary code. (CVE-2006-3459,
CVE-2006-3460, CVE-2006-3461, CVE-2006-3462, CVE-2006-3463,
CVE-2006-3464, CVE-2006-3465)

All users are advised to upgrade to these updated packages,
which contain backported fixes for these issues.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2006-3459", "CVE-2006-3461", "CVE-2006-3463", "CVE-2006-3465");
script_summary(english: "Check for the version of the libtiff package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"libtiff-3.7.1-6.fc4.3", release:"FC4") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
