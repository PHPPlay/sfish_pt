
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if (NASL_LEVEL < 3000 ) exit(0);

if(description)
{
 script_id(32050);
 script_version ("$Revision: 1.9 $");
 script_name(english: "SuSE Security Update:  Security update for IBM Java 1.5.0 (java-1_5_0-ibm-5183)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch java-1_5_0-ibm-5183");
 script_set_attribute(attribute: "description", value: "IBM Java 5 was updated to SR7 to fix various security
issues:

- CVE-2008-1196: A buffer overflow vulnerability in Java
  Web Start may allow an untrusted Java Web Start
  application that is downloaded from a website to elevate
  its privileges. For example, an untrusted Java Web Start
  application may grant itself permissions to read and
  write local files or execute local applications that are
  accessible to the user running the untrusted application.

- CVE-2008-1195: A vulnerability in the Java Runtime
  Environment may allow JavaScript(TM) code that is
  downloaded by a browser to make connections to network
  services on the system that the browser runs on, through
  Java APIs, This may allow files (that are accessible
  through these network services) or vulnerabilities (that
  exist on these network services) which are not otherwise
  normally accessible to be accessed or exploited.

- CVE-2008-1194: Two buffer overflow vulnerabilities may
  allow an untrusted applet or application to cause the
  Java Runtime Environment to crash.

- CVE-2008-1194: A buffer overflow vulnerability in the
  Java Runtime Environment image parsing code may allow an
  untrusted applet or application to create a
  denial-of-service condition, by causing the Java Runtime
  Environment to crash.

- CVE-2008-1193: A buffer overflow vulnerability in the
  Java Runtime Environment image parsing code allow an
  untrusted applet or application to elevate its
  privileges. For example, an application may grant itself
  permissions to read and write local files or execute
  local applications that are accessible to the user
  running the untrusted application.

- CVE-2008-1192: A vulnerability in the Java Plug-in may an
  untrusted applet to bypass same origin policy and
  leverage this flaw to execute local applications that are
  accessible to the user running the untrusted applet.

- CVE-2008-1190: A vulnerability in Java Web Start may
  allow an untrusted Java Web Start application to elevate
  its privileges. For example, an application may grant
  itself permissions to read and write local files or
  execute local applications that are accessible to the
  user running the untrusted application.

- CVE-2008-1189: A buffer overflow vulnerability in the
  Java Runtime Environment may allow an untrusted applet or
  application to elevate its privileges. For example, an
  applet may grant itself permissions to read and write
  local files or execute local applications that are
  accessible to the user running the untrusted applet.

- CVE-2008-1188: Two buffer overflow vulnerabilities in
  Java Web Start may independently allow an untrusted Java
  Web Start application to elevate its privileges. For
  example, an untrusted Java Web Start application may
  grant itself permissions to read and write local files or
  execute local applications that are accessible to the
  user running the untrusted application.

- CVE-2008-1187: A vulnerability in the Java Runtime
  Environment with parsing XML data may allow an untrusted
  applet or application to elevate its privileges. For
  example, an applet may read certain URL resources (such
  as some files and web pages).

- CVE-2008-0657: A vulnerability in the Java Runtime
  Environment may allow an untrusted application or applet
  that is downloaded from a website to elevate its
  privileges. For example, the application or applet may
  grant itself permissions to read and write local files or
  execute local applications that are accessible to the
  user running the untrusted application or applet.

- CVE-2007-5232: A vulnerability in the Java Runtime
  Environment (JRE) with applet caching may allow an
  untrusted applet that is downloaded from a malicious
  website to make network connections to network services
  on machines other than the one that the applet was
  downloaded from. This may allow network resources (such
  as web pages) and vulnerabilities (that exist on these
  network services) which are not otherwise normally
  accessible to be accessed or exploited.

- CVE-2007-5274: A vulnerability in the Java Runtime
  Environment (JRE) may allow malicious Javascript code
  that is downloaded by a browser from a malicious website
  to make network connections, through Java APIs, to
  network services on machines other than the one that the
  Javascript code was downloaded from. This may allow
  network resources (such as web pages) and vulnerabilities
  (that exist on these network services) which are not
  otherwise normally accessible to be accessed or exploited.

- CVE-2007-5273: A second vulnerability in the JRE may
  allow an untrusted applet that is downloaded from a
  malicious website through a web proxy to make network
  connections to network services on machines other than
  the one that the applet was downloaded from. This may
  allow network resources (such as web pages) and
  vulnerabilities (that exist on these network services)
  which are not otherwise normally accessible to be
  accessed or exploited.

- CVE-2007-5236: An untrusted Java Web Start application
  may write arbitrary files with the privileges of the user
  running the application.

- CVE-2007-5238: Three separate vulnerabilities may allow
  an untrusted Java Web Start application to determine the
  location of the Java Web Start cache.

- CVE-2007-5239: An untrusted Java Web Start application or
  Java applet may move or copy arbitrary files by
  requesting the user of the application or applet to drag
  and drop a file from the Java Web Start application or
  Java applet window.

- CVE-2007-5240: An untrusted applet may display an
  over-sized window so that the applet warning banner is
  not visible to the user running the untrusted applet.

- CVE-2007-4381: A vulnerability in the font parsing code
  in the Java Runtime Environment may allow an untrusted
  applet to elevate its privileges. For example, an applet
  may grant itself permissions to read and write local
  files or execute local applications that are accessible
  to the user running the untrusted applet.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch java-1_5_0-ibm-5183");
script_end_attributes();

script_cve_id("CVE-2007-4381", "CVE-2007-5232", "CVE-2007-5236", "CVE-2007-5238", "CVE-2007-5239", "CVE-2007-5240", "CVE-2007-5273", "CVE-2007-5274", "CVE-2008-0657", "CVE-2008-1187", "CVE-2008-1188", "CVE-2008-1189", "CVE-2008-1190", "CVE-2008-1192", "CVE-2008-1193", "CVE-2008-1194", "CVE-2008-1195", "CVE-2008-1196");
script_summary(english: "Check for the java-1_5_0-ibm-5183 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");

if ( rpm_check( reference:"java-1_5_0-ibm-1.5.0_sr7-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-alsa-1.5.0_sr7-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-devel-1.5.0_sr7-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-fonts-1.5.0_sr7-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-jdbc-1.5.0_sr7-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-plugin-1.5.0_sr7-0.2", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-1.5.0_sr7-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-alsa-1.5.0_sr7-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-demo-1.5.0_sr7-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-devel-1.5.0_sr7-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-jdbc-1.5.0_sr7-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-plugin-1.5.0_sr7-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"java-1_5_0-ibm-src-1.5.0_sr7-0.2", release:"SLED10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
