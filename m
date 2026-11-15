Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760319;
	b=M28PDArIHmmul+T/p2c8TJaXd56Tax7N8Q+faALO4+px2SIK7O8y7dIugH3jmJchBouh
	 Q5UcoYrgiiwhVMwS60TuPgDrBRPnhcBtco5ruRKYBDa1f5ALCeQv/b64teJtUdOq6eAP3
	 4cVRDzejasf+9CFzjEs5ueiOt5JmNZtMDxy+dA0CqLHfj45iUPd7ci+gp1a3GjqgIKa2n
	 53GccUVYOdXD2YU4aF8Ox8X+vk5lWXkNBGnKgJXpGDwPO86lnVKUcwfaqvc6BUbe37utC
	 I7ls2pt/r8fXXBKyFZVqL1/3+NBFbT5oEg3O9SJ7nDX+mztLeKrr4NeBlRND5dHTq/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MUJSvVP7LEz8fYGv9nEpVgaQTe1si3u9N7fYat0z0xE=;
	b=otZg0rrFYl4L4NMN7Ncc1iG+nbt3Ti7TRIeqS5B9E5UytMqSqpEJJbG9I2Pwz8FKEAt9
	 BN+lRh4pGQOkqK5d134YRmHizaieXrEUYJh8pQNlcbKl//+rMj7EMJ3+RtscRP2EqhPhm
	 m1VeIoWb8px3nbGe6lkRfpNdx5/oBFDZEHKhqb4fagMsFggJuZAs5TecqC54nhVqt5QhH
	 ZsFQLA10LcyrHHSaMTGFIcnw+lhDVjzdCjvtF4vjX4Wuh6Dbde/Xxjmiog+A3wJhKaaQ4
	 KKiaVgkLwZN65BYV1nM3UrcxTWUUeToTO+ut5svwG8u6wFerLAXFSghZxd3SaP1vxHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlTkUuDL;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7160B606A327
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 16:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7160B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VlTkUuDL
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37600b0db49so3264904eec.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760318; x=1795365118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUJSvVP7LEz8fYGv9nEpVgaQTe1si3u9N7fYat0z0xE=;
        b=VlTkUuDLMednBLS9B4dak+VN8na/29efZ8tAshLILu/RhLHPX4x6ZdHfvY8ctu/nTX
         KfxMqJDsEZqiDPXZ0wI4xkiGeWC249iTux6y+j6Jq13jjYzo/NtF6L8UJ8dDPtn7QmxT
         hjFUJTqjZMmzcDbDhYtQmv3/Lhzys3AVWGFocADWkd7XogpMKULIW6AEqUuOsNu3ysU9
         XR9v/bbw5we7+KMe/KUtEYXzTRi6NFigQ7LMEGuscbGjSCMc+CwhGXU4fJQWNzNiF8ej
         Ht0Ma3kYF/2VyiQdon+5cdzpY+LrHEBcoRh5jBvRbcgw5M6UyR1BxCkHDMvE+Vfjoo2R
         0nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760318; x=1795365118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUJSvVP7LEz8fYGv9nEpVgaQTe1si3u9N7fYat0z0xE=;
        b=YlJGgDwymbNVW3BfaWzAtn+Wk+KoIBG+FEoQlMySVMmHy0GS8AyPGpdz7Kv/D+SumO
         AbQoN+C3GhBfYkwOvqD/4hU5UntofGoQNhnOad3yiMeP8bZnuvxlQUBNdSXJrgIut8PJ
         7CQXpbJes5u+MIw/OFQy6T0Hb+N31b05GynhvneIr5RqOYO6MsuIAQb5ExYdfCyKq5mT
         okcXsPv3yYKgfI6PmSAsZlVTG1yTEn4gMGfEP9CrrIYvm66DXVSF0vuJ70hufbKoR5vi
         7ZqZvHEMT5KJJKCpFVgJogsE/CrTf1zKJWWKJ2azPl/TzuuxEvuPVAYeuv0tP6n2GTnR
         XaBQ==
X-Gm-Message-State: APuU4Z9s1zUHjb/G0PYXOnRXEHkGYMoYt96bmlfiSLdmcTLpbWJc9WYh
	9pu6rfaeRb0mVTgdTreAYe1Di5wZuI6YTotS6p3XqPXKA4NrVKvCetEVKZv3K1em
X-Gm-Gg: AYBFou2QrspnaxwEMkItz2BFWrXzM8WGi+kLJwGHe3PqIczGE8suBUTRi3zQ3DpMJoR
	yihcojqN2d5FQtn3VZ3YkWmz1IhWi2P62sSmMD1jYubmbkbluhuOOviwge7JrWzXPGLJ571V476
	uRqJIBEf2hG3chl76ZapXisvb604VBWmYbx3eV0aRFz7PUe+hskXuTLa5ffjHMgi97TvZO7fEB1
	dxJel1AS4GJAP3I6RZ7H9zZJumw3xAz6T0Zp8GVOPnPrXHfe3IxPb6Nm8tr0GQjAN07++TvrpkR
	T8RSzC5l3yybhVTyju8+smJ8E3xXpjSVZWHYE9Z/mSW5dNqiRSSb+6Z4oGEwDpShyMLAZRDY+X1
	8lmrr7HkUa2tznbM207oMI0q6oh9WAHKikkNgz+qLypurnu/rC+D9T60FU3YfHt+a219wClaMsK
	wmSxz3HHuBzT8/em8UvjS4N5Fq8DJ1L4NaG6R2F1+s4xak2/Ye3bs3eup9FW2xV5bMHXDmUB7hX
	+iWX/eNid0GPn1AWJaUfZy7J/KL9av3BdmqTuM+xRkUn61Mm7J97Byb77rz8YBxRfKwgWWQ4hI4
	9IiQuBI9D3z0kSkGFpMkYSx8
X-Received: by 2002:a05:7301:1887:b0:36d:6a77:960a with SMTP id 5a478bee46e88-37963564b9fmr7366228eec.1.1794760317291;
        Sun, 15 Nov 2026 08:31:57 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm27775320eec.28.2026.11.15.08.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:31:56 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Minxi Hou <houminxi@gmail.com>
Subject: [PATCH net v4 2/2] selftests/net/openvswitch: check that a failed set keeps the features
Date: Sun, 15 Nov 2026 11:31:34 -0500
Message-ID: <20261115163134.3202677-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115163134.3202677-1-houminxi@gmail.com>
References: <20261115163134.3202677-1-houminxi@gmail.com>
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

Signed-off-by: Minxi Hou <houminxi@gmail.com>
---
 .../testing/selftests/net/openvswitch/config  |   3 +
 .../selftests/net/openvswitch/openvswitch.sh  | 173 ++++++++++++++++++
 .../selftests/net/openvswitch/ovs-dpctl.py    |  61 ++++++
 3 files changed, 237 insertions(+)

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
index 21444657a040..559c25d51099 100755
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
@@ -44,6 +46,11 @@ info() {
 	[ $VERBOSE = 0 ] || echo $*
 }
 
+# ovs_sbx sends everything a command prints to debug.log, and a failing run
+# deletes that file. Keep a handle on the real stdout so a failure reason
+# still reaches the CI log.
+exec 9>&1
+
 ovs_wait() {
 	info "waiting $WAIT_TIMEOUT s for: $@"
 
@@ -1409,6 +1416,172 @@ test_netlink_checks () {
 	return 0
 }
 
+ovs_dp_features_set() {
+	python3 $ovs_base/ovs-dpctl.py set-dp "$@"
+}
+
+ovs_dp_features_check() {
+	local out
+
+	# A show that fails and a datapath that reports other features are
+	# different faults, so they return different statuses. ovs-dpctl prints
+	# the value with %X, so convert before comparing.
+	out=$(python3 $ovs_base/ovs-dpctl.py show "$1") || {
+		printf '# could not read the datapath %s\n' "$1" >&9
+		return 2
+	}
+	printf '%s\n' "$out" |
+		grep -q "features: 0x$(printf '%X' "$2")\$"
+}
+
+# info() writes debug.log, and a failing run deletes that file, so a FAIL
+# would reach CI with no reason. Say it on stdout instead.
+ovs_fail() {
+	printf '# %s\n' "$*" >&9
+	return 1
+}
+
+ovs_dp_features_expect() {
+	ovs_dp_features_check "$1" "$2"
+	case $? in
+	0) return 0 ;;
+	# The check itself reported that it could not read the datapath.
+	2) return 1 ;;
+	esac
+	ovs_fail "$3"
+}
+
+# EOPNOTSUPP is not in the base errno list and its number differs by
+# architecture, so ask python instead of hard-coding one.
+ovs_errno() {
+	local n
+
+	n=$(python3 -c "import errno; print(errno.$1)" 2>/dev/null)
+	if [ -z "$n" ]; then
+		printf '# could not read errno.%s from python\n' "$1" >&9
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
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "features were not cleared" || return 1
+
+	# 8 is OVS_DP_F_DISPATCH_UPCALL_PER_CPU, the bit that makes the
+	# kernel read per-cpu-pids.
+	info "a set with the dispatch bit and pids is accepted"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids 1,2 || return 1
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 8 \
+	    "the accepted set was not applied" || return 1
+
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1
+
+	# ovs-dpctl sends the empty list as an attribute with no payload,
+	# which is what the kernel rejects.
+	info "a set with an empty per-cpu-pids is rejected"
+	einval=$(ovs_errno EINVAL) || return 1
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 \
+	    --per-cpu-pids "" &> /dev/null
+	rc=$?
+	[ $rc -eq "$einval" ] || {
+		ovs_fail "the empty per-cpu-pids set failed with $rc"
+		return 1
+	}
+
+	info "the rejected set keeps the features it had"
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 0 \
+	    "the rejected set was recorded" || return 1
+
+	# An outdated client that asks for an existing datapath again makes
+	# the kernel drop its features. The datapath keeps working.
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 8 || return 1
+	ovs_sbx "$t" python3 $ovs_base/ovs-dpctl.py add-dp "$dp" -V 1:0 || {
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
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 || return 1
+
+	# 4 is OVS_DP_F_TC_RECIRC_SHARING. The kernel takes the bit only when
+	# the tc skb extension is compiled in.
+	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 4 &> /dev/null
+	rc=$?
+	if [ $rc -ne 0 ]; then
+		eopnotsupp=$(ovs_errno EOPNOTSUPP) || return 1
+		if [ $rc -eq "$eopnotsupp" ]; then
+			# info() only writes debug.log, which CI does not keep.
+			printf "# tc skb extension is not compiled in,"
+			printf " skipping recirc\n"
+			ovs_exit_sig
+			return $ksft_skip
+		fi
+		info "the recirc set failed with $rc"
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
+	[ $rc -eq "$einval" ] || {
+		ovs_fail "the rejected set failed with $rc"
+		return 1
+	}
+	ovs_sbx "$t" ovs_dp_features_expect "$dp" 4 \
+	    "the rejected set dropped the recirc bit" || return 1
+
+	info "an outdated new request drops the features"
+	ovs_sbx "$t" python3 $ovs_base/ovs-dpctl.py add-dp "$dp" -V 1:0 || {
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
index 1615843c225e..ee3b69a6fe19 100644
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
@@ -2961,6 +2980,23 @@ def main(argv):
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
+        help="Comma separated upcall pids, an empty string sends none",
+    )
+
     addifcmd = subparsers.add_parser("add-if")
     addifcmd.add_argument("dpname", help="Datapath Name")
     addifcmd.add_argument("addif", help="Interface name for adding")
@@ -3057,6 +3093,31 @@ def main(argv):
             ovspk.upcall_handler(ovsflow)
     elif hasattr(args, "deldp"):
         ovsdp.destroy(args.deldp)
+    elif hasattr(args, "setdp"):
+        rep = ovsdp.info(args.setdp, 0)
+        if rep is None:
+            print(f"DP '{args.setdp}' not found.")
+            return 1
+        pids = None
+        if args.per_cpu_pids is not None:
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
+                print(f"DP '{args.setdp}' does not report its features")
+                return 1
+        try:
+            ovsdp.set(args.setdp, rep["dpifindex"], features, pids)
+        except NetlinkError as ne:
+            print(f"set failed: {ne.args[1]}")
+            return ne.code
+        print(f"DP '{args.setdp}' updated")
     elif hasattr(args, "addif"):
         rep = ovsdp.info(args.dpname, 0)
         if rep is None:
-- 
2.56.1

