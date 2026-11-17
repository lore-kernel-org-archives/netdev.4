Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794893141;
	b=XUTzRekV0PTYnIuc2rBtknK0pDFes4ACWwZ9dZzu8NdKO5iTajPCIZT6qa3DEv57nq/h
	 eqa6qXn3w9HoV7OpJBX3MjW4ZsApgu8V/AAnxSqtp1Ys5ZRWf6dXGbijRMKcS6z/ynFk7
	 zMZYbLvCdtyLtqfMliJoVp3UKYhVYaVPPv5qF9AP441fEdaA7oZSKJciKtm/oTkwyAT+a
	 1SbYFEJjPQJRcf1MT1j39fSABUD0cmVP926dilAWvwcsbmUVgQpsAbTkWoXt3D22XZP8B
	 3GsYZuE8SjYK2j0ciZhc58GYVs+9MhTtskxgZSqplUi67S0YxPdL79Iu1B5umEmDyXg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:
	 In-Reply-To:References:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=TxdG7efByMlrSfYF08otUNOLNNKs1+kzoPRt7KTgHHc=;
	b=uiozROCejMKlrqTGFefKX0NRdR2TSTsUIZz9TMRAiAUQyCal3G6N62mSKkUo29FTSJfu
	 GX8Ppod3C5vf0jGLa/SrTyg8p+O9aBl2DU4Koi5QJ89JLcRDHCsTnE489X6eeEZdVCIwC
	 oU8c9I5N7pxWJUqBPeBvKfb9/qY31XAPl24HsSG+t3VwUxPFsM2EiDQoGZFePI/o6v1Dt
	 PABb/Jwnn9PrwImYvw2MTyXf8qbeU0uoAAjQbdTofwPQpsfnUoJg9g05UUKI9XnEzrJ1D
	 IjBdCEVk/IZ9nWlPB+CCOZzRqa46/7AzJHJbuQIDd7rDLln4v5f6hia1iKdUdmaAYsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQDbDxwd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB43606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:25:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB43606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wQDbDxwd
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b71b012e3cso4946290a12.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 21:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794893138; cv=none;
        d=google.com; s=arc-20260327;
        b=Qa2BgoLHQVcgvazModJSqgGUcZ/J0l6yfeuhsG8vlLqkIyadviWM8teiGuwDE/SULb
         feoEjroxAJGI2+rjnWI+S2Rbkx3UT5iAkkUYfOeGG49Ykl4hIYwgPFJMqQyCSl4wM2FA
         nsOmMRUxRHBbwqA4gEDUiSTtQNgp3LjFz+G2e02h29HhrIH7u+SQjE6QlPxXR0tiHuPJ
         doxvT5JVrRmb+AxB4KYuh19+ts15utlUDPmzJJxYyK+4F1gEdrqjTLs4mVVEmQwvD5Pm
         Qn1mQ4TeQKhDTJBghLKhBZpTSnQxWSHtkbJxXqh1dfsOZrR9h7lXrAv1Jqrx85nE7AwF
         lu2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=TxdG7efByMlrSfYF08otUNOLNNKs1+kzoPRt7KTgHHc=;
        fh=QfNzxoV9m+7xRk/IxK2MRELiBSpiXn/CtGOrK/o4K7M=;
        b=EC1u1g6E83z2n/CAtEx27nn8HWsx+rQLdk3OOrBSIgn5tQ7NxwgB8DnFfYhxM4GPnS
         GLEZQE8NWvWyKhHP5X8riOIAIkLXdI9J5ds7NLyvtjwczIk/yF6Tt0njGaC1BmQOo+h9
         IZOKGw6JeS8gWuV1Pyh+bns2ctSrjtEj5YafdNIqSDsLVeddAJSAnAo+0fmXKWqnK9KY
         6r31VrzmhzlODtxwgLwtkTcDf8BK0gJUBRwh/Z3CylZ5FTwVNTosMxlWvwPV68rZCeJi
         4gsXY+tURAyj2F9THj5i2EOczSYPxmP65oI1uhDAg3jwWO9qXmyxYK+uIWjJLgAjamxW
         sbKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794893138; x=1795497938; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxdG7efByMlrSfYF08otUNOLNNKs1+kzoPRt7KTgHHc=;
        b=wQDbDxwd99CgY+GLEi93JzMXUiKWQFTbvsYzfn3rnqgNrPlgCv2xSFvI18jCuwdrqx
         uzzNmrvOP2izhTdJ9wSQoPLAzeGQY1UXBZUnZD06bCvsPStVLcmUkWVpZm+RG6X7u3Wg
         w/s1hEDsRj+cjE1Kr51UGhdgeHErha/vjLRCtPOdRioJQw7T/3ihs1HSU1Y41oNXbRPV
         Mg/SprKY414xMvnjDulIG50BqZhvxg+69Slu5PNOso3koEbtXPKSAoWG4TzZ1YrXOhuL
         sYybNZZb262myraR/iTdwJVGXPyAOrWw8VVITFB+T+sZ2NwkP9lGr6urr1hpg0cXX22A
         WKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794893138; x=1795497938;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TxdG7efByMlrSfYF08otUNOLNNKs1+kzoPRt7KTgHHc=;
        b=UTASWdyyIPsRC6JU6VucIuPpSkWcbktkm5Hjqvs6ANEWxm99lPcQRGtWdfdIhky5hQ
         /QDun9yOAtcqtRu4btuBSHncHUcgvtE9boL2fEE4FKI+tC7YdiL0cGSAbNYvPwAtiWti
         Mc/ZOAZn9T0dNyuqIFIjwCbQ3tuBfyaGDD3gHpJf9IZf7LjWoXDtWaNkHRmAr0OXw8sy
         zJSXfwIdDoVLA71uWMWOET5wrkmviHxYCMRXJSGjlfOvO2z0Yp38c9IRmVzcptWirPW6
         hHOrVnxBh5TEeJkha/JJxVgpCkywgaaI36UyN82as9E7dHq6sOo2dj5+GIaX++rZBppe
         GDyQ==
X-Gm-Message-State: APuU4Z9Jx3Ax4hDHzXoIJWjZJWAbGrghgONrwaaxp1N6muqcmyUuSidD
	J0i9Z+WRaj2ApERYabXiVMhJRhVQUMP34VskuLUy6DOxVN0PnVfILc++slFgwoG8KprN71aeHIS
	3W8TWqy0QLRFl2paCyqCMtCJzBqKKC1+nK/DzeSQ=
X-Gm-Gg: AYBFou2Q8jS1OJmIJUtKeGO5JLyCY/oPEHpwBV4nV1hdvAr+iXnz77tkPeYQlzAQMKY
	WRLElLKgzK5f7Qgbiph3gEgcFhigWkFpqTVp3G/83lvEvC+/WBjW9hM0B6cZ9yhrAraihnk1Ro7
	xRcMfvHrw0kBhuYkr7+jLzPmDAnxvDA3Ui2XTTfXIXN4pwEDlOW6ZZXDuuaBPHFctQJqrcIrMOz
	x0xTSTruobqSNPO9M0GPX+qUgD3iXayMVPoFJX80IZvuXP2Dot6o6aecOL8Zz6mO8/XmZ/dUrrz
	5yZHAtqB0jGDHIHBS387mP/dI+V01IZ5xC5V2kBVzD2RNRYyJg624cZZ3ctW8gPDslVceJ225Aa
	BYpN8owyP5JvJJOyl6dMGPEr6cUvJthtY4/w=
X-Received: by 2002:a05:6402:321d:b0:6b7:ce4a:7cfb with SMTP id
 4fb4d7f45d1cf-6b7ce4a7eb3mr8519120a12.24.1794893138051; Mon, 16 Nov 2026
 21:25:38 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 16 Nov 2026 21:25:37 -0800
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Yuen Su <zypulsecore@gmail.com>
In-Reply-To: <20261116151618.2ee4bf9d@phoenix.local>
References: <20261026102420.612573-1-zypulsecore@gmail.com> <20261116151618.2ee4bf9d@phoenix.local>
Date: Mon, 16 Nov 2026 21:25:37 -0800
X-Gm-Features: AclHuK-0i2DFs0HRR6M0xPC-KiVwLrrFDUdGn9Ca-r0m2i1vCotAytIY7qy8p_s
Message-ID: <CAC9WPdy-t24XJXdPjDLP5ZZWqTJpkqy3OmvZsrOpr3qB9S_y0g@mail.gmail.com>
Subject: [PATCH iproute2 v3] ip: flush nexthop-object routes without
 compatibility attributes
To: netdev@vger.kernel.org
Cc: Stephen Hemminger <stephen@networkplumber.org>
Content-Type: text/plain; charset="UTF-8"

Route dumps can contain RTA_NH_ID plus expanded nexthop attributes.
The kernel rejects that combination on deletion. Strip the expansion
from the flush copy, preserving the ID and other route selectors. Use
the compacted length for batching and retain the original for display.

Blackhole nexthops also hide the IPv4 alias type. Track explicit type
selectors separately from the VRF default. Without an explicit type,
clear the synthetic type for unfiltered requests and for VRF requests
with scope below LINK. Local and broadcast aliases cannot have that
scope, and deletion still matches it. Ambiguous link/host-scope aliases
retain the existing failure.

Leave IPv6 blackhole dumps unchanged: they can hide a local type, and
deletion does not check the type. Stripping their expansion would allow
a VRF flush to delete a local route that previously survived an error.

Extend the namespace tests with the VRF case, explicit types in either
argument order, excluded local/broadcast aliases and IPv6 retention.

Signed-off-by: Yuen Su <zypulsecore@gmail.com>
---
v3:
- Record explicit type selectors separately from the VRF default, and keep
  them explicit in either argument order.
- Apply the IPv4 workaround to VRF requests only below LINK scope. A flag
  alone also deletes hidden local/broadcast aliases. Link/host-scope
  ambiguity retains the existing failure.
- Preserve the original IPv6 blackhole delete request: stripping its
  expansion enables deletion of a hidden local route on Linux 5.4 and 7.3.
- Extend the existing tests with VRF and type-retention cases.

Tested with compatibility expansion on/off, strict dump unavailable via
seccomp, and a Linux 5.4 VM. Linux 4.19 only covers ordinary routes; it
has no nexthop objects. No new strict-dump dependency is introduced.

AI assistance was used.

Link: https://lists.openwall.net/netdev/2026/10/26/186

 ip/iproute.c                             |  47 +++++-
 testsuite/tests/ip/route/flush_nexthop.t | 176 +++++++++++++++++++++++
 2 files changed, 221 insertions(+), 2 deletions(-)
 create mode 100755 testsuite/tests/ip/route/flush_nexthop.t

diff --git a/ip/iproute.c b/ip/iproute.c
index 067569c..5f776ee 100644
--- a/ip/iproute.c
+++ b/ip/iproute.c
@@ -131,6 +131,7 @@ static struct
 	int protocol, protocolmask;
 	int scope, scopemask;
 	__u64 typemask;
+	bool type_explicit;
 	int tos, tosmask;
 	int iif, iifmask;
 	int oif, oifmask;
@@ -766,6 +767,39 @@ static void print_rta_multipath(FILE *fp, const
struct rtmsg *r,
 	close_json_array(PRINT_JSON, NULL);
 }

+static void flush_nexthop_compat(struct nlmsghdr *n,
+				const struct nlmsghdr *source)
+{
+	const struct rtmsg *r = NLMSG_DATA(source);
+	struct rtmsg *dr = NLMSG_DATA(n);
+	const struct rtattr *rta = RTM_RTA(r);
+	int len = RTM_PAYLOAD(source);
+	char *dst = (char *)n + NLMSG_LENGTH(sizeof(*r));
+
+	for (; RTA_OK(rta, len); rta = RTA_NEXT(rta, len)) {
+		switch (rta->rta_type & NLA_TYPE_MASK) {
+		case RTA_OIF:
+		case RTA_GATEWAY:
+		case RTA_MULTIPATH:
+		case RTA_VIA:
+		case RTA_ENCAP_TYPE:
+		case RTA_ENCAP:
+			continue;
+		}
+		memcpy(dst, rta, RTA_ALIGN(rta->rta_len));
+		dst += RTA_ALIGN(rta->rta_len);
+	}
+	n->nlmsg_len = dst - (char *)n;
+	/* Blackhole nexthops hide the IPv4 alias type. With a VRF mask,
+	 * only scopes below LINK exclude both local and broadcast aliases.
+	 * Keep the scope in the delete request and never relax explicit types.
+	 */
+	if (!filter.type_explicit &&
+	    (!filter.typemask || r->rtm_scope < RT_SCOPE_LINK) &&
+	    r->rtm_family == AF_INET && r->rtm_type == RTN_BLACKHOLE)
+		dr->rtm_type = RTN_UNSPEC;
+}
+
 int print_route(struct nlmsghdr *n, void *arg)
 {
 	FILE *fp = (FILE *)arg;
@@ -810,10 +844,17 @@ int print_route(struct nlmsghdr *n, void *arg)
 		}
 		fn = (struct nlmsghdr *)(filter.flushb + NLMSG_ALIGN(filter.flushp));
 		memcpy(fn, n, n->nlmsg_len);
+		/* Keep the exact nexthop ID without its conflicting expansion.
+		 * Leave IPv6 blackhole dumps unchanged: they can hide a local
+		 * type, and deletion does not check the type.
+		 */
+		if (tb[RTA_NH_ID] &&
+		    !(r->rtm_family == AF_INET6 && r->rtm_type == RTN_BLACKHOLE))
+			flush_nexthop_compat(fn, n);
 		fn->nlmsg_type = RTM_DELROUTE;
 		fn->nlmsg_flags = NLM_F_REQUEST;
 		fn->nlmsg_seq = ++rth.seq;
-		filter.flushp = (((char *)fn) + n->nlmsg_len) - filter.flushb;
+		filter.flushp = (((char *)fn) + fn->nlmsg_len) - filter.flushb;
 		filter.flushed++;
 		if (show_stats < 2)
 			return 0;
@@ -1866,7 +1907,8 @@ static int iproute_list_flush_or_save(int argc,
char **argv, int action)
 			if (tid == 0)
 				invarg("Invalid VRF\n", *argv);
 			filter.tb = tid;
-			filter.typemask = ~(1 << RTN_LOCAL | 1<<RTN_BROADCAST);
+			if (!filter.type_explicit)
+				filter.typemask = ~(1 << RTN_LOCAL | 1<<RTN_BROADCAST);
 		} else if (matches(*argv, "cached") == 0 ||
 			   matches(*argv, "cloned") == 0) {
 			filter.cloned = 1;
@@ -1910,6 +1952,7 @@ static int iproute_list_flush_or_save(int argc,
char **argv, int action)
 			if (rtnl_rtntype_a2n(&type, *argv))
 				invarg("node type value is invalid\n", *argv);
 			filter.typemask = (1<<type);
+			filter.type_explicit = true;
 		} else if (strcmp(*argv, "dev") == 0 ||
 			   strcmp(*argv, "oif") == 0) {
 			NEXT_ARG();
diff --git a/testsuite/tests/ip/route/flush_nexthop.t
b/testsuite/tests/ip/route/flush_nexthop.t
new file mode 100755
index 0000000..6820ff4
--- /dev/null
+++ b/testsuite/tests/ip/route/flush_nexthop.t
@@ -0,0 +1,176 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+. lib/generic.sh
+
+[ -n "$IP" ] || ts_skip
+if ! LC_ALL=C "$IP" nexthop list > "$STD_OUT" 2> "$STD_ERR"; then
+	if [ "$(cat "$STD_ERR")" = "$(printf '%s\n' \
+		'RTNETLINK answers: Operation not supported' 'Dump terminated')" ]; then
+		ts_skip
+	fi
+	ts_err "$0: nexthop feature probe failed:"
+	ts_err_cat "$STD_ERR"
+	exit 1
+fi
+
+ts_log "[Testing route flush with nexthop compatibility attributes]"
+DEV=nhflush0
+ts_ip "$0" "Bring loopback up" link set lo up
+ts_ip "$0" "Create dummy device" link add "$DEV" type dummy
+ts_ip "$0" "Bring device up" link set "$DEV" up
+
+for family in 4 6; do
+	if [ "$family" = 4 ]; then
+		addr=192.0.2.2/24
+		gw=192.0.2.1
+		gw2=192.0.2.3
+		prefix=203.0.113.0/24
+		group_prefix=198.51.100.0/24
+		plain_prefix=198.18.0.0/24
+		nh=101
+		nh2=102
+		group=103
+	else
+		addr=2001:db8:1::2/64
+		gw=2001:db8:1::1
+		gw2=2001:db8:1::3
+		prefix=2001:db8:2::/64
+		group_prefix=2001:db8:3::/64
+		plain_prefix=2001:db8:4::/64
+		nh=201
+		nh2=202
+		group=203
+	fi
+	if [ "$family" = 6 ]; then
+		ts_ip "$0" "Assign IPv6 address" -6 addr add "$addr" dev "$DEV" nodad
+	else
+		ts_ip "$0" "Assign IPv4 address" -4 addr add "$addr" dev "$DEV"
+	fi
+	ts_ip "$0" "Create first nexthop" -"$family" nexthop add id "$nh"
via "$gw" dev "$DEV" onlink
+	ts_ip "$0" "Create second nexthop" -"$family" nexthop add id "$nh2"
via "$gw2" dev "$DEV"
+	ts_ip "$0" "Create nexthop group" nexthop add id "$group" group "$nh/$nh2"
+	ts_ip "$0" "Add selected route with metrics" -"$family" route add
table 111 "$prefix" nhid "$nh" metric 10 mtu 1400 advmss 1360
+	ts_ip "$0" "Add another metric on same prefix" -"$family" route add
table 111 "$prefix" nhid "$nh2" metric 20
+	ts_ip "$0" "Add same route in another table" -"$family" route add
table 112 "$prefix" nhid "$nh" metric 10
+	ts_ip "$0" "Flush selected metric" -"$family" route flush table 111 metric 10
+	ts_ip "$0" "Check other metric survived" -"$family" route show table
111 "$prefix"
+	test_on "nhid $nh2"
+	test_on "metric 20"
+	test_lines_count 1
+	ts_ip "$0" "Check other table survived" -"$family" route show table
112 "$prefix"
+	test_on "nhid $nh"
+	test_lines_count 1
+	ts_ip "$0" "Add group route" -"$family" route add table 111
"$group_prefix" nhid "$group" metric 30
+	ts_ip "$0" "Flush group with original dump display" -"$family" -s -s
route flush table 111 to "$group_prefix"
+	test_on "nhid $group"
+	ts_ip "$0" "Check group route removed" -"$family" route show table
111 "$group_prefix"
+	test_lines_count 0
+	ts_ip "$0" "Check nexthop group retained" nexthop show id "$group"
+	test_on "id $group group"
+	ts_ip "$0" "Add ordinary multipath route" -"$family" route add table
111 "$plain_prefix" nexthop via "$gw" dev "$DEV" weight 1 nexthop via
"$gw2" dev "$DEV" weight 2
+	ts_ip "$0" "Flush ordinary multipath route" -"$family" route flush
table 111 to "$plain_prefix"
+	ts_ip "$0" "Check ordinary route removed" -"$family" route show
table 111 "$plain_prefix"
+	test_lines_count 0
+	# Mix compacted and unchanged messages to check flush buffer offsets.
+	ts_ip "$0" "Add group to mixed batch" -"$family" route add table 111
"$group_prefix" nhid "$group" metric 30
+	ts_ip "$0" "Add ordinary route to mixed batch" -"$family" route add
table 111 "$plain_prefix" dev "$DEV" metric 40
+	ts_ip "$0" "Flush mixed batch with original dump display" -"$family"
-s -s route flush table 111
+	test_on "nhid $nh2"
+	test_on "nhid $group"
+	ts_ip "$0" "Check selected table empty" -"$family" route show table 111
+	test_lines_count 0
+	ts_ip "$0" "Flush second table" -"$family" route flush table 112
+done
+
+# An IPv4 route with an IPv6 nexthop expands to RTA_VIA.
+ts_ip "$0" "Add cross-family route" -4 route add table 111
203.0.113.0/24 nhid 201
+ts_ip "$0" "Flush cross-family route" -4 route flush table 111
+ts_ip "$0" "Check cross-family route removed" -4 route show table 111
+test_lines_count 0
+
+ts_ip "$0" "Create blackhole nexthop" -4 nexthop add id 301 blackhole
+for type in unicast blackhole unreachable prohibit; do
+	ts_ip "$0" "Add $type alias" -4 route add "$type" 192.0.2.0/24 table
111 nhid 301
+	ts_ip "$0" "Flush alias without type constraint" -4 route flush table 111
+	ts_ip "$0" "Check alias removed" -4 route show table 111
+	test_lines_count 0
+done
+
+VRF=nhflushvrf
+ts_ip "$0" "Create VRF" link add "$VRF" type vrf table 111
+ts_ip "$0" "Bring VRF up" link set "$VRF" up
+ts_ip "$0" "Add global unicast with blackhole nexthop" -4 route add
192.0.2.0/24 table 111 nhid 301
+ts_ip "$0" "Flush blackhole nexthop through VRF selector" -4 route
flush vrf "$VRF"
+ts_ip "$0" "Check VRF route removed" -4 route show table 111
+test_lines_count 0
+
+# An explicit type must remain explicit on either side of the VRF argument.
+for order in type-first vrf-first; do
+	if [ "$order" = type-first ]; then
+		set -- type unicast vrf "$VRF"
+	else
+		set -- vrf "$VRF" type unicast
+	fi
+	ts_ip "$0" "Add blackhole alias for explicit type ($order)" -4 route
add blackhole 192.0.2.0/24 table 111 nhid 301
+	ts_ip "$0" "Flush only explicit unicast ($order)" -4 route flush "$@"
+	ts_ip "$0" "Check blackhole alias retained" -4 route show table 111
+	test_lines_count 1
+	ts_ip "$0" "Delete blackhole alias" -4 route del blackhole
192.0.2.0/24 table 111 nhid 301
+
+	if [ "$order" = type-first ]; then
+		set -- type blackhole vrf "$VRF"
+	else
+		set -- vrf "$VRF" type blackhole
+	fi
+	ts_ip "$0" "Add hidden unicast for explicit type ($order)" -4 route
add 192.0.2.0/24 table 111 nhid 301
+	if "$IP" -4 route flush "$@" > "$STD_OUT" 2> "$STD_ERR"; then
+		ts_err "Explicit blackhole flush unexpectedly deleted a unicast alias"
+	fi
+	ts_ip "$0" "Check hidden unicast retained" -4 route show table 111
+	test_lines_count 1
+	ts_ip "$0" "Delete hidden unicast" -4 route del unicast 192.0.2.0/24
table 111 nhid 301
+done
+
+# The VRF mask excludes local/broadcast. Their synthesized type must not
+# turn the wildcard workaround into permission to delete them.
+for type in local broadcast; do
+	ts_ip "$0" "Add hidden $type alias" -4 route add "$type"
192.0.2.0/24 table 111 nhid 301
+	if "$IP" -4 route flush vrf "$VRF" > "$STD_OUT" 2> "$STD_ERR"; then
+		ts_err "VRF flush unexpectedly succeeded on a hidden $type alias"
+	fi
+	ts_ip "$0" "Check hidden $type retained" -4 route show table 111
+	test_lines_count 1
+	ts_ip "$0" "Delete retained $type by its actual type" -4 route del
"$type" 192.0.2.0/24 table 111 nhid 301
+done
+
+# At these scopes unicast cannot be distinguished from the excluded types.
+for scope in link host; do
+	ts_ip "$0" "Add ambiguous $scope unicast" -4 route add 192.0.2.0/24
table 111 nhid 301 scope "$scope"
+	if "$IP" -4 route flush vrf "$VRF" > "$STD_OUT" 2> "$STD_ERR"; then
+		ts_err "VRF flush unexpectedly relaxed an ambiguous $scope type"
+	fi
+	ts_ip "$0" "Check ambiguous $scope unicast retained" -4 route show table 111
+	test_lines_count 1
+	ts_ip "$0" "Delete retained $scope unicast" -4 route del unicast
192.0.2.0/24 table 111 nhid 301 scope "$scope"
+done
+
+# With expansion, stripping IPv6 attributes would enable deletion of a
+# hidden local type. Keep the baseline failure until its type is known.
+if [ "$(cat /proc/sys/net/ipv4/nexthop_compat_mode 2>/dev/null)" != 0 ]; then
+	ts_ip "$0" "Create IPv6 blackhole nexthop" -6 nexthop add id 302 blackhole
+	ts_ip "$0" "Add hidden IPv6 local route" -6 route add local
2001:db8:5::/64 table 111 nhid 302
+	if "$IP" -6 route flush vrf "$VRF" > "$STD_OUT" 2> "$STD_ERR"; then
+		ts_err "VRF flush unexpectedly deleted the hidden IPv6 local route"
+	fi
+	ts_ip "$0" "Check hidden IPv6 local retained" -6 route show table 111
+	test_lines_count 1
+	ts_ip "$0" "Delete hidden IPv6 local by actual type" -6 route del
local 2001:db8:5::/64 table 111 nhid 302
+	ts_ip "$0" "Delete IPv6 blackhole nexthop" nexthop del id 302
+fi
+
+ts_ip "$0" "Check blackhole nexthop retained" nexthop show id 301
+test_on "id 301 blackhole"
+ts_ip "$0" "Delete blackhole nexthop" nexthop del id 301
+ts_ip "$0" "Delete VRF" link del "$VRF"
+ts_ip "$0" "Delete test device and its nexthops" link del "$DEV"

base-commit: a73d93d00752fe07494c830c32c58b07fb850e84
-- 
2.55.0



On Mon, 16 Nov 2026 15:16:18 -0800, Stephen Hemminger
<stephen@networkplumber.org> wrote:
> On Mon, 26 Oct 2026 18:24:20 +0800
> Yuen Su <zypulsecore@gmail.com> wrote:
>
> > Route dumps can contain RTA_NH_ID plus expanded nexthop attributes.
> > The kernel rejects that combination on route deletion. Strip the
> > expansion from the flush copy, keeping the ID and route selectors.
> > Use the compacted length for batching and retain the dump for display.
> >
> > IPv4 fib_dump_info() also reports blackhole nexthop objects as
> > RTN_BLACKHOLE instead of the alias type, independently of
> > nexthop_compat_mode. Work around this with RTN_UNSPEC only when no
> > type filter was requested. The kernel then deletes the first alias
> > matching the remaining selectors; alias order and changes between
> > dump and deletion can affect that choice. Preserve explicit types.
> >
> > Add namespace regressions covering ID-based flushes, ordinary routes,
> > batching and type selection, with a nexthop capability probe.
> >
> > Signed-off-by: Yuen Su <zypulsecore@gmail.com>
> > ---
>
> In general looked OK, but AI review with review-prompts showed
> some issues.
>
> On Mon, 26 Oct 2026 18:24:20 +0800, Yuen Su wrote:
>
> The mechanism here is right, and I checked the premise against the
> kernel: fib_frontend.c rtm_to_fib_config() rejects fc_nh_id combined
> with fc_oif/fc_gw_family/fc_encap/fc_mp, and your strip list covers
> exactly those four (RTA_OIF, RTA_GATEWAY/RTA_VIA, RTA_ENCAP/
> RTA_ENCAP_TYPE, RTA_MULTIPATH). fib_nh_match() returns 0 on an
> ID-only request, so the compacted message matches. The AF_INET-only
> restriction on the type workaround is also correct: ip6_route_del()
> never compares fc_type against rt->fib6_type, so IPv6 needs no
> equivalent even though rt6_fill_node() synthesizes RTN_BLACKHOLE the
> same way.
>
> One case the workaround does not cover.
>
> > +	/* Work around fib_dump_info() replacing the IPv4 alias type with
> > +	 * RTN_BLACKHOLE for blackhole nexthop objects, independently of
> > +	 * nexthop_compat_mode. Keep explicit type constraints.
> > +	 */
> > +	if (!filter.typemask &&
> > +	    r->rtm_family == AF_INET && r->rtm_type == RTN_BLACKHOLE)
> > +		dr->rtm_type = RTN_UNSPEC;
>
> filter.typemask is not only set by an explicit "type" argument. The
> vrf keyword sets it too, in iproute_list_flush_or_save():
>
> 	} else if (matches(*argv, "vrf") == 0) {
> 		...
> 		filter.tb = tid;
> 		filter.typemask = ~(1 << RTN_LOCAL | 1<<RTN_BROADCAST);
>
> That parser is shared between list, flush and save, so
>
> 	ip route flush vrf blue
>
> leaves typemask nonzero with no type requested by the user, the
> workaround is skipped, and the delete request carries the synthesized
> RTN_BLACKHOLE. For an IPv4 unicast route using a blackhole nexthop
> object in that VRF table, fib_table_delete() requires an exact match:
>
> 	if ((!cfg->fc_type || fa->fa_type == cfg->fc_type) &&
>
> fa_type is RTN_UNICAST, fc_type is RTN_BLACKHOLE, no alias matches,
> and the delete returns ESRCH. iproute_flush() keeps redumping and
> resending until the 30 second timeout, then reports entries remaining.
>
> To be clear about severity: this is not a regression. Those routes
> fail to flush before your patch as well, for the same reason the
> patch exists. It is a gap in the fix, and worth deciding on rather
> than leaving implicit, because flush vrf is a common way to tear
> down a VRF.
>
> The awkward part is that typemask cannot distinguish the two cases by
> inspection - the vrf mask has the RTN_BLACKHOLE bit set, so you
> cannot test for it. How would you prefer to handle it? A separate
> flag recording that the user actually passed "type" would make the
> guard say what the comment says, and would leave the vrf mask alone:
>
> 	} else if (matches(*argv, "type") == 0) {
> 		...
> 		filter.typemask = (1<<type);
> 		filter.type_explicit = 1;
>
> then test !filter.type_explicit in flush_nexthop_compat(). I have no
> strong preference on the spelling; the point is that the current
> guard is testing a proxy that has a second writer.
>
> Worth extending the new test to cover it, since it is the one flush
> form where the workaround silently does not apply.
>
> Everything else I looked at checked out. The buffer arithmetic is
> sound: the space check against the uncompacted n->nlmsg_len is
> conservative because compaction only shrinks, and nlmsg_len stays
> NLMSG-aligned since it starts at NLMSG_LENGTH(sizeof(*r)) and
> advances by RTA_ALIGN, so the NLMSG_ALIGN(filter.flushp) arithmetic
> for the next message in the batch still holds. Display still uses the
> untouched dump. The testsuite helpers all exist in lib/generic.sh and
> the build is clean.
