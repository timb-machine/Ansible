$TTL 43200      ; 12 hours
$ORIGIN fuzzled.pl.
fuzzled.pl.				IN	SOA	ns1.fr.nth-dimension.org.uk. hostmaster.nth-dimension.org.uk. (
								40109      ; serial
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
default._domainkey				TXT	( "v=DKIM1; h=sha256; k=rsa; "
							  "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsqTJKKVglGd/YLLkgsZsoirNwJRs54R8d+WjkjKtxPmBEgiYINfUTPIEHUt08vIt06I5DAKJwB3ixoEQOxG07zzoW267ZI5E/Dn6yT9y1S4v2EenucDjRJBH9hJaaQ3NF/JhQOK0vSvkelcKNwSL7dTeNCIKSsdi6A935PqUa+6y0tgl92CMJunei4Bw1iuzG836M+MnvFPJVG"
							  "ysHAa08BVQbzZ9j0sOaWxemU+XxBuVE6nLfKmjrrjIJhRx1G6GCG/KuhfyDn2lCCy1VPR0cbZM6Q96iHtS3SGVRIORK9QPFRU12/GyGq2JX9M9HmWzuNnmAgmoWRQEQ9Ibai0BSwIDAQAB" )
						TYPE257	\# 22 000569737375656C657473656E63727970742E6F7267
						TYPE257	\# 12 0009697373756577696C643B
www						CNAME	www.nth-dimension.org.uk.
