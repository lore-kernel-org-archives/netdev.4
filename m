Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634091;
	b=V5gvsU01xsRoJ8CDZDftGEM5su58S6qTWAwZ58hZojJzqlHOM8qK2neNiTqPEQzGlL/Q
	 OUpUeIBz49wyFAtX/kc3p88215M2EurjkPPf+V23Gux8ADbm9r69mlI3qxZUL+7ddtvE1
	 lHO7cd8dSRJU8IiU9SYQeIwX1aH4tOGwgEyoIRK2JSwORgWk6OBL3s18xUXd3wTlhM/zE
	 Pw91g2tNMvO1nT4NtCsqq3Q9G2qqQzNCEl0y0eQlRu/zSPNpX/ZlfToy6K4HF4i/9wTwT
	 xRxRPYg3A4pULnzKtRbNO8WkXWaL8ybuu7w41zdIxj1882OXEzTWlEOJPT04DHcE8aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=D8HXfWafSRT1n5y3APgGJnPwd11wZ0Y5AGGC/6XIjbI=;
	b=G14ZpqWmx/qg4L4p1wxnFRiuIjY5zjlI/57TAq9tqCHkiJOSloEcLYWP4+ZcZkidAhmj
	 XertJerZoFnA+zR53aHgkNqmWhQq19Odsxe4cZTrYn2KbMxXFFu4jOWB9q0SCp4k/zlWK
	 3c8m1+9Y7X9q55KAhYR/ZwZH/D5vJYUtCGdUcDZdvY/CeO2zAPTFUZEaC3pOEB34zoQ2t
	 tH4e5tD65BJArZJBq/RV39QoctkWwMqCdOW4sJMmDY/iPYvk7EOXLhXH8j84qTdFHRZ0Q
	 Akawz+Nd3Hqj7dwmhvCdCv/qQ3sr4H+6IafRX2q4eGi2QdrAf6xarn6aly4QnjVBYdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=lMo9y83d;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83178606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83178606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=lMo9y83d
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f020d0169eso31153905ad.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634090; x=1796238890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8HXfWafSRT1n5y3APgGJnPwd11wZ0Y5AGGC/6XIjbI=;
        b=lMo9y83djW0oLF8fZYuvTJvVNpaAsvua5EMoD4DbETSUZY7a7bMF57WAsmsb07nA5r
         Udl1r2m8cwKmMG2RViYqiWzFINp39DTh7UwqRjVJh5Hi5VEkzgW0GROQstdx1gHsrz5/
         ydPGx/q1MNkGbX/HXGiq9oZEvxhjjoY8/Zp8RV9RwADaa1BFQfi+LqnYTJTWxb+PJz2M
         /OHIogUjrs1jDZAVoaZysg0KJ5INybSvGKSx04cETPeXiHg0y+f+vAPp3JymAsMR53u/
         919bhrqN1SEAvawILSd2u8FYz+jKUTv9TJXzuOW6FWvpiI8w/YBssN9GEnxqhfHFrpvU
         IngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634090; x=1796238890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8HXfWafSRT1n5y3APgGJnPwd11wZ0Y5AGGC/6XIjbI=;
        b=HIYuljXGGjVUt5/vPdcCdc5cGlKbz2xkWAH1K+pP5LgFacHgMKbeL9pcDDwwRcqWLC
         aUotc01sMFpz+bOL9Q5UAmQn8MOvaW6ctmRU+R8gSbQZDb3nesLYO2X13FI4MvtctN8x
         4xcoOk15LZ7yNKZ2Hijm8pePCegT8v1eiUlzytBAXeMlYxOjdNbojU26c0fPwfnQczjN
         pFUHwWwTpHE+mhaI5LJltqqIPl+LMdKIbWSOKNvgcx5LpbsJjXdcyYAPtDg/ltG3NAJ8
         9pmaH8A4QQpp4fGlsEJJe9D0x0X7API1uE0yFL4Y3xm2SFBtR94VV7+F9FQm4GhSGijn
         I7HA==
X-Gm-Message-State: APuU4Z9fFHFj+fdVwX8g+lympVx8S/zxi3MD2q0GaCMNmDMyCVRSF4w6
	OU8bH/KuEZR4pZQq9FlplY+BAr57E8qAq5v7O4JIeYmVAvPbg0Uf099lnv3c+aVfUa/0zxhDCyO
	psZCw1+o=
X-Gm-Gg: AZFdTZcNej6NQVmFaiDgmxkIHAVWt31nXCa2B5BdwGRUii6vApzJnXQ5IHRawZBtknX
	V1rQO3UiqNWLruUMKD2XilWPoPINekDdwY5FmPIx9lTLZ83NU39HV5Z94l0/GJ9TaV6HB4vaaVe
	IzRYHNopMolBzR9/tcEI8Hw6g6Vsxzrr1DrpVDp5b/uxMUHu7AnIMFonHOH3MM3kE1n3HZ3z4wA
	cofzeJySUpcWsLh9Vp0TDWdWkcVYshIQy4/hclBMksJBQq19i7+/LhqlvR33ofIJjw7swNqp7dT
	rxQyvOB2sHaIt1mi8BdfbApt4A4zgBOscj4V0AZRIbPIc+xvnsq5uzJ2UZze4hdUq0esfBurn0X
	9NltqKtIQ/tB/LSBDRa4MkwdwZCtqBeE/ZNkgxMtjZs/EpRZ9bICBlljrn8Ey0XtINqgcFQngz5
	bdqQbhPjjMkwdRVXXEzBRMwF1weLx/l2tBb9V6ZXRhgF2et+z/6tQBUZHuWTO/ces4s6UYhIDbj
	Lap1yV8XXLFl0OK4W7jZF/4OwjBM2NJO1WZlRylVuJCc/fWDCt5ydwavJhMcRIUeQY/ILDXNQx6
	CugiYHN92n7yQRU3Ol9YC9GVEGmb1gupK75CWIOtiJNZrJCHRnZe1PMrEy3+6rdTIQDJthfKwEp
	BIeHTUjvZ+66o+WOA2n8U0u7aex7QSlQ7OjjZUPUnL5j3PN1I3eE=
X-Received: by 2002:a17:903:b4b:b0:2e9:a090:dd69 with SMTP id d9443c01a7336-2f03f1c0a06mr190199755ad.39.1795634089630;
        Wed, 25 Nov 2026 11:14:49 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0d537a522sm20061755ad.47.2026.11.25.11.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:14:49 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next] iplink: amt: support an IPv6 outer transport
Date: Wed, 25 Nov 2026 19:14:47 +0000
Message-ID: <20261125170100.3054010-iproute2-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amt driver can now run AMT over IPv6 (net-next, "amt: add netlink
attributes for an IPv6 outer transport"). IFLA_AMT_LOCAL_IP6 selects
IPv6 as the outer transport, IFLA_AMT_DISCOVERY_IP6 is the IPv6 address
a gateway discovers its relay through, and IFLA_AMT_REMOTE_IP6 reports
the relay address the gateway learned.

Put an IPv6 local or discovery address in the new attributes, and print
all three under the same keys as their IPv4 counterparts; a device has
one family, so only one of each pair is present. Until now an IPv6
literal was put in the 4-byte IPv4 attribute: older kernels quietly
used its first four bytes as an IPv4 address, and kernels whose policy
sets the attribute's exact length reject it.

  ip link add amtg type amt mode gateway local 2001:db8:a::1 \
          discovery 2001:db8:a::2 dev eth0

This needs include/uapi/linux/amt.h synced with the kernel change.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 ip/iplink_amt.c       | 31 +++++++++++++++++++++++++++++--
 man/man8/ip-link.8.in |  6 +++++-
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/ip/iplink_amt.c b/ip/iplink_amt.c
index 3a35bd9..22e935d 100644
--- a/ip/iplink_amt.c
+++ b/ip/iplink_amt.c
@@ -107,7 +107,10 @@ static int amt_parse_opt(struct link_util *lu, int argc, char **argv,
 			check_duparg(&attrs, IFLA_AMT_LOCAL_IP, "local", *argv);
 			get_addr(&saddr, *argv, daddr.family);
 
-			if (is_addrtype_inet(&saddr))
+			if (saddr.family == AF_INET6)
+				addattr_l(n, 1024, IFLA_AMT_LOCAL_IP6,
+					  saddr.data, saddr.bytelen);
+			else if (is_addrtype_inet(&saddr))
 				addattr_l(n, 1024, IFLA_AMT_LOCAL_IP,
 					  saddr.data, saddr.bytelen);
 		} else if (strcmp(*argv, "discovery") == 0) {
@@ -115,7 +118,10 @@ static int amt_parse_opt(struct link_util *lu, int argc, char **argv,
 			check_duparg(&attrs, IFLA_AMT_DISCOVERY_IP,
 				     "discovery", *argv);
 			get_addr(&daddr, *argv, daddr.family);
-			if (is_addrtype_inet(&daddr))
+			if (daddr.family == AF_INET6)
+				addattr_l(n, 1024, IFLA_AMT_DISCOVERY_IP6,
+					  daddr.data, daddr.bytelen);
+			else if (is_addrtype_inet(&daddr))
 				addattr_l(n, 1024, IFLA_AMT_DISCOVERY_IP,
 					  daddr.data, daddr.bytelen);
 		} else if (strcmp(*argv, "help") == 0) {
@@ -156,6 +162,13 @@ static void amt_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
 			     format_host(AF_INET, 4, &addr));
 	}
 
+	if (tb[IFLA_AMT_LOCAL_IP6]) {
+		const void *addr = RTA_DATA(tb[IFLA_AMT_LOCAL_IP6]);
+
+		print_string(PRINT_ANY, "local", "local %s ",
+			     format_host(AF_INET6, 16, addr));
+	}
+
 	if (tb[IFLA_AMT_REMOTE_IP]) {
 		__be32 addr = rta_getattr_u32(tb[IFLA_AMT_REMOTE_IP]);
 
@@ -163,6 +176,13 @@ static void amt_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
 			     format_host(AF_INET, 4, &addr));
 	}
 
+	if (tb[IFLA_AMT_REMOTE_IP6]) {
+		const void *addr = RTA_DATA(tb[IFLA_AMT_REMOTE_IP6]);
+
+		print_string(PRINT_ANY, "remote", "remote %s ",
+			     format_host(AF_INET6, 16, addr));
+	}
+
 	if (tb[IFLA_AMT_DISCOVERY_IP]) {
 		__be32 addr = rta_getattr_u32(tb[IFLA_AMT_DISCOVERY_IP]);
 
@@ -170,6 +190,13 @@ static void amt_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
 			     format_host(AF_INET, 4, &addr));
 	}
 
+	if (tb[IFLA_AMT_DISCOVERY_IP6]) {
+		const void *addr = RTA_DATA(tb[IFLA_AMT_DISCOVERY_IP6]);
+
+		print_string(PRINT_ANY, "discovery", "discovery %s ",
+			     format_host(AF_INET6, 16, addr));
+	}
+
 	if (tb[IFLA_AMT_LINK]) {
 		unsigned int link = rta_getattr_u32(tb[IFLA_AMT_LINK]);
 
diff --git a/man/man8/ip-link.8.in b/man/man8/ip-link.8.in
index 719781b..c9cf0b3 100644
--- a/man/man8/ip-link.8.in
+++ b/man/man8/ip-link.8.in
@@ -1616,12 +1616,16 @@ the following additional arguments are supported:
 .sp
 .BI discovery " IPADDR"
 - specifies the unicast discovery IP address to use to find remote IP address.
+It must be of the same family as the
+.B local
+address.
 
 .BR mode " { " gateway " | " relay " } "
 - specifies the role of AMT, Gateway or Relay
 
 .BI local " IPADDR "
-- specifies the source IP address to use in outgoing packets.
+- specifies the source IP address to use in outgoing packets. An IPv6
+address makes the device use IPv6 as the outer transport of the tunnel.
 
 .BI dev " PHYS_DEV "
 - specifies the underlying physical interface from which transform traffic
-- 
2.50.1 (Apple Git-155)

