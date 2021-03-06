
#
# (C) Tenable Network Security
#
# The text of this plugin is (C) Red Hat Inc.
#

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(34690);
 script_version ("$Revision: 1.5 $");
 script_name(english: "RHSA-2008-0957: kernel");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory RHSA-2008-0957");
 script_set_attribute(attribute: "description", value: '
  Updated kernel packages that resolve several security issues and fix
  various bugs are now available for Red Hat Enterprise Linux 5.

  This update has been rated as having important security impact by the Red
  Hat Security Response Team.

  [Updated 12th November 2008]
  The original packages distributed with this errata had a bug which
  prevented the Xen kernel booting on older hardware. We have updated the
  packages to correct this bug.

  The kernel packages contain the Linux kernel, the core of any Linux
  operating system.

  * the Xen implementation did not prevent applications running in a
  para-virtualized guest from modifying CR4 TSC. This could cause a local
  denial of service. (CVE-2007-5907, Important)

  * Tavis Ormandy reported missing boundary checks in the Virtual Dynamic
  Shared Objects (vDSO) implementation. This could allow a local unprivileged
  user to cause a denial of service or escalate privileges. (CVE-2008-3527,
  Important)

  * the do_truncate() and generic_file_splice_write() functions did not clear
  the setuid and setgid bits. This could allow a local unprivileged user to
  obtain access to privileged information. (CVE-2008-4210, CVE-2008-3833,
  Important)

  * a flaw was found in the Linux kernel splice implementation. This could
  cause a local denial of service when there is a certain failure in the
  add_to_page_cache_lru() function. (CVE-2008-4302, Important)

  * a flaw was found in the Linux kernel when running on AMD64 systems.
  During a context switch, EFLAGS were being neither saved nor restored. This
  could allow a local unprivileged user to cause a denial of service.
  (CVE-2006-5755, Low)

  * a flaw was found in the Linux kernel virtual memory implementation. This
  could allow a local unprivileged user to cause a denial of service.
  (CVE-2008-2372, Low)

  * an integer overflow was discovered in the Linux kernel Datagram
  Congestion Control Protocol (DCCP) implementation. This could allow a
  remote attacker to cause a denial of service. By default, remote DCCP is
  blocked by SELinux. (CVE-2008-3276, Low)

  In addition, these updated packages fix the following bugs:

  * random32() seeding has been improved.

  * in a multi-core environment, a race between the QP async event-handler
  and the destro_qp() function could occur. This led to unpredictable results
  during invalid memory access, which could lead to a kernel crash.

  * a format string was omitted in the call to the request_module() function.

  * a stack overflow caused by an infinite recursion bug in the binfmt_misc
  kernel module was corrected.

  * the ata_scsi_rbuf_get() and ata_scsi_rbuf_put() functions now check for
  scatterlist usage before calling kmap_atomic().

  * a sentinel NUL byte was added to the device_write() function to ensure
  that lspace.name is NUL-terminated.

  * in the character device driver, a range_is_allowed() check was added to
  the read_mem() and write_mem() functions. It was possible for an
  illegitimate application to bypass these checks, and access /dev/mem beyond
  the 1M limit by calling mmap_mem() instead. Also, the parameters of
  range_is_allowed() were changed to cleanly handle greater than 32-bits of
  physical address on 32-bit architectures.

  * some of the newer Nehalem-based systems declare their CPU DSDT entries as
  type "Alias". During boot, this caused an "Error attaching device data"
  message to be logged.

  * the evtchn event channel device lacked locks and memory barriers. This
  has led to xenstore becoming unresponsive on the Itanium   architecture.

  * sending of gratuitous ARP packets in the Xen frontend network driver is
  now delayed until the backend signals that its carrier status has been
  processed by the stack.

  * on forcedeth devices, whenever setting ethtool parameters for link speed,
  the device could stop receiving interrupts.

  * the CIFS \'forcedirectio\' option did not allow text to be appended to files.

  * the gettimeofday() function returned a backwards time on Intel   64.

  * residual-count corrections during UNDERRUN handling were added to the
  qla2xxx driver.

  * the fix for a small quirk was removed for certain Adaptec controllers for
  which it caused problems.

  * the "xm trigger init" command caused a domain panic if a userland
  application was running on a guest on the Intel   64 architecture.

  Users of kernel should upgrade to these updated packages, which contain
  backported patches to correct these issues.


');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:C");
script_set_attribute(attribute: "see_also", value: "http://rhn.redhat.com/errata/RHSA-2008-0957.html");
script_set_attribute(attribute: "solution", value: "Get the newest RedHat Updates.");
script_end_attributes();

script_cve_id("CVE-2006-5755", "CVE-2007-5907", "CVE-2008-2372", "CVE-2008-3276", "CVE-2008-3527", "CVE-2008-3833", "CVE-2008-4210", "CVE-2008-4302");
script_summary(english: "Check for the version of the kernel packages");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/RedHat/rpm-list") ) exit(1, "Could not get the list of packages");

if ( rpm_check( reference:"kernel-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-PAE-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-PAE-devel-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-debug-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-debug-devel-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-devel-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-doc-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-headers-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-xen-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"kernel-xen-devel-2.6.18-92.1.18.el5", release:'RHEL5') )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host if not affected");
