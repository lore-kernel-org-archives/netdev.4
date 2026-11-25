Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634112;
	b=B3L/jeWQrS6OjZxq+Nr7C1CSYuz9cU5CRfYKxgIKAB8o5EbEH1SR1waOtGi6KcIM60/M
	 SkjAl8NDWII+hzLVApuSHo6SX2KMj5VQ3xH6SN+WXOtr1uJq/lpY9cqVNPk93Z40V62qa
	 04u+MDru9J045suZEw7o8cCy8spzkXBMVwo6QjLkjx7aupjzKc+hM0OScvxRerR/QhAhl
	 NuMag9wqjc3leVqH5equ05AnOlLKZIxQwYIkui8FvsLmyJuX51UWB7Nwjr7DpGNPLHo30
	 r+Tpax5EyRXfeg4WHFTXUgwK2Xoj6pC9Y82sDWIl9kx6K37NkUxdq7O683k9IGKL5uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q43Kv8AI7k3xnI/5auu2UupclPm8Duhlc/VMxpIlZaE=;
	b=JNJfrJ18sDksCIUcGDIV0RCFwuOuJfKmJC/ya/19X9QOSNNPmb/0LPAo399PGo6r2W9X
	 BSgheer9kfFxBhvqSR6c0Hh1Xd3qYzTWd9Ngi7xsQEvpuGUa7KpXTQU1dZWKaVRE89Vu1
	 ON7GOB1lB28R75UpP8q9Go3yOqd+DQ9dDaOLzzlDr/ZPP1iH2aHxA9KZEWe6+acVraC7n
	 pNcn/chZWiDiNJrydNqgSQT1oE9jIvZKNfCUDPZNUsodqQaYvEVOx6Zqu6oagGqU6y9m7
	 TxW5U28xSfciodmSMeYnLjIL+MTB71/biGjqpYSxnKy7gd/aFkxL/zIZwrElncjGUkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=re1GBLFo;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8749060A380D
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:15:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8749060A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=re1GBLFo
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f02ee04378so49462795ad.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634111; x=1796238911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q43Kv8AI7k3xnI/5auu2UupclPm8Duhlc/VMxpIlZaE=;
        b=re1GBLFoTStclRQkmC5R90dr5dxSikjchv3gaSH0yrVk4YiNNlOGf3sluCt/qVgvLv
         hcp0i/HuCKITr+JxalHPRGm44wCyu29w9ZMCYd/rTFaCUGtWrg1UBg/JGiWjOm3CUQuF
         Rh5GNpFKiZOG2Pp+xbYOHp/UXcLklW6I5w+Zoy5ofD6XCdMZjuupxGYpb1igdbFrPae0
         OwOgTIg1xispwc9fy/c00ChX7q3odRGRIJ2P+z0rH0INoJM85ILEqvJZLXv7Q6/ECDBe
         bI3a0wgzsz8GfBnb9Fag9RlaPrrvh5pAWy2vD7YzQi3gHb30cxeffNrPdXHKU0YZIeDd
         hfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634111; x=1796238911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q43Kv8AI7k3xnI/5auu2UupclPm8Duhlc/VMxpIlZaE=;
        b=kHCh2aEQRoqHNcwqE/LsLR8haNO+EPyJ0MLziGlxNltinB+PU4UPwBQMObS5KRzltl
         qQnvTVzZdnupmqZwjsYv7BQqxDIqNNfuQYExy1OANkVrKyefRgeE96ftm8DeygpMS9Uj
         uJDCAyy+4KJnAHW/KGT8EochAlW6CdUNCYQ3wUDgRmLwRqy7s3rLXDF3hEuWj6SXH8gx
         qk65FySvPfkl4lmTXMvET0z5xzhiBc/KjaPh4uAm59Nruo3O8Vpdysm/8vSMVjntOmOl
         YdbphYnMaHSwyEQBiPLYVF9AIksf/sZVIqCFvp3F9gx73xZQCRlDj+frOfRZ+17tD3l7
         IWmg==
X-Forwarded-Encrypted: i=1; AL+hErF2ovCQFdn6uLhEJTwD5KlBjWDgZvM4OxLxZYqZygSJr7M8gWi+rH2ZZsIByGwCIUVnaSzxlo8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9PAL8seZN/isp18pOB2lPildJQ8o5OS5EeGuWzX84shr6+WoW
	2lPN6o4yZ16kV6vN6s5h6N+zcF/2tggHxwGmdxKOQO5HW/K+7iRklNCuscdOignLJo0=
X-Gm-Gg: AZFdTZecvwHyAIzWe/irKJ0ixZMiYfNxzvxc800fbzOfEpzsey63cDIiCX8JRN5+W0c
	rnV5URbvK7+hcJJX1kvt18GfJplYjDmqjs+k9fCuXgQO8zbSVxQt+rCpYcrQyc6wpqrbXW7z1LS
	TSq/CQDi+MgKl85Z/2rQAQK0GkXtIQ482S5z52xTpMeov+T4u4lC82o7ySjw4aquxgggYkv8d9S
	Ye8rhTlAxmggg6qu4JyOvmE449hAqrgpusrHT2iTmmBODp2YP8Smu8auONElb686B0/omeVrM0n
	ebX4MH0jWknzKisEwfUauYWWx/XbYSfkW45FCO7Mpo2K0fWXQmPp3tJ46IEa+VfHbNaOoG6rCRT
	9KzmeIewFq4oGAsei0jyYBJpdW4GQvMaEgVMNNWCf6lgdc1Fd9mDITE+paqn2iX2+vPNhuABC7T
	tuKeXt5172H8fbGTdnPypidvEpqrQnpejuYcdxqbW/jjy5x1Ty5SLzOh6Q5Gyds4XSKnZorBLDJ
	wbM9YAc1EAqgbKWZVExLoldaiBSTKE31wNfJvr4AHhCOO6eMjKveio4tZCUeQKjLeiog2HBcW0b
	w+rY1j9ExloPJUxh2a2TMqOk/NClrMgHUvDQyfstfMkWwp2DjotpF2Tw5ovdNHEn2b92+MZT7jN
	pLRKH8y8Hx8sYBp9Hs4bJhN6HQ/mleYM9DjUn2Rf4H1E5DEYn/AU=
X-Received: by 2002:a17:903:1b4d:b0:2ed:118e:7faa with SMTP id d9443c01a7336-2f03f212c77mr206395185ad.37.1795634110692;
        Wed, 25 Nov 2026 11:15:10 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:09 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 12/12] selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes
Date: Wed, 25 Nov 2026 19:14:50 +0000
Message-ID: <20261125191450.2497936-13-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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

amt_v6.sh builds a gateway and a relay over an IPv6 outer transport and
checks the data plane, but only with valid attributes. The link-creation
rules this series adds for IFLA_AMT_LOCAL_IP6 and IFLA_AMT_DISCOVERY_IP6
are not exercised.

This adds a small companion without a data plane: one netns and one
dummy device, no relay, socat or smcroute. It checks that the IPv6
local and discovery addresses of a gateway, and the local address of a
relay, read back through amt_fill_info(), that a relay reports no
discovery address, that an IPv4 gateway still creates and reports its
IPv4 discovery address, and that an IPv4 relay still accepts the IPv4
discovery address it has always ignored. It then checks each rejection:
a gateway without a discovery address, a gateway whose local and
discovery addresses differ in family (both ways), an IPv6 relay given a
discovery address of either family, an IPv4 relay given an IPv6 one,
and an unspecified, loopback, multicast or IPv4-mapped IPv6 local or
discovery address. Each rejection is matched on its extack message as
well as on the failure, so a rule that fails for the wrong reason is not
a pass.

Three cases are left out because iproute2 cannot express them: both
`discovery <v4>` and `discovery <v6>`, or both `local <v4>` and
`local <v6>`, in one command, and a 16-byte IFLA_AMT_LOCAL_IP or
IFLA_AMT_DISCOVERY_IP. iproute2 rejects the repeated argument before it
builds a message, and with IPv6 support it never sends 16 bytes in an
IPv4 attribute, so those checks are reachable only from a raw netlink
client or an older iproute2.

The probe checks the readback as well as the result. An iproute2 without
the IPv6 attributes may pack the first four bytes of the IPv6 literal
into the IPv4 attribute, so `discovery 2001:db8:a::2` becomes
32.1.13.184 and a kernel without this series builds a valid IPv4
gateway from it; this kernel refuses it ("IPv6 address in an IPv4
attribute"). That refusal is logged as a passing test before the
probe skips, since it is the rule an older iproute2 exercises. If such
an iproute2 gets an IPv4 device back from a kernel that has the IPv6
attributes, recognised by its "Discovery attribute of the local family
is required" message, the refusal is broken and the probe fails. The
probe skips on an iproute2 that rejects the literal, on a kernel that
ignores the attributes ("Local attribute is required"), and on a kernel
without IPv6 ("IPv6 support is disabled", or no /proc/net/if_inet6).
Any other failure to create the probe link is a FAIL.

The script uses lib.sh: setup_ns for the namespace, check_err and
log_test for reporting, and $ksft_skip when a prerequisite is missing.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 tools/testing/selftests/net/Makefile     |   1 +
 tools/testing/selftests/net/amt_gw_v6.sh | 207 +++++++++++++++++++++++
 2 files changed, 208 insertions(+)
 create mode 100755 tools/testing/selftests/net/amt_gw_v6.sh

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 7f98f74f9..eb82e120b 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -9,6 +9,7 @@ CFLAGS += -I../
 TEST_PROGS := \
 	altnames.sh \
 	amt.sh \
+	amt_gw_v6.sh \
 	amt_v6.sh \
 	arp_ndisc_evict_nocarrier.sh \
 	arp_ndisc_untracked_subnets.sh \
diff --git a/tools/testing/selftests/net/amt_gw_v6.sh b/tools/testing/selftests/net/amt_gw_v6.sh
new file mode 100755
index 000000000..92e48d2f5
--- /dev/null
+++ b/tools/testing/selftests/net/amt_gw_v6.sh
@@ -0,0 +1,207 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Netlink coverage for the AMT IPv6 attributes, IFLA_AMT_LOCAL_IP6 and
+# IFLA_AMT_DISCOVERY_IP6, and the rules that validate them. amt_v6.sh covers
+# the data plane; this needs only one netns and one dummy device.
+#
+# Not covered: `discovery <v4>` together with `discovery <v6>`, or `local <v4>`
+# together with `local <v6>`, in one command. iproute2 rejects the duplicate
+# argument itself, so those checks are reachable only from a raw netlink
+# client.
+
+source lib.sh
+
+readonly V6_LOCAL="2001:db8:a::1"
+readonly V6_DISC="2001:db8:a::2"
+readonly V4_LOCAL="192.168.0.1"
+readonly V4_DISC="192.168.0.2"
+
+# add_amt <name> <args...>: create an amt link on gw_dev, stderr in $ADD_ERR.
+add_amt()
+{
+	local name=$1; shift
+
+	ADD_ERR=$(ip -n "$GW" link add "$name" type amt dev gw_dev "$@" 2>&1)
+}
+
+# amt_field <name> <key>: one attribute as amt_fill_info reports it.
+amt_field()
+{
+	ip -n "$GW" -d -j link show "$1" 2>/dev/null |
+		jq -r ".[0].linkinfo.info_data.$2 // empty"
+}
+
+# An iproute2 without IFLA_AMT_DISCOVERY_IP6 may not reject `discovery
+# <v6>`: it can pack the literal into IFLA_AMT_DISCOVERY_IP, which this
+# kernel refuses and an older one turns into a v4 gateway from the first
+# four bytes. So probe on the readback, not only on the exit code. A
+# kernel without the IPv6 attributes ignores them and asks for a local
+# address. Skip in those cases only; any other failure is a failure of the
+# code under test.
+probe_v6_gateway()
+{
+	local got
+
+	if ! add_amt amtprobe mode gateway local "$V6_LOCAL" \
+	     discovery "$V6_DISC"; then
+		case "$ADD_ERR" in
+		*"IPv6 address in an IPv4 attribute"*)
+			# An older iproute2 on this kernel: the rule that
+			# refuses the 16-byte IPv4 attribute is what ran.
+			RET=0
+			log_test "16-byte IPv4 address attribute is refused"
+			echo "SKIP: iproute2 lacks IPv6 AMT support"
+			exit "$ksft_skip"
+			;;
+		*"Local attribute is required"*|*"expected rather than"*|\
+		*"IPv6 support is disabled"*)
+			echo "SKIP: no IPv6 AMT support: $ADD_ERR"
+			exit "$ksft_skip"
+			;;
+		esac
+		echo "FAIL: cannot create an IPv6 gateway: $ADD_ERR"
+		exit "$ksft_fail"
+	fi
+	got=$(amt_field amtprobe discovery)
+	ip -n "$GW" link del amtprobe
+	if [[ "$got" != *:* ]]; then
+		# A kernel with the IPv6 attributes names the missing
+		# discovery address this way, and must have refused the
+		# 16-byte IPv4 attribute that an older iproute2 sent.
+		add_amt amtprobe mode gateway local "$V4_LOCAL"
+		ip -n "$GW" link del amtprobe 2>/dev/null
+		if [[ "$ADD_ERR" == *"of the local family is required"* ]]; then
+			echo "FAIL: 16-byte IPv4 attribute read back as '$got'"
+			exit "$ksft_fail"
+		fi
+		echo "SKIP: iproute2 lacks IPv6 AMT support (read back '$got')"
+		exit "$ksft_skip"
+	fi
+}
+
+test_v6_gateway_roundtrip()
+{
+	RET=0
+	add_amt amtg6 mode gateway local "$V6_LOCAL" discovery "$V6_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg6 discovery)" = "$V6_DISC" ]
+	check_err $? "discovery did not read back as $V6_DISC"
+	[ "$(amt_field amtg6 local)" = "$V6_LOCAL" ]
+	check_err $? "local did not read back as $V6_LOCAL"
+	ip -n "$GW" link del amtg6 2>/dev/null
+	log_test "v6 gateway: discovery round-trips through fill_info"
+}
+
+test_v6_relay_roundtrip()
+{
+	RET=0
+	add_amt amtr6 mode relay local "$V6_LOCAL"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtr6 local)" = "$V6_LOCAL" ]
+	check_err $? "local did not read back as $V6_LOCAL"
+	[ -z "$(amt_field amtr6 discovery)" ]
+	check_err $? "a relay reported a discovery address"
+	ip -n "$GW" link del amtr6 2>/dev/null
+	log_test "v6 relay: local round-trips, no discovery reported"
+}
+
+test_v4_gateway_unchanged()
+{
+	RET=0
+	add_amt amtg4 mode gateway local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	[ "$(amt_field amtg4 discovery)" = "$V4_DISC" ]
+	check_err $? "discovery did not read back as $V4_DISC"
+	ip -n "$GW" link del amtg4 2>/dev/null
+	log_test "v4 gateway still creates (no ABI change)"
+}
+
+# An IPv4 relay has always ignored IFLA_AMT_DISCOVERY_IP, and still must.
+test_v4_relay_unchanged()
+{
+	RET=0
+	add_amt amtr4 mode relay local "$V4_LOCAL" discovery "$V4_DISC"
+	check_err $? "create failed: $ADD_ERR"
+	ip -n "$GW" link del amtr4 2>/dev/null
+	log_test "v4 relay still accepts a v4 discovery (no ABI change)"
+}
+
+# expect_reject <description> <extack substring> <args...>: the create must
+# fail, and for the stated reason.
+expect_reject()
+{
+	local desc=$1 want=$2; shift 2
+
+	RET=0
+	add_amt amtbad "$@"
+	check_fail $? "link was created but should have been rejected"
+	ip -n "$GW" link del amtbad 2>/dev/null
+	grep -qi -- "$want" <<< "$ADD_ERR"
+	check_err $? "rejected for the wrong reason: $ADD_ERR"
+	log_test "$desc"
+}
+
+require_command jq
+if [ ! -e /proc/net/if_inet6 ]; then
+	echo "SKIP: the kernel has no IPv6"
+	exit "$ksft_skip"
+fi
+trap cleanup_all_ns EXIT
+setup_ns GW || exit "$ksft_skip"
+ip -n "$GW" link add gw_dev type dummy
+ip -n "$GW" link set gw_dev up
+ip -n "$GW" addr add "$V4_LOCAL/24" dev gw_dev
+# nodad: a tentative source address would race link creation.
+ip -n "$GW" addr add "$V6_LOCAL/64" dev gw_dev nodad
+
+probe_v6_gateway
+
+test_v6_gateway_roundtrip
+test_v6_relay_roundtrip
+test_v4_gateway_unchanged
+test_v4_relay_unchanged
+expect_reject "gateway without discovery is rejected" \
+	"Discovery attribute" \
+	mode gateway local "$V6_LOCAL"
+expect_reject "gateway v6 local + v4 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "gateway v4 local + v6 discovery is rejected" \
+	"of the local family is required" \
+	mode gateway local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "v6 discovery in relay mode is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V6_DISC"
+expect_reject "v4 discovery on a v6 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V6_LOCAL" discovery "$V4_DISC"
+expect_reject "v6 discovery on a v4 relay is rejected" \
+	"only valid in gateway mode" \
+	mode relay local "$V4_LOCAL" discovery "$V6_DISC"
+expect_reject "unspecified v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::
+expect_reject "v4-mapped v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::ffff:192.168.0.1
+expect_reject "loopback v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ::1
+expect_reject "multicast v6 local is rejected" \
+	"Invalid Local IPv6" \
+	mode relay local ff02::1
+expect_reject "multicast v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ff02::1
+expect_reject "loopback v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::1
+expect_reject "unspecified v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::
+expect_reject "v4-mapped v6 discovery is rejected" \
+	"must be unicast" \
+	mode gateway local "$V6_LOCAL" discovery ::ffff:192.168.0.2
+
+exit "$EXIT_STATUS"
-- 
2.47.3

