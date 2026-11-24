Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531860;
	b=ISbR3VQ+wSrfCxD5SdwRIkoh1nfNQiG0nf0jlTXPcsfw83DRI0Avc0l4YpgFyTSYo6XQ
	 oTqNTbrjtbPTMy7uVzQtZETCiOInF+ipX9mHgDHDqNYM2/G/7aWfNXbgM75FZL4JfcxT8
	 5m727CP1tU5Qi3BlaVrT/Wu2zptrA5FQKg5YAOH4c6Tt7/wxGaiTsEmvDriGBik0w48w6
	 XbtZmr9wGe3tJw5PZ52niCQpgZ3ierVhazkbLP0P8fm2DpqYb1+eeokOelPRpySsTscFu
	 yx/6NTz3ualPVrIstyfeW52fux3UWOM6rz8wzVBGf1SN0qgNvTkGhXsHmb/k/nI5iMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=79SpaxUReZptrl14eHdF+OcZdRpH8w+Xf9jRew5x7Ac=;
	b=dATshnKjEE/deWvq2NRJ51zse9WOjeSClV/XPBnmyCh/RlFef4rJxtkTiuVFFEEJamTN
	 Z8vebegW8PkqwZc3u8FZh+9EoGaSqtnNjcCG5oU36clkoJwp3as8QFwzau+yU/NeEASx1
	 pCBn9synE3dUdN3JmSKODre/syhY74cWJni3ZRIz6bjiqDdbDiHDJcR/+Ezykk3WxgzDR
	 QhvxCJ/3j+AWRRkmjsOdVZm8Np+YSfhbMvAb8fMs77lZYOiRUJRWNSahqy+jSCxaYL2XA
	 J9OWCVnLJ3OW083nySi7Da3w4Mh4Ycd2JA+vweaj9dqVv4i0/0FDU7rinKjD3hetZcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D05FfQz0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD03606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD03606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D05FfQz0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so4834567eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795531859; x=1796136659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79SpaxUReZptrl14eHdF+OcZdRpH8w+Xf9jRew5x7Ac=;
        b=D05FfQz0RIYUbrNq1GnB2VGHRjlkrogWYUSS/XtEPektbtFLl8XUnVQ3tayEhjwK3T
         OVYxmj8d+I2t4eiL7SUzvP7oLh+a3sHU/9XF9ECuO3/s5HfdGgN7u59GtvSHTR0F77G5
         ZY8gLGqfTtwlFFPbT7pBacB1hxEah9zSH5EZEpaCCWVAJX8G9a5No85mPPDmomTyR0Vh
         rnMltiiK2ta3PPbZrQ7kHxJsfS/93OyqvKV3h6sLVlUWm/mEcYIWQfa4BWLaeWiNzVG/
         VprtX8esHquCDiK9mA/RSGC8AEHfzlyvotKDoBAxLcZPW4Sp0ZsG7CYxnJwL69I565V2
         XdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531859; x=1796136659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=79SpaxUReZptrl14eHdF+OcZdRpH8w+Xf9jRew5x7Ac=;
        b=XTD3bOmY2O9ISt4q5q6EWRHVUmmGXOYlfB6cV4qcoja8ZxsqOp4TlLzbR+3EoUZ65s
         pd0osuiJ9iNMWBe6C4usS7K0SIwZGU8NTLojNE7VvszuWpQdBPQ8QJQzILy4cBKOtWo1
         cto4EFz2egI7ibJyIc+TWUDkLnSQKDNXHy5NsJoYf+MEG9tbD5Nen333lG6R7H0JUucB
         GnyZMAdOMIM0AvmDqF0hriCFYvRRfucU5XmYozDdyUiz01ZS5nAT+RQW1ExHwFFZx6zs
         FCXz7GhFAeq+G2t4shKuTQPu3omPhc6AZ8KRBslSiFyQnn5K9snL7jh8rnHMiLYVkYFb
         Ytfw==
X-Gm-Message-State: APuU4Z/n4/h3akqjbItJ/iewP+7NGwNEWKra4VqCx1k0H/Ou09Bgls3I
	sJP1k2tyH9SU5s47asYcaU3N4riWFSpH+WVFVjTjDcKY1XfeDjNiP9GMujCig8DjWAA=
X-Gm-Gg: AZFdTZd22N7a8UjfnlvaanXMdUrArb4fgWNivxrL1XpGTn6PXornsE5WOBjJ0PhNacV
	rCMHagpDQ72xTE1qUxOHsbQoayETCeluxLX9V6xu+9lKeuqXedKO92CN+EQhuGU2njSDu+9smAo
	Lic1PN0aFrUydVb0S/cOrh0dq0t/7dEF5jp19qxIId4uhwok1wKE1R7HKPhMUQu5bszRWRFNIe7
	9b+ChDBz4pF6Emfb/2m87fnLJEWNlUqs2ndu2LM++QAbs28IahmYa9s3YZVKf//+zG6+fsiHdAW
	drOW0RJK9hGUS5V/eA+OTTJ0MQeSqQNANp18srVXUk6udTzJsDH//Ppuqls7mzjyUefoF78WAaN
	FxGiHSf2GE9BISpSqqBv64cURsDdkGhmXegMrj+RWWJVq9uchKfTkyYWQ4WMbotDGmLNx9gjuQl
	x/JHEfg403+9LumAHW1AEXADO7lN1arjsfH5ws9TuPx/tzVLPuRghRWmFdMt1jOWUnkQcIF2wd6
	ol5VKKUhRVAjdkXPfDrkZmD0vvE+oHd1Z318FlpjiFKQlfnEkH0sZnxjKJa9o3P1zd3yAXlajO4
	4rktMWzeTsCa7RMqiCHfmBrM68XpMyWGYmJFA9EMPjzANNTBkxkRY/ezMEwJ
X-Received: by 2002:a05:7301:4201:b0:385:b8f4:755d with SMTP id 5a478bee46e88-385b8f47ad3mr15150935eec.20.1795531859284;
        Tue, 24 Nov 2026 06:50:59 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm20684238eec.18.2026.11.24.06.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:50:58 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	shuah@kernel.org,
	netdev-bot+sashiko@kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net v6 3/3] selftests/net/openvswitch: check that a failed set keeps the features
Date: Tue, 24 Nov 2026 09:50:33 -0500
Message-ID: <20261124145033.627044-4-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124145033.627044-1-houminxi@gmail.com>
References: <20261124145033.627044-1-houminxi@gmail.com>
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

Add a set-dp command to ovs-dpctl for the kernel's datapath SET command,
and two tests that use it.

The first test clears the features of a fresh datapath, sets the dispatch
bit with a valid pid list, and clears them again. It then sends a set that
would set that bit with an empty per-cpu-pids. The request has to fail
with EINVAL, and the datapath has to keep reporting the features it had,
which a kernel that records them before the change reads as 0x8 instead of
0x0. A second request sends OVS_DP_CMD_NEW for that name from an outdated
client, which makes the kernel drop the features, and a further set has
to work.

The second test covers the recirc bit. It sets that bit on a fresh datapath
and sends a set that would set the dispatch bit with an empty per-cpu-pids.
The rejected request has to leave the recirc bit in place. A kernel that
records the features first reads 0x8 there instead of 0x4. A datapath
holds that bit only when the tc skb extension is compiled in, so the test
prints the reason and skips when the kernel answers EOPNOTSUPP, and any
other failure of that request fails the test. CONFIG_NET_TC_SKB_EXT
depends on CONFIG_NET_CLS_ACT and both sit under CONFIG_NET_SCHED, so the
selftest config fragment selects all three.

The reference count itself is not visible from user space, so the steps
that use an outdated client only show that those paths run and that a
datapath keeps working across them.

set-dp sends the features it is given. When --features is left out it
sends the features the datapath reports, and it refuses to send the
request when the datapath reports none. A pid list that is not a list of
numbers is reported as such, and empty entries are dropped.

A failing run deletes debug.log, and ovs_sbx sends a command's stdout into
that same file, so the tests report a failure reason on stderr. stderr
still reaches the test runner from inside ovs_sbx, and unlike a duplicated
stdout it is not a second handle on the runner's pipe. The daemons the
suite starts outlive the script, and one that inherits such a handle keeps
the pipe open after the script exits, which leaves the run hanging until
the harness times out.

Every step that can fail says why it did. A datapath that cannot be read
is reported as that rather than as a feature mismatch: ovs-dpctl prints a
missing datapath and exits 0, and it leaves the features line out when the
kernel does not report them, so the check reads both cases from the output.

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---

  v6: the variables the new helpers pass around are quoted, the help
    text and one message fit in the file's 79 columns, and the note in
    the set-dp branch of main() names the two conditions the kernel
    rejects an empty attribute with: a length of zero, or a length that
    is not a multiple of four.

 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 195 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  74 +++++++
 3 files changed, 272 insertions(+)

diff --git a/tools/testing/selftests/net/openvswitch/config b/tools/testing/selftests/net/openvswitch/config
index 15685d242813..38fa1477b7cd 100644
--- a/tools/testing/selftests/net/openvswitch/config
+++ b/tools/testing/selftests/net/openvswitch/config
@@ -2,10 +2,13 @@ CONFIG_GENEVE=m
 CONFIG_INET_DIAG=y
 CONFIG_IP_SCTP=y
 CONFIG_IPV6=y
+CONFIG_NET_CLS_ACT=y
 CONFIG_NETFILTER=y
 CONFIG_NETFILTER_ADVANCED=y
 CONFIG_NET_IPGRE=m
 CONFIG_NET_IPGRE_DEMUX=m
+CONFIG_NET_SCHED=y
+CONFIG_NET_TC_SKB_EXT=y
 CONFIG_NF_CONNTRACK=m
 CONFIG_NF_CONNTRACK_OVS=y
 CONFIG_NF_CT_PROTO_SCTP=y
diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
index 21444657a040..cdeca5a63671 100755
--- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
+++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh
@@ -24,6 +24,8 @@ tests="
 	nat_connect_v4				ip4-nat-xon: Basic ipv4 tcp connection via NAT
 	nat_related_v4				ip4-nat-related: ICMP related matches work with SNAT
 	netlink_checks				ovsnl: validate netlink attrs and settings
+	dp_features				ovsdp: failed set keeps bits
+	dp_features_recirc			ovsdp: recirc bit survives
 	upcall_interfaces			ovs: test the upcall interfaces
 	tunnel_metadata				ovs: test extraction of tunnel metadata
 	drop_reason				drop: test drop reasons are emitted
@@ -1409,6 +1411,199 @@ test_netlink_checks () {
 	return 0
 }
 
+ovs_dp_features_set() {
+	python3 "$ovs_base"/ovs-dpctl.py set-dp "$@"
+}
+
+ovs_dp_features_check() {
+	local out
+
+	# A datapath that cannot be read and a datapath that reports other
+	# features are different faults, so they return different statuses.
+	# ovs-dpctl prints a missing datapath instead of failing, and it leaves
+	# the features line out when the kernel does not report them, so both
+	# have to be recognised in the output. It prints the value with %X, so
+	# convert before comparing.
+	out=$(python3 "$ovs_base"/ovs-dpctl.py show "$1") || {
+		printf '# could not run ovs-dpctl show %s\n' "$1" >&2
+		return 2
+	}
+	case $out in
+	*"No DP found"*)
+		printf '# the datapath %s does not exist\n' "$1" >&2
+		return 2
+		;;
+	*"features: 0x"*) ;;
+	*)
+		printf '# the datapath %s reports no features\n' "$1" >&2
+		return 2
+		;;
+	esac
+	printf '%s\n' "$out" |
+		grep -q "features: 0x$(printf '%X' "$2")\$"
+}
+
+# info() writes debug.log, and a failing run deletes that file, so a FAIL
+# would reach CI with no reason. ovs_sbx sends a command's stdout to that
+# file too, which is why this writes to stderr: it is the one stream that
+# still reaches the test runner from inside ovs_sbx. Do not duplicate stdout
+# for this. The suite spawns daemons that outlive the script, and a second
+# handle on the runner's pipe keeps it open after the script exits, which is
+# a run that never finishes.
+ovs_fail() {
+	printf '# %s\n' "$*" >&2
+	return 1
+}
+
+ovs_dp_features_expect() {
+	local rc
+
+	ovs_dp_features_check "$1" "$2"
+	rc=$?
+	if [ "$rc" -ne 0 ]; then
+		# The check already said why it could not answer; this adds the
+		# expectation that was not met.
+		ovs_fail "$3"
+		return 1
+	fi
+	return 0
+}
+
+# EOPNOTSUPP is not in the base errno list and its number differs by
+# architecture, so ask python instead of hard-coding one.
+ovs_errno() {
+	local n
+
+	n=$(python3 -c "import errno; print(errno.$1)" 2>/dev/null)
+	if [ -z "$n" ]; then
+		printf '# could not read errno.%s from python\n' "$1" >&2
+		return 1
+	fi
+	printf '%s\n' "$n"
+}
+
+# dp_features test
+# - a set with the dispatch bit and pids is accepted and reported back
+# - a set with an empty per-cpu-pids is rejected with EINVAL and leaves
+#   the features as they were
+# - an outdated new request drops the features, and sets work afterwards
+test_dp_features() {
+	local t="test_dp_features"
+	local dp="dpfeat0"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" "$dp" || return 1
+
+	info "clear the datapath features"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
+	    { ovs_fail "the datapath features could not be cleared"; return 1; }
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "features were not cleared" || return 1
+
+	# 8 is OVS_DP_F_DISPATCH_UPCALL_PER_CPU, the bit that makes the
+	# kernel read per-cpu-pids.
+	info "a set with the dispatch bit and pids is accepted"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids 1,2 ||
+	    { ovs_fail "the set with dispatch and pids failed"; return 1; }
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 8 \
+	    "the accepted set was not applied" || return 1
+
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
+	    { ovs_fail "the features could not be cleared"; return 1; }
+
+	# ovs-dpctl sends the empty list as an attribute with no payload,
+	# which is what the kernel rejects.
+	info "a set with an empty per-cpu-pids is rejected"
+	einval=$(ovs_errno EINVAL) || return 1
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	rc=$?
+	[ "$rc" -eq "$einval" ] || {
+		ovs_fail "the empty per-cpu-pids set failed with $rc"
+		return 1
+	}
+
+	info "the rejected set keeps the features it had"
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "the rejected set changed the features" || return 1
+
+	# An outdated client that asks for an existing datapath again makes
+	# the kernel drop its features. The datapath keeps working.
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 ||
+	    { ovs_fail "the datapath rejected the dispatch bit"; return 1; }
+	ovs_sbx "$t" python3 "$ovs_base"/ovs-dpctl.py add-dp "$dp" -V 1:0 || {
+		ovs_fail "the outdated add request did not run"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "the outdated new request did not drop the features" || return 1
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 || {
+		ovs_fail "the datapath stopped accepting sets"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 8 \
+	    "the reset datapath took no features" || return 1
+
+	return 0
+}
+
+# dp_features_recirc test
+# - a datapath that holds the recirc bit keeps it across a rejected set
+# - an outdated new request drops the features
+# - the bit needs CONFIG_NET_TC_SKB_EXT, so the test skips without it
+test_dp_features_recirc() {
+	local t="test_dp_features_recirc"
+	local dp="dpfeat1"
+
+	sbx_add "$t" || return $?
+	ovs_add_dp "$t" "$dp" || return 1
+
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
+	    { ovs_fail "the datapath features could not be cleared"; return 1; }
+
+	# 4 is OVS_DP_F_TC_RECIRC_SHARING. The kernel takes the bit only when
+	# the tc skb extension is compiled in.
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 4 &> /dev/null
+	rc=$?
+	if [ "$rc" -ne 0 ]; then
+		eopnotsupp=$(ovs_errno EOPNOTSUPP) || return 1
+		if [ "$rc" -eq "$eopnotsupp" ]; then
+			# info() only writes debug.log, which CI does not keep.
+			printf '# no tc skb extension, skipping recirc\n' >&2
+			ovs_exit_sig
+			return "$ksft_skip"
+		fi
+		ovs_fail "the recirc set failed with $rc"
+		return 1
+	fi
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 4 \
+	    "the accepted recirc set was not applied" || return 1
+
+	info "the rejected set keeps the recirc bit"
+	einval=$(ovs_errno EINVAL) || return 1
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	rc=$?
+	[ "$rc" -eq "$einval" ] || {
+		ovs_fail "the rejected set failed with $rc"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 4 \
+	    "the rejected set dropped the recirc bit" || return 1
+
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" python3 "$ovs_base"/ovs-dpctl.py add-dp "$dp" -V 1:0 || {
+		ovs_fail "the outdated add request did not run"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "the outdated new request did not drop the features" || return 1
+
+	return 0
+}
+
 test_upcall_interfaces() {
 	sbx_add "test_upcall_interfaces" || return 1
 
diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
index 1615843c225e..0d56910510ac 100644
--- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
+++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
@@ -2301,6 +2301,25 @@ class OvsDatapath(GenericNetlinkSocket):
 
         return reply
 
+    def set(self, dpname, ifindex=0, features=None, per_cpu_pids=None):
+        """ Send OVS_DP_CMD_SET for a datapath. """
+        msg = OvsDatapath.dp_cmd_msg()
+        msg["cmd"] = OVS_DP_CMD_SET
+        msg["version"] = OVS_DATAPATH_VERSION
+        msg["reserved"] = 0
+        msg["dpifindex"] = ifindex
+        msg["attrs"].append(["OVS_DP_ATTR_NAME", dpname])
+        if features is not None:
+            msg["attrs"].append(["OVS_DP_ATTR_USER_FEATURES", features])
+        if per_cpu_pids is not None:
+            msg["attrs"].append(["OVS_DP_ATTR_PER_CPU_PIDS", per_cpu_pids])
+
+        reply = self.nlm_request(
+            msg, msg_type=self.prid, msg_flags=NLM_F_REQUEST | NLM_F_ACK
+        )
+
+        return reply[0]
+
     def create(
         self, dpname, shouldUpcall=False, versionStr=None, p=OvsPacket()
     ):
@@ -2961,6 +2980,26 @@ def main(argv):
     deldpcmd = subparsers.add_parser("del-dp")
     deldpcmd.add_argument("deldp", help="Datapath Name")
 
+    setdpcmd = subparsers.add_parser("set-dp")
+    setdpcmd.add_argument("setdp", help="Datapath Name")
+    setdpcmd.add_argument(
+        "-f",
+        "--features",
+        type=lambda x: int(x, 0),
+        default=None,
+        help="Datapath user features, defaults to the current value",
+    )
+    setdpcmd.add_argument(
+        "-p",
+        "--per-cpu-pids",
+        type=str,
+        default=None,
+        help=(
+            "Comma separated upcall pids; an empty string sends an empty "
+            "attribute"
+        ),
+    )
+
     addifcmd = subparsers.add_parser("add-if")
     addifcmd.add_argument("dpname", help="Datapath Name")
     addifcmd.add_argument("addif", help="Interface name for adding")
@@ -3057,6 +3096,41 @@ def main(argv):
             ovspk.upcall_handler(ovsflow)
     elif hasattr(args, "deldp"):
         ovsdp.destroy(args.deldp)
+    elif hasattr(args, "setdp"):
+        rep = ovsdp.info(args.setdp, 0)
+        if rep is None:
+            print("DP '%s' not found." % args.setdp)
+            return 1
+        pids = None
+        if args.per_cpu_pids is not None:
+            # Empty entries are typos in a list the user did write, so drop
+            # them. An empty string leaves pids as [] and not None, which
+            # set() sends as an attribute with no payload. The kernel reads
+            # that attribute only when the same request also sets
+            # OVS_DP_F_DISPATCH_UPCALL_PER_CPU, and ovs_dp_set_upcall_portids()
+            # rejects it with EINVAL when its length is zero or not a multiple
+            # of four; the selftest sends the empty one and expects that.
+            try:
+                pids = [int(x) for x in args.per_cpu_pids.split(",")
+                        if x != ""]
+            except ValueError:
+                print(f"invalid per-cpu-pids: {args.per_cpu_pids}")
+                return 1
+        features = args.features
+        if features is None:
+            features = rep.get_attr("OVS_DP_ATTR_USER_FEATURES")
+            if features is None:
+                print("DP '%s' does not report its features" % args.setdp)
+                return 1
+        try:
+            ovsdp.set(args.setdp, rep["dpifindex"], features, pids)
+        except NetlinkError as ne:
+            # args is (code, message) for the errors pyroute2 raises; anything
+            # else is still worth printing rather than raising IndexError here.
+            msg = ne.args[1] if len(ne.args) > 1 else str(ne)
+            print("set failed: %s" % msg)
+            return ne.code if ne.code > 0 else 1
+        print(f"DP '{args.setdp}' updated")
     elif hasattr(args, "addif"):
         rep = ovsdp.info(args.dpname, 0)
         if rep is None:
-- 
2.56.1

