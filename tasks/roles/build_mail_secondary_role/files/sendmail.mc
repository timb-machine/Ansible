divert(-1)dnl
#-----------------------------------------------------------------------------
# $Sendmail: debproto.mc,v 8.15.2 2015-12-10 18:02:49 cowboy Exp $
#
# Copyright (c) 1998-2010 Richard Nelson.  All Rights Reserved.
#
# cf/debian/sendmail.mc.  Generated from sendmail.mc.in by configure.
#
# sendmail.mc prototype config file for building Sendmail 8.15.2
#
# Note: the .in file supports 8.7.6 - 9.0.0, but the generated
#	file is customized to the version noted above.
#
# This file is used to configure Sendmail for use with Debian systems.
#
# If you modify this file, you will have to regenerate /etc/mail/sendmail.cf
# by running this file through the m4 preprocessor via one of the following:
#	* make   (or make -C /etc/mail)
#	* sendmailconfig 
#	* m4 /etc/mail/sendmail.mc > /etc/mail/sendmail.cf
# The first two options are preferred as they will also update other files
# that depend upon the contents of this file.
#
# The best documentation for this .mc file is:
# /usr/share/doc/sendmail-doc/cf.README.gz
#
#-----------------------------------------------------------------------------
divert(0)dnl
#
#   Copyright (c) 1998-2005 Richard Nelson.  All Rights Reserved.
#
#  This file is used to configure Sendmail for use with Debian systems.
#
define(`_USE_ETC_MAIL_')dnl
include(`/usr/share/sendmail/cf/m4/cf.m4')dnl
VERSIONID(`$Id: sendmail.mc, v 8.15.2-3 2015-12-10 18:02:49 cowboy Exp $')
OSTYPE(`debian')dnl
DOMAIN(`debian-mta')dnl
dnl # Items controlled by /etc/mail/sendmail.conf - DO NOT TOUCH HERE
undefine(`confHOST_STATUS_DIRECTORY')dnl        #DAEMON_HOSTSTATS=
dnl # Items controlled by /etc/mail/sendmail.conf - DO NOT TOUCH HERE
dnl #
dnl # General defines
dnl #
dnl # SAFE_FILE_ENV: [undefined] If set, sendmail will do a chroot()
dnl #	into this directory before writing files.
dnl #	If *all* your user accounts are under /home then use that
dnl #	instead - it will prevent any writes outside of /home !
dnl #   define(`confSAFE_FILE_ENV',             `')dnl
dnl #
dnl # Daemon options - restrict to servicing LOCALHOST ONLY !!!
dnl # Remove `, Addr=' clauses to receive from any interface
dnl # If you want to support IPv6, switch the commented/uncommentd lines
dnl #
include(`/etc/mail/tls/starttls.m4')dnl
include(`/etc/mail/sasl/sasl.m4')dnl
FEATURE(`no_default_msa')dnl
DAEMON_OPTIONS(`Family=inet, Name=MTA-v4, Port=smtp, Addr=127.0.0.1')dnl
DAEMON_OPTIONS(`Family=inet6, Name=MTA-v6, Port=smtp, Addr=0:0:0:0:0:0:0:1')dnl
DAEMON_OPTIONS(`Family=inet, Name=MTA-v4, Port=smtp, Addr={{ ipv4 }}')dnl
DAEMON_OPTIONS(`Family=inet6, Name=MTA-v6, Port=smtp, Addr={{ ipv6 }}')dnl
DAEMON_OPTIONS(`Family=inet, Name=MSP-v4, Port=submission, M=Ea, Addr=127.0.0.1')dnl
DAEMON_OPTIONS(`Family=inet6, Name=MSP-v6, Port=submission, M=Ea, Addr=0:0:0:0:0:0:0:1')dnl
DAEMON_OPTIONS(`Family=inet, Name=MSP-v4, Port=submission, M=Ea, Addr={{ ipv4 }}')dnl
DAEMON_OPTIONS(`Family=inet6, Name=MSP-v6, Port=submission, M=Ea, Addr={{ ipv6 }}')dnl
CLIENT_OPTIONS((`Family=inet')
dnl #
dnl # Be somewhat anal in what we allow
define(`confPRIVACY_FLAGS', `needmailhelo,noexpn,novrfy,restrictqrun,restrictexpand,nobodyreturn,authwarnings')dnl
dnl #
dnl # Define connection throttling and window length
define(`confCONNECTION_RATE_THROTTLE', `15')dnl
define(`confCONNECTION_RATE_WINDOW_SIZE',`10m')dnl
dnl #
dnl # Features
dnl #
dnl # Support authentication
TRUST_AUTH_MECH(`DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
define(`confAUTH_MECHANISMS', `DIGEST-MD5 CRAM-MD5 LOGIN PLAIN')dnl
dnl # use /etc/mail/local-host-names
FEATURE(`use_cw_file')dnl
dnl #
dnl # The access db is the basis for most of sendmail's checking
FEATURE(`access_db', , `skip')dnl
FEATURE(`blacklist_recipients')dnl
dnl #
dnl # Enable DNS based blackholes
define(`confBIND_OPTS', `WorkAroundBrokenAAAA')dnl
FEATURE(`dnsbl', `bl.spamcop.net', `"Spam blocked see: http://spamcop.net/bl.shtml?"$&{client_addr}')dnl
dnl #
dnl # Enable Spam Assassin and ClamAV
INPUT_MAIL_FILTER(`spamass',`S=local:/var/run/spamass/spamass.sock, F=, T=C:15m;S:4m;R:4m;E:10m')dnl
INPUT_MAIL_FILTER(`clamav-milter', `S=local:/var/run/clamav/clamav-milter.ctl, F=, T=S:4m;R:4m')dnl
dnl #
dnl # The virtusertable controls where mail gets delivered to for virtual hosts
FEATURE(`virtusertable')dnl
dnl #
dnl # The greet_pause feature stops some automail bots - but check the
dnl # provided access db for details on excluding localhosts...
FEATURE(`greet_pause', `1000')dnl 1 seconds
dnl #
dnl # Delay_checks allows sender<->recipient checking
FEATURE(`delay_checks', `friend', `n')dnl
dnl #
dnl # If we get too many bad recipients, slow things down...
define(`confBAD_RCPT_THROTTLE',`3')dnl
dnl #
dnl # Stop connections that overflow our concurrent and time connection rates
FEATURE(`conncontrol', `nodelay', `terminate')dnl
FEATURE(`ratecontrol', `nodelay', `terminate')dnl
dnl #
dnl # If you're on a dialup link, you should enable this - so sendmail
dnl # will not bring up the link (it will queue mail for later)
dnl define(`confCON_EXPENSIVE',`True')dnl
dnl #
dnl # Masquerading options
dnl #FEATURE(`always_add_domain')dnl
dnl #MASQUERADE_AS(`mail1.fr.nth-dimension.org.uk')dnl
dnl #FEATURE(`allmasquerade')dnl
dnl #FEATURE(`masquerade_envelope')dnl
define(`confDOMAIN_NAME', `{{ hostname }}')dnl
dnl #
dnl # Dialup/LAN connection overrides
dnl #
include(`/etc/mail/m4/dialup.m4')dnl
include(`/etc/mail/m4/provider.m4')dnl
dnl #
dnl # Default Mailer setup
MAILER_DEFINITIONS
MAILER(`local')dnl
MAILER(`smtp')dnl
LOCAL_CONFIG
O ServerSSLOptions=+SSL_OP_NO_SSLv2 +SSL_OP_NO_SSLv3 +SSL_OP_CIPHER_SERVER_PREFERENCE
O ClientSSLOptions=+SSL_OP_NO_SSLv2 +SSL_OP_NO_SSLv3 +SSL_OP_CIPHER_SERVER_PREFERENCE
O CipherList=EDH+CAMELLIA:EDH+aRSA:EECDH+aRSA+AESGCM:EECDH+aRSA+SHA384:EECDH+aRSA+SHA256:EECDH:+CAMELLIA256:+AES256:+CAMELLIA128:+AES128:+SSLv3:!aNULL:!eNULL:!LOW:!3DES:!MD5:!EXP:!PSK:!DSS:!RC4:!SEED:!ECDSA:CAMELLIA256-SHA:AES256-SHA:CAMELLIA128-SHA:AES128-SHA