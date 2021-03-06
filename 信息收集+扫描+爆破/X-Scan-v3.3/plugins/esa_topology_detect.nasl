#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if (description)
{
  script_id(22133);
  script_version("$Revision: 1.5 $");

  script_name(english:"eIQnetworks Enterprise Security Analyzer Topology Server Detection");
  script_summary(english:"Detects an eIQnetworks Enterprise Security Analyzer Topology Server");

 script_set_attribute(attribute:"synopsis", value:
"A topology server is listening on the remote host." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a topology server from eIQnetworks
Enterprise Security Analyzer (ESA), a security information and event
management application." );
 script_set_attribute(attribute:"see_also", value:"http://www.eiqnetworks.com/products/EnterpriseSecurityAnalyzer.shtml" );
 script_set_attribute(attribute:"risk_factor", value:"None" );
 script_set_attribute(attribute:"solution", value:"n/a" );
script_end_attributes();


  script_category(ACT_GATHER_INFO);
  script_family(english:"Service detection");
  script_copyright(english:"This script is Copyright (C) 2006-2009 Tenable Network Security, Inc.");
  script_dependencies("find_service1.nasl");
  script_require_ports("Services/unknown", 10628);

  exit(0);
}


include("global_settings.inc");
include("misc_func.inc");


if (thorough_tests && ! get_kb_item("global_settings/disable_service_discovery")  ) {
  port = get_unknown_svc(10628);
  if (!port) exit(0);
}
else port = 10628;
if (!get_tcp_port_state(port)) exit(0);


# Make sure it looks like the Topology Server.
#
# nb: "GUIADDDEVICE&1" => "Error! Failed to add the Device"
#     "GUIADDDEVICE&1&2" => "Successfully Added"
soc = open_sock_tcp(port);
if (!soc) exit(0);

cmd = string("GUIADDDEVICE&", SCRIPT_NAME);
send(socket:soc, data:cmd);
res = recv(socket:soc, length:64);
close(soc);


# If it looks like the service...
if ("Failed to add the Device" >< res)
{
  # Register and report the service.
  register_service(port:port, ipproto:"tcp", proto:"esa_topology");
  security_note(port);
}
