Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795653815;
	b=jdrIe+7IICKzc0UNIyc1v1DaCyiMo0LtYewJiTqjq4NusqgB1wTatbf8D6eB74bbPpq0
	 MNOHlMOZ8aLpVkIau4karuvcGzSB3iXEFSCAf8Fkbc6oF2uUAGt8S3ZMkAmsdsBgCbl3a
	 RTzax8aYQAiFVuCy+GATrRbsM4nH2WjgNh43hmSQGeL0+UYIlII5BfFaZZBfLBzpnuYwR
	 HGnvThcYuoYZmHMAyUhVtI9xPmNnKTN43uwk5MsGAVzIwzOxFhiM2XnmbdKriNMyYgpi8
	 N2i10pHKawIlzLl8hGngKy8kgnimFUhIJZ/A75FNpZCnci41Ythvvxo87HqBwr0DLYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795653815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=f0YG77siU2vWcIe5QSpLLufXofQTb2pqxo09KzKL9BY=;
	b=PazZllVNaMaBj/TCgbe8YoD4jGUyY3YId5sB/Db/TFkem0ibcHUohJPS+b41urqmoFWN
	 sPobuaGbL3RXJCJHV879yePKvDMWpSA+GH66F7mPQxxVGUfEo45+9XqlXc4+Ck4RHfb1m
	 QrR0a54Ox/y9kh4gJCkikl7xgbIVfXs4k3+3Cr/WFo1mFmyFrZuyJiSUAtiChe+h4cQsn
	 xDyOxW2C1MoEXr3LoxNenSWmYy3QJRHbd+X/YoVvvQ2FOB3OvBoEI/SH53qSm7Xe/0xK7
	 kWbw16CPnfIaSjyJMiMR6ZrVmeIeFOBXu5N8xoXYEMKNZBBWfiMjn6weqU3lL3c9ubA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=AJX0H2xK;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D507C606A323
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 00:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D507C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=AJX0H2xK
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b589050416so887058c88.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795653813; x=1796258613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0YG77siU2vWcIe5QSpLLufXofQTb2pqxo09KzKL9BY=;
        b=AJX0H2xKw2HD10HeffuBReUxknMxMaApxXrWU8K+Gv+4Swe/xp5a1r0zuwwlThGzAV
         /a02o+HJAMsn8ljTrwXQ+OWhvtwl7PCpnwNFbgxVCJsp1tbc+cGSWp7BuqAFZR8PVarE
         uzGHawhPY6An1YuW/VxqM0QbLouPPitoFVpM5oQ7yb4YDyc5GT9VvT+Zl8Luej6GYqzx
         f1irVFW6x9qvqgvDMP06gQGg/4zIrE1LKwtCIoU2smndwlaxE6LpqauShxMyS6CMkJkv
         UC8I92JuU47hCKG01R97uxOR8RLCpkd3aEIVJcl9BdrYfsfSLxruI/Gi2BQswFks2rcS
         Nq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795653813; x=1796258613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0YG77siU2vWcIe5QSpLLufXofQTb2pqxo09KzKL9BY=;
        b=jWSBNe648vvcSlbdSdun1/khDPYiJ5o6Cxh0uFH034dzu7UrL3Oen3yqQ+QjFtBobx
         4p9A76/UUC1mNaJt29F7Om11VpZx/pxnykdbFK/49Dls8CTRtVWsjIYwMWzwW62gkxAQ
         0YsJT5BYqENcAYBV/ixBguQ5oZa3sWVVRaocQOSRBXUMh/iXd9F8VFTqnNV8toCwjisY
         Hv8u+GI4j6IMYnz1LkMfZLTGECf2MAV3Vi0MmeKiyuuy8rD5WHr7o9jRyRJla9vX3tmf
         ZVVLCp5OcWMyt6F53+Ku/aKaVbHeTjkuGcg9ALL9/cVhblQfZemJLddU15QLWcY3slcP
         NcyQ==
X-Gm-Message-State: APuU4Z/vE4z9U8dx9/aQHoB2Mcgu0IIQYIiU4ir8x0N4E8lU7gPkNzk7
	uy6gWcRjQcyP4VK6SPxQmK5ihTtsjQCrmV/YtEaq8gXYKrzXZngnsXKXLhZVvxv9XyC01wm3VdK
	EiaxmB3g=
X-Gm-Gg: AZFdTZdbWEDO1j8ROXf3odAZ7Vwv+5AvHUPdx5M01L0IXpXUjtqRNY+MU55P6flW3gZ
	EVZL6YbI8+wCxEHHiwSZxw/Cf6Z8LNB3oUAMlS/uC9bTflbQ4elBkLLpXuVMtOBXXjT08FoSq1O
	Pz/kdktT7QIW/Miwnn/SnPMF9mHdmLzM3bf7Ay3kWh51BpKOIkb2Yj5nPrCBIvvuGDkKoPmJH1t
	ymVD69IMCy0mYM3DKQpdiwL4WUq07QYjQhhpGWhu8KJ5wLyWvwLFh33ZELs/jBEHmofaEO3UrpM
	LMkiCd+o8nbR3kxBfl/ozGZNVDQN0DhEyG9VprHijoFNMEINqokLq/xy0QmyNNEGLNyLpKxlVpH
	92o7KlOigiNMrgoND4doLEDcKXBAiGWxdvbo09JeHam+y3FWdDqQqsH8jvsU1qLJX/7Lc3xJPWI
	ZotNVKF3QHn5SOf2ewokF6LqR72so5Tk6QwQ3btPPc9VftE9I3hm/uoaaNJaVevnt+dCHZVGasj
	l76XeTGGVTLw6SS4Q122O4zPyZDveCWYORDAVUPKGG9vw7n1CMWcz14O+OxGmTKRw2g0SIwmT3A
	n1Rf70oWOs4GRls0FO9mBRC63+vrzONzzyv8G6QkaOUCex+Z/xlYHs2zvG64+bGPHmm4CzW1FNr
	xS4Vser4NnDJdhIRBH+yRdENHHeo2wtZn7jRlXBenAYXN6MDqDWc=
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr21101289c88.10.1795653813302;
        Wed, 25 Nov 2026 16:43:33 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm53222947c88.7.2026.11.25.16.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:43:32 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev@vger.kernel.org
Cc: David Ahern <dsahern@kernel.org>,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2-next v2] iplink: amt: support an IPv6 outer transport
Date: Thu, 26 Nov 2026 00:43:29 +0000
Message-ID: <20261126004258.2133805-iproute2-omar@blockcast.net>
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
v2: print each IPv6 address with print_color_string() and
format_host_r(), and the keyword outside the color, as ip6tunnel.c
does (Stephen Hemminger).
v1: https://lore.kernel.org/netdev/20261125170100.3054010-iproute2-omar@blockcast.net/

 ip/iplink_amt.c       | 39 +++++++++++++++++++++++++++++++++++++--
 man/man8/ip-link.8.in |  6 +++++-
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/ip/iplink_amt.c b/ip/iplink_amt.c
index 3a35bd9..2370bc5 100644
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
@@ -134,6 +140,8 @@ static int amt_parse_opt(struct link_util *lu, int argc, char **argv,
 
 static void amt_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
 {
+	SPRINT_BUF(b1);
+
 	if (!tb)
 		return;
 
@@ -156,6 +164,15 @@ static void amt_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
 			     format_host(AF_INET, 4, &addr));
 	}
 
+	if (tb[IFLA_AMT_LOCAL_IP6]) {
+		const void *addr = RTA_DATA(tb[IFLA_AMT_LOCAL_IP6]);
+
+		print_string(PRINT_FP, NULL, "%s", "local ");
+		print_color_string(PRINT_ANY, COLOR_INET6, "local", "%s ",
+				   format_host_r(AF_INET6, 16, addr,
+						 b1, sizeof(b1)));
+	}
+
 	if (tb[IFLA_AMT_REMOTE_IP]) {
 		__be32 addr = rta_getattr_u32(tb[IFLA_AMT_REMOTE_IP]);
 
@@ -163,6 +180,15 @@ static void amt_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
 			     format_host(AF_INET, 4, &addr));
 	}
 
+	if (tb[IFLA_AMT_REMOTE_IP6]) {
+		const void *addr = RTA_DATA(tb[IFLA_AMT_REMOTE_IP6]);
+
+		print_string(PRINT_FP, NULL, "%s", "remote ");
+		print_color_string(PRINT_ANY, COLOR_INET6, "remote", "%s ",
+				   format_host_r(AF_INET6, 16, addr,
+						 b1, sizeof(b1)));
+	}
+
 	if (tb[IFLA_AMT_DISCOVERY_IP]) {
 		__be32 addr = rta_getattr_u32(tb[IFLA_AMT_DISCOVERY_IP]);
 
@@ -170,6 +196,15 @@ static void amt_print_opt(struct link_util *lu, FILE *f, struct rtattr *tb[])
 			     format_host(AF_INET, 4, &addr));
 	}
 
+	if (tb[IFLA_AMT_DISCOVERY_IP6]) {
+		const void *addr = RTA_DATA(tb[IFLA_AMT_DISCOVERY_IP6]);
+
+		print_string(PRINT_FP, NULL, "%s", "discovery ");
+		print_color_string(PRINT_ANY, COLOR_INET6, "discovery", "%s ",
+				   format_host_r(AF_INET6, 16, addr,
+						 b1, sizeof(b1)));
+	}
+
 	if (tb[IFLA_AMT_LINK]) {
 		unsigned int link = rta_getattr_u32(tb[IFLA_AMT_LINK]);
 
diff --git a/man/man8/ip-link.8.in b/man/man8/ip-link.8.in
index 8fd900e..48d2ca9 100644
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
