$TTL 86400	; 1 day
$ORIGIN fuzzled.pl.
fuzzled.pl.				IN	SOA	ns1.fr.nth-dimension.org.uk. hostmaster.nth-dimension.org.uk. (
								40106      ; serial
								43200      ; refresh (12 hours)
								300        ; retry (5 minutes)
								3628800    ; expire (6 weeks)
								86400      ; minimum (1 day)
							)
						NS	ns1.fr.nth-dimension.org.uk.
						NS	ns1.us.nth-dimension.org.uk.
						NS	ns1.in.nth-dimension.org.uk.
						NS	ns1.sg.nth-dimension.org.uk.
						MX	10 mail1.fr.nth-dimension.org.uk.
						MX	20 mail1.us.nth-dimension.org.uk.
						MX	30 mail1.in.nth-dimension.org.uk.
						MX	40 mail1.sg.nth-dimension.org.uk.
						TXT	( "v=spf1 ip4:95.142.163.59/32 ip6:2001:4b98:dc0:47:216:3eff:fea2:7afb/128"
							  "ip4:95.142.171.45/32 ip6:2001:4b98:dc0:47:216:3eff:fe61:a662/128"
							  "ip4:159.203.89.126/32 ip6:2604:a880:800:a1::17:f001/128"
							  "ip4:139.59.9.60/32 ip6:2400:6180:100:d0::3001/128"
							  "ip4:128.199.163.237/32 ip6:2400:6180:0:d0::3a:2001/128 ~all" )
						SPF	( "v=spf1 ip4:95.142.163.59/32 ip6:2001:4b98:dc0:47:216:3eff:fea2:7afb/128"
							  "ip4:95.142.171.45/32 ip6:2001:4b98:dc0:47:216:3eff:fe61:a662/128"
							  "ip4:159.203.89.126/32 ip6:2604:a880:800:a1::17:f001/128"
							  "ip4:139.59.9.60/32 ip6:2400:6180:100:d0::3001/128"
							  "ip4:128.199.163.237/32 ip6:2400:6180:0:d0::3a:2001/128 ~all" )
www						CNAME	www.nth-dimension.org.uk.
