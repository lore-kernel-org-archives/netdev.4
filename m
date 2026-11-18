Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032843;
	b=XcwMy8ezdmaHDAiZLDoW4rps6vlNStsFF7xzUSQQ06Ii4vtE3dkBMwVdlqQ6jWLumvmG
	 BEgqbkKRYlM1RU0iF/RV5Menu25RX1PPDhY19qcQ+fTICdJyil76K7NWZ8MyWxVKEjIDt
	 PQ3Df3Yx1YpZpNTwMLgdc1HsvPmttO/goNo5P1ie9diGDnC7qcfW5a6Dw/seKHoX0Qnlz
	 VDwIo3fIBJiwwGz0trortlRXtPUbLN6kAHsM4dK4aWKorgJuG7t+ln5mAgify5wAV+h6V
	 J0qtO5SruestaYsTvwfleug0ZhlcTxUeWyhMJsK05TpeM45MO29x/l7fMlK+Bu0+LZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032843;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=vSBhZbeGE3VX6ynSB31DPcPBMZfKELXkzIaDElyU+Zc=;
	b=sUMs5HyFmP01rntdrtouCdXZF7epgk3iH1qtatut9wINfcG7K4J7U7Fs/WrwffYXkDet
	 1fNVI8CD87mb+5YG6gXJp9CD97Ph8KtOfcuMakVRgCrSSJzRYCXe9dx6/fxplcDVsRt/U
	 sP+Hkz85gujTB4IpfVZhfMXrajqNS7xgfefaoXBldD8LEScPrluJIx9xg46l8d5imys63
	 xFM30ZWK2Wv1HNJHfrwkLRHCr2+xS7F6E8bdr9TzwaAWwkswrzymiwxF251J+ENVMJqye
	 4rCeR8JCFKPN0iTyU6I5r9KR2u/WjiDfFz1TjaDIqKmRxPSXDkc8riW1RY9mxUXdj0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="ERW5y/pZ";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DDF60A3813
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9DDF60A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ERW5y/pZ
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cddac941ed1so641338a12.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032841; x=1795637641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vSBhZbeGE3VX6ynSB31DPcPBMZfKELXkzIaDElyU+Zc=;
        b=CLau65pUVdkgE1A3JPe8CnX+CRhWcIEAUvdm+Xgwat0WFcCkzUAbJ63zPjQAmFBcbA
         1LmseA8sZYvFWEgeZfiSnqgL0EFGo+zPt03/BACTx5NLucKFYgWtK3FsiaTtq7oF/+r9
         Tt5IH969QwySZKmZlnCKRC1Ub9twWVFsZ3VdoL6dDnLrjqC8CFPS2QS6nPi7xdJeXhej
         W0m2jhQMReITW85uBAfYpok1n2XFXr7qghYuneIhvRXhZs6wAzm9tp2nbQSbTKxmcqnb
         i9FTV8r7Z2JfM57IlndykcYN5wIZHufpwwxcmbjpksTF81NrOQoIctrpYYKzUPYa7DD+
         UYjQ==
X-Gm-Message-State: APuU4Z9Q0R8Vh1Z8rvG6DKBAmRj8/jAMfHnuFBwocQqKayyRxbhhFgqw
	biHUY4gGiIXfZlRGre+y5yXpJJ9ISR+B538C0quIf8UP6Hil9p7NqEc051usu8tOIDluny1SiqG
	IASyZPWVYKkJ3ODGgmZ6IDDgK7YSj/X6z7Kon7GVMnyaD3AF4PpxEEbeqivLxBC95wPFFaa7m5e
	sLZLC53Fox6CGizC5Z8pLEIzWHjLMwjiZHv0NJy0QBI52cLIWxyykXnxIDRiaMasj5aJoD8Qe1p
	o0mZBt4f9mEgsb2
X-Gm-Gg: AZFdTZdqVNH4lysZo0EAGmECR1jw/4zSw/+KSF4ojxX5AO3hwrHbWSVPGtrtoO/GfGj
	Tn92DXZ5UqOqslQ7yY0a+Z2jRSCqwZWlffxFRE/T1qivyBSHKvUsLsQORDbCqyZY/neJ3t/WhPh
	7pyJS6GsTbRAr73Odm66Qee4cbjRG7GTUT5nfNrTdx6fdX6I0iLqv4yrMdY9aKoR7tDaXMtH53m
	Xtfkatf3g7IRWcwoKN0apT4FK9EeE3ydfyGiB+HvRlF2tgLWRm8bSQ6LDNtxwauvQ1VJvR42BJ9
	UEoUdhWmzfoo/WET0jmtmbFquX9O2tQCSN7EroG9qyU+Tb/TvmOIocqKtJ5c4UIZ55lVRtkSLh/
	pFyxypZ4168F1lVVxvavDyLjcOmvKhmB1I3feAFTZD/vVElAeK+9FCJJu4oCGv2sCLepXg/g2US
	mWaY0dHa6aYNB2WwkN+5rv5+0S41dH1vLF6vaC3RjRe70=
X-Received: by 2002:a17:90a:ec88:b0:3ac:9925:72ae with SMTP id 98e67ed59e1d1-3b3d07c3f99mr3394003a91.31.1795032841540;
        Wed, 18 Nov 2026 12:14:01 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3f56ee448sm401097a91.0.2026.11.18.12.14.01
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 12:14:01 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-55c644cea0bso28291581cf.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795032840; x=1795637640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vSBhZbeGE3VX6ynSB31DPcPBMZfKELXkzIaDElyU+Zc=;
        b=ERW5y/pZa02HZWFqIP4pk4md7RjaXJOTzIG4miGCEG3WevVGToLUFcHlIRjQuO5Z8g
         /pFHojz/MfA3TfWLBBZHXxEtknBK9OIFVr5wE0aMl0StQ3mQifDYv/YqR3BqGSt5xqam
         gWLLWQgLoQwtzU74USWJJOKhVv8KwtgMOb4E4=
X-Received: by 2002:a05:622a:a0b:b0:55c:cff6:5683 with SMTP id d75a77b69052e-55d5a3087d5mr57400041cf.1.1795032840156;
        Wed, 18 Nov 2026 12:14:00 -0800 (PST)
X-Received: by 2002:a05:622a:a0b:b0:55c:cff6:5683 with SMTP id d75a77b69052e-55d5a3087d5mr57399301cf.1.1795032839284;
        Wed, 18 Nov 2026 12:13:59 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c2a5a2sm7675091cf.21.2026.11.18.12.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:13:58 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Toshiaki Makita <toshiaki.makita1@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	netfilter-devel@vger.kernel.org (open list:NETFILTER),
	coreteam@netfilter.org (open list:NETFILTER),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Subject: [PATCH net 4/4] selftests: netfilter: check the GRE timeout after flowtable teardown
Date: Wed, 18 Nov 2026 12:12:50 -0800
Message-ID: <20261118201250.2075007-5-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
References: <20261118201250.2075007-1-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Add a test for "netfilter: flowtable: restore the GRE conntrack timeout on
teardown". A GRE tunnel between two namespaces goes through a router with a
flowtable offloading the GRE flow. The flowtable is removed, which tears
the flow down, and the timeout of the conntrack entry must be the GRE one,
not the day set when the flow was offloaded.

Without the fix, the entry has 86399 seconds left after teardown and the
test fails. With it, the entry has 179 seconds left, the GRE stream
timeout minus the time which went by.

Add the GRE tunnel and conntrack helper options to the config.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 .../testing/selftests/net/netfilter/Makefile  |   1 +
 tools/testing/selftests/net/netfilter/config  |   3 +
 .../net/netfilter/nft_flowtable_gre.sh        | 137 ++++++++++++++++++
 3 files changed, 141 insertions(+)
 create mode 100755 tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh

diff --git a/tools/testing/selftests/net/netfilter/Makefile b/tools/testing/selftests/net/netfilter/Makefile
index 75d7d4495623..eefc520f3a0e 100644
--- a/tools/testing/selftests/net/netfilter/Makefile
+++ b/tools/testing/selftests/net/netfilter/Makefile
@@ -30,6 +30,7 @@ TEST_PROGS := \
 	nft_fib.sh \
 	nft_fib_nexthop.sh \
 	nft_flowtable.sh \
+	nft_flowtable_gre.sh \
 	nft_flowtable_hw_destroy.sh \
 	nft_interface_stress.sh \
 	nft_meta.sh \
diff --git a/tools/testing/selftests/net/netfilter/config b/tools/testing/selftests/net/netfilter/config
index bf7be95f7d25..5525f05d0eb6 100644
--- a/tools/testing/selftests/net/netfilter/config
+++ b/tools/testing/selftests/net/netfilter/config
@@ -55,6 +55,8 @@ CONFIG_NETFILTER_XT_MATCH_STATE=m
 CONFIG_NETFILTER_XT_MATCH_STRING=m
 CONFIG_NETFILTER_XT_NAT=m
 CONFIG_NETFILTER_XT_TARGET_REDIRECT=m
+CONFIG_NET_IPGRE=m
+CONFIG_NET_IPGRE_DEMUX=m
 CONFIG_NET_IPIP=m
 CONFIG_NET_L3_MASTER_DEV=y
 CONFIG_NET_NS=y
@@ -66,6 +68,7 @@ CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_EVENTS=y
 CONFIG_NF_CONNTRACK_FTP=m
 CONFIG_NF_CONNTRACK_MARK=y
+CONFIG_NF_CONNTRACK_PPTP=m
 CONFIG_NF_CONNTRACK_PROCFS=y
 CONFIG_NF_CONNTRACK_ZONES=y
 CONFIG_NF_CT_NETLINK=m
diff --git a/tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh b/tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh
new file mode 100755
index 000000000000..5efad6908b3f
--- /dev/null
+++ b/tools/testing/selftests/net/netfilter/nft_flowtable_gre.sh
@@ -0,0 +1,137 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+#
+# Check the conntrack timeout of a GRE flow once its flowtable entry is
+# removed. A GRE flow is offloaded with the timeout of its conntrack entry set
+# to a day, which is restored to the GRE timeout when the flow is torn down.
+#
+# ns1 (10.0.1.2) <-> nsr1 (10.0.1.1, 10.0.2.1) <-> ns2 (10.0.2.2)
+#
+# A GRE tunnel connects ns1 and ns2, and nsr1 offloads the tunnel's flow.
+
+source lib.sh
+
+ret=0
+
+checktool "nft --version" "run test without nft tool"
+checktool "conntrack --version" "run test without conntrack tool"
+
+setup_ns ns1 ns2 nsr1
+
+cleanup() {
+	cleanup_all_ns
+}
+
+trap cleanup EXIT
+
+ip link add veth0 netns "$nsr1" type veth peer name eth0 netns "$ns1"
+ip link add veth1 netns "$nsr1" type veth peer name eth0 netns "$ns2"
+
+ip -net "$nsr1" link set veth0 up
+ip -net "$nsr1" link set veth1 up
+ip -net "$nsr1" addr add 10.0.1.1/24 dev veth0
+ip -net "$nsr1" addr add 10.0.2.1/24 dev veth1
+ip netns exec "$nsr1" sysctl -q net.ipv4.conf.all.forwarding=1
+
+ip -net "$ns1" link set eth0 up
+ip -net "$ns1" addr add 10.0.1.2/24 dev eth0
+ip -net "$ns1" route add 10.0.2.0/24 via 10.0.1.1
+
+ip -net "$ns2" link set eth0 up
+ip -net "$ns2" addr add 10.0.2.2/24 dev eth0
+ip -net "$ns2" route add 10.0.1.0/24 via 10.0.2.1
+
+if ! ip -net "$ns1" link add gre1 type gre local 10.0.1.2 remote 10.0.2.2 2>/dev/null; then
+	echo "SKIP: Could not create a GRE tunnel"
+	exit $ksft_skip
+fi
+ip -net "$ns2" link add gre1 type gre local 10.0.2.2 remote 10.0.1.2
+
+ip -net "$ns1" addr add 192.168.100.1/30 dev gre1
+ip -net "$ns1" link set gre1 up
+ip -net "$ns2" addr add 192.168.100.2/30 dev gre1
+ip -net "$ns2" link set gre1 up
+
+if ! ip netns exec "$nsr1" nft -f - <<EOF
+table inet filter {
+	flowtable ft {
+		hook ingress priority 0
+		devices = { veth0, veth1 }
+	}
+
+	chain forward {
+		type filter hook forward priority 0; policy accept
+		ip protocol gre ct state established flow add @ft
+	}
+}
+EOF
+then
+	echo "SKIP: Could not load the flowtable ruleset"
+	exit $ksft_skip
+fi
+
+# The timeout of an offloaded entry is not shown by the conntrack tool.
+gre_entry_offloaded()
+{
+	ip netns exec "$nsr1" conntrack -L -p gre 2>/dev/null | grep -q OFFLOAD
+}
+
+gre_entry_timeout()
+{
+	ip netns exec "$nsr1" conntrack -L -p gre 2>/dev/null | \
+		sed -n 's/^gre *47 \([0-9]*\) .*/\1/p' | head -n 1
+}
+
+gre_ping()
+{
+	ip netns exec "$ns1" ping -q -c 1 -W 1 192.168.100.2 > /dev/null
+}
+
+if ! gre_ping; then
+	echo "FAIL: no connectivity through the GRE tunnel"
+	exit 1
+fi
+
+# Keep sending, the flow needs a packet after the entry is established.
+offloaded=0
+for i in $(seq 1 10); do
+	gre_ping
+	if gre_entry_offloaded; then
+		offloaded=1
+		break
+	fi
+	sleep 0.5
+done
+
+if [ "$offloaded" -eq 0 ]; then
+	echo "SKIP: The GRE flow was not offloaded"
+	exit $ksft_skip
+fi
+
+# The entry has the timeout of an offloaded flow: remove the flowtable, which
+# tears down its flows. Nothing else refreshes the conntrack entry.
+if ! ip netns exec "$nsr1" nft delete table inet filter; then
+	echo "FAIL: could not remove the flowtable"
+	exit 1
+fi
+
+if gre_entry_offloaded; then
+	echo "FAIL: the GRE entry is still marked as offloaded"
+	ret=1
+fi
+
+timeout=$(gre_entry_timeout)
+max=$(ip netns exec "$nsr1" sysctl -n net.netfilter.nf_conntrack_gre_timeout_stream 2>/dev/null)
+[ -z "$max" ] && max=180
+
+if [ -z "$timeout" ]; then
+	echo "FAIL: no conntrack entry for the GRE flow"
+	ret=1
+elif [ "$timeout" -gt "$max" ]; then
+	echo "FAIL: the GRE entry timeout is $timeout seconds after teardown, expected at most $max"
+	ret=1
+else
+	echo "PASS: the GRE entry timeout was restored to $timeout seconds"
+fi
+
+exit $ret
-- 
2.53.0

