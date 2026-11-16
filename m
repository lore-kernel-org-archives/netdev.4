Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853035;
	b=WEXAxRWSyyj+GiUaI1zZkebE0abbLSYty+V+vJ91H39yp7+DJKQXulAeAHSEqqLUHKTe
	 4sgMDWmXiDNZz4mKDpnqL5otNEq5+cANuJHJiyEyiXXNIGARTYjH3JHedl3vUAB6ZiPwe
	 sM9FHFxivb/hikCOexjwA6bQDaWVzTKwsJANzGA3Ek/D497ylthBkNYCRzcAVwFQRy/m3
	 dJDxBtZ0a5ZstMs59GBXcNt99SYtZNTGLwbVI3n7ExogIKDUUxqNHfgJYT5Id7zDtNtJK
	 F8/V6z3mIgkTxi2b9GEHy6pf4BnZyBHkzV4rNJUp0kOXEsvcXJ5oyEOInRDpGADGv2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Rxhs5GXRYeCPMpfYYEZmQBMWMmS9gihsW3GpbZ4BDkU=;
	b=4Didsnv6vheXpJr+GUJoqOd5uK0RNhEHcJjrHlFl8xApLrGgL4pvtlH1KBqhl260nx8P
	 UFQXUnj/qxxXhJluNs73B6T8hY4E2NjOop+kPVYxdEDM1qoRRiUEshOp862qi2bqXedie
	 A1iQuikfz4L0Hj3V8zZJ/touSRqDcaXZ0RuMmTQNW7mC3UGYaewwEh6QBiWa5sdXXEUCR
	 LQaeCgtV8LdvTvut2rXtEB67nMOngQYZJSe2m25lHQTQ0OnzpnuGpxlDOw9eAKYRWQyB6
	 /Ydh6j3nxRPLrVuN0uxPdc/h+EMkW5R39YfaA2+gZm7aflBauzLSvxFOFRAABQcWHSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RR7a9+Gg;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CC8606A331
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9CC8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RR7a9+Gg
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2efd824d492so1238745ad.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 10:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1794853034; x=1795457834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rxhs5GXRYeCPMpfYYEZmQBMWMmS9gihsW3GpbZ4BDkU=;
        b=RR7a9+Gg7Ff0rDNiM7j3tsu8NkVl4xYquqH2EETbv1oreTAHQn4HC0nTPFHemLiwa8
         dLaVS9oyK0UGlmQJThxszHdjIpBIfICg3z3WGB8gJIYiRs2NhPDy+7MH3asVZBg1OMnC
         7itudUXmKPNdVK+0Dg6K3dQckwbXc6EozMSPIXCzkocNNYFkj87M25RdEDVdG0Juv49q
         /Ly/j8tlzNDBZFxIlOqtiYbKrWgHHR4qSpYJju62ekSwjNrbrwsCdQyPhm3pGR38GZMg
         l1D17A5M5L4K8yLQO5CKTurcyA3dIVx8QVb2aoc5FolfwU/ypF5YwTpuBH7vxSb/lw2I
         cGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853034; x=1795457834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rxhs5GXRYeCPMpfYYEZmQBMWMmS9gihsW3GpbZ4BDkU=;
        b=jhZmCXVGY0kGQgfW/yCD4ffnsUQ/3FbYhvsiXpO1G8Z4mdY6ViRR8SNQYY0k19v95j
         iDOZmsZJ3kzPOGKKzRQLtgS/MxEHTNyCjmSl61WT0xRo6WfgESPodvlzUkYE7bDhfvyy
         RXgpSY5B4Z/p+K4yalQpt9Os2T9FaIvbgdsumZnqK/YKlpC8wcqVm1KcgI5jsYjxKwwQ
         mRgki8evKNazGDS5DVO8I80kz7KZAalCCCRd7jwSNQLiweyI9GXflZ9jXRbIwb2nJRF+
         hYn3bCtweGte9khGdLrMf0+a0AFlJsFIiShZW3Qn2kc9S/tqpyPFcdyr5Wo/MUv0873m
         ULzA==
X-Gm-Message-State: APuU4Z/fwSZ4BlY1MNtVjBQt67i08RLUTfqzUi3t+3dSWYiqNtn747/M
	LKNlMhuQLj0YyM37OYBRZ+NQfcfJhzNlNk6ohNxl/4gJ8O9S7fDEWANP4elgqYMkiiFZRe+QU2i
	eapfCXaY=
X-Gm-Gg: AZFdTZd1yiEc83qgGkvY3NGx/xZNqyEbfcnQxU0dQtdsiW6WjDqqfMYz42+dPVCcphh
	x4z3VthQDkIAKO77uhFaWG8CInMv97RJYEu/55ZSdlO91gvAber9XF7zrMtlHsxZ16xi5rZdEd8
	qVgxqW3YcVJtjJCxON11hz7JNDcc34DeTaPO+A+xUmvg8Z1DUXdwHgj82XKlBw64SvUnKNOIB7J
	0j4dyswC+mA7VNXC6co6pc6rqGQ6vhzXCeqKdUXP+lOf70xKiRqfDU/G4Dllix8Ys9s+QgGMpdz
	da/OmVVb2msAJN76v3pC1xd44sveNoWBCKwHczNQElBBlACql1v3I/+G4UXgRnkEqSnboBIMJtg
	/tLUKQRLz9j3sP0KITHp3z3thAw38uhN2WWXev561zut1Gc+x1MGRlQyVOVwKoDqICBdJJqsMCp
	8Cx/iGBEhskiJEHkdaEaMBReSC9GsCnlUm+e3SZElDXEyFvD+LSPR/c56mKr+52LJi+1g740Bth
	nflA1FVI1AcCbDBOi0Qyz455aHI6VHtFAjSgXzC2X1Jb2xylzH4AY8l9Yxs2pKjheMFEjb88356
	MO90xZ3REKJaGylOHxuJfR6PqEUC0KI6PLCu/Wi7QXNUQ6cGv/vnQULdiCMFhpew7BqE6AQ=
X-Received: by 2002:a17:902:e54b:b0:2e9:3395:cca8 with SMTP id d9443c01a7336-2ee0dc779b4mr104497045ad.46.1794853033719;
        Mon, 16 Nov 2026 10:17:13 -0800 (PST)
Received: from phoenix.lan (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a85e0fsm2775525ad.56.2026.11.16.10.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:17:13 -0800 (PST)
From: Stephen Hemminger <stephen@networkplumber.org>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH iproute2] ip address: don't emit empty JSON objects for filtered addresses
Date: Mon, 16 Nov 2026 10:17:11 -0800
Message-ID: <20261116181711.292634-1-stephen@networkplumber.org>
X-Mailer: git-send-email 2.53.0
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

print_selected_addrinfo() opens a JSON object before print_addrinfo()
decides whether the address passes the filter, so every rejected
address leaves an empty object in the addr_info array:

    # ip -j address show proto kernel_lo
    [{...,"addr_info":[{},{"family":"inet6","local":"::1",...}]}]

print_addrinfo() cannot report the rejection to its caller; it is also
the rtnl_dump_filter() callback, where a non-zero return aborts the
dump.

Move the per-address filter predicates into ipaddr_filtered() and
check them before opening the object.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 ip/ipaddress.c | 68 +++++++++++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/ip/ipaddress.c b/ip/ipaddress.c
index 4a4a87d9..fb9c05ee 100644
--- a/ip/ipaddress.c
+++ b/ip/ipaddress.c
@@ -1497,6 +1497,41 @@ static int ifa_label_match_rta(int ifindex, const struct rtattr *rta)
 	return fnmatch(filter.label, label, 0);
 }
 
+/* Aliases IFA_LOCAL and IFA_ADDRESS in the caller's table. */
+static bool ipaddr_filtered(const struct ifaddrmsg *ifa, struct rtattr **rta_tb,
+			    unsigned int ifa_flags)
+{
+	if (!rta_tb[IFA_LOCAL])
+		rta_tb[IFA_LOCAL] = rta_tb[IFA_ADDRESS];
+	if (!rta_tb[IFA_ADDRESS])
+		rta_tb[IFA_ADDRESS] = rta_tb[IFA_LOCAL];
+
+	if (filter.ifindex && filter.ifindex != ifa->ifa_index)
+		return true;
+	if ((filter.scope^ifa->ifa_scope)&filter.scopemask)
+		return true;
+	if ((filter.flags ^ ifa_flags) & filter.flagmask)
+		return true;
+
+	if (filter.family && filter.family != ifa->ifa_family)
+		return true;
+	if (filter.have_proto) {
+		__u8 proto = rta_tb[IFA_PROTO] ?
+			rta_getattr_u8(rta_tb[IFA_PROTO]) : IFAPROT_UNSPEC;
+
+		if (filter.proto != proto)
+			return true;
+	}
+
+	if (ifa_label_match_rta(ifa->ifa_index, rta_tb[IFA_LABEL]))
+		return true;
+
+	if (inet_addr_match_rta(&filter.pfx, rta_tb[IFA_LOCAL]))
+		return true;
+
+	return false;
+}
+
 int print_addrinfo(struct nlmsghdr *n, void *arg)
 {
 	FILE *fp = arg;
@@ -1528,32 +1563,7 @@ int print_addrinfo(struct nlmsghdr *n, void *arg)
 
 	ifa_flags = get_ifa_flags(ifa, rta_tb[IFA_FLAGS]);
 
-	if (!rta_tb[IFA_LOCAL])
-		rta_tb[IFA_LOCAL] = rta_tb[IFA_ADDRESS];
-	if (!rta_tb[IFA_ADDRESS])
-		rta_tb[IFA_ADDRESS] = rta_tb[IFA_LOCAL];
-
-	if (filter.ifindex && filter.ifindex != ifa->ifa_index)
-		return 0;
-	if ((filter.scope^ifa->ifa_scope)&filter.scopemask)
-		return 0;
-	if ((filter.flags ^ ifa_flags) & filter.flagmask)
-		return 0;
-
-	if (filter.family && filter.family != ifa->ifa_family)
-		return 0;
-	if (filter.have_proto) {
-		__u8 proto = rta_tb[IFA_PROTO] ?
-			rta_getattr_u8(rta_tb[IFA_PROTO]) : IFAPROT_UNSPEC;
-
-		if (filter.proto != proto)
-			return 0;
-	}
-
-	if (ifa_label_match_rta(ifa->ifa_index, rta_tb[IFA_LABEL]))
-		return 0;
-
-	if (inet_addr_match_rta(&filter.pfx, rta_tb[IFA_LOCAL]))
+	if (ipaddr_filtered(ifa, rta_tb, ifa_flags))
 		return 0;
 
 	if (filter.flushb) {
@@ -1731,6 +1741,7 @@ static int print_selected_addrinfo(struct ifinfomsg *ifi,
 	for ( ; ainfo ;  ainfo = ainfo->next) {
 		struct nlmsghdr *n = &ainfo->h;
 		struct ifaddrmsg *ifa = NLMSG_DATA(n);
+		struct rtattr *rta_tb[IFA_MAX+1];
 
 		if (n->nlmsg_type != RTM_NEWADDR)
 			continue;
@@ -1748,6 +1759,11 @@ static int print_selected_addrinfo(struct ifinfomsg *ifi,
 		if (filter.down && ifi->ifi_flags&IFF_UP)
 			continue;
 
+		parse_rtattr(rta_tb, IFA_MAX, IFA_RTA(ifa), IFA_PAYLOAD(n));
+		if (ipaddr_filtered(ifa, rta_tb,
+				    get_ifa_flags(ifa, rta_tb[IFA_FLAGS])))
+			continue;
+
 		open_json_object(NULL);
 		print_addrinfo(n, fp);
 		close_json_object();
-- 
2.53.0

