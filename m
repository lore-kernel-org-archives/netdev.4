Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449324;
	b=hjwb7wqTdo1bvKRwZ7wrytZcrOHOGVSnFQy70mrZETuI6DF8NS+98+XpqP7Ygz/cQCNw
	 PhtKTPe93Z1KUiFss8XYUO/aH23Buyb6cW+5mcRq7nn/GghVV+dmfJvYtMQTZbzsXrnNT
	 8yFf9yB2Rr20jB0T1LsCHZRH3xVGj+nLflgJwObIeiLCbg/uKadiUQMsyKKtkpJc5iOL8
	 hja+wi/77sBR/Sqwuln9lAnunRKYDMYnRlxp1T++p98A9b7AK/2/dKg/c9MId1JoPihoA
	 +janPhF8p+CmUkH7xrvnfw0vb71sqFHLfXyVHUM8OEnHuEyuD8kPnIT1ec6D+P4avzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449324;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
	b=NtsSgga4qophjl6nVWZngphQVReXKsJ9ZySZtXqQH2ybd1S6PeZj2/b/8mcEg1Ui4GGo
	 tnmFZkbLCN2ButEVPuvnqfeSCCzmwnxSc1WWfw1YZaz+zM4G7Ck0eTMguoda8TF7p75Cj
	 5Axe0KFSKCR4WRCADwbarSVrxaf98Wk2B6xBK00jOMyK5US3qTmgs/IcIh902TPoth/0V
	 Rz9pzhHI0MobT37JplB3tcjiZAg4EU6TcTpEsnZewav6tvR9eTqMepSuP2qTa28KMggwF
	 XRRavlr8PwH4SxU5mbUvXzJJ1VJv/tNtiva7sYGTgsIDukhM38glL4SqY9s7lw+gCxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkIsuT2y;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC738606A32C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:55:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC738606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LkIsuT2y
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3869f03af6aso2575224eec.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449323; x=1796054123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
        b=LkIsuT2yOR+IXm0ZQBfc2/Lid/L3sxGAL+rGlx1baRLc+zQ6e6kcSQDDdVg/533Qpa
         x3Mg+nJObzSsZ+fdtHifBu8C5Djl7eWc9dLmvzHriCa46CUE5IlgsnHOXI4DYlFbZjeM
         oZQkuz1X1QNE65NHu2OMiNlg/afD6ViJV+Rjh1eqKA+7LrWCF5kLlRr5fWBNTcyZktb4
         NuSHlnWuAlaIheWzkFhQkry1UGFoPUMGQfDbg0OdS2Y9pIWTQroWwVog47EKGuTeOmfJ
         2B9fAT1ZN42eB9NGE4H9cigA9wswXOGzkyaZAIYmsXl9LWsVf59IU/+Xb/jqrjz16Ryz
         sDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449323; x=1796054123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvgo8UOeGR3ceD1ujQM14AUV662Pec2r3lgrSGrnkwU=;
        b=cs8t0P3JFwUDQz19WBTFEyNsr031gidqccN4Qw19tD7kTHYiMClgUAd6f5LLhK/uJS
         pv5jjyYBTd6hQI/xb1wRyHbsELok+of63eg6Jxx9BxpmQGxsGMd0lNc/m8auxWN3oBHn
         Ho/nSfokrZ6OxPIvd301J5e55r7ekKxkYVfIzO8mGCJu/XMN0yrV4Z+ZgcM3ztQBWZsu
         1dbv48zNfAcMThLi0fGBI4ypBQhp7tZJkkIFeBIBMVJ9qTXDVkNTdcsDM0Nz1ZR/lPuN
         2Mb5iap/A7zXkOsPw0hz9bfaaZH2bzs0RAl1bwW84EU/3+LiV/Rv/Zyb7UuNkwBdDP2Z
         Lk0w==
X-Gm-Message-State: APuU4Z/JoUhclkj/FEfp4dYgTW3fZAPaGm9Tr+RCcBAsC/9nKERAwFh+
	t1MhVx03rPpWcxEpgpsDCRCYm/jKX0iAWwx0wtPE9N0EsFsHv0RB1XOy9WvaUQ==
X-Gm-Gg: AZFdTZcpalEbLpduDKBrhLfMXeGIu1GtKPJK8M6lkuzWZ0C6LMvNODSZlFk0I3KianH
	30YFLRcuO//g6ssgDTdwTpL17H0UAzAn6byT7LbGb799VHCPQ4Ran8uno2rQax4tY/tAQ/6BrA3
	4XzhjFKkx4PonviULR8ZocvpgXJ0etkm3JdQ33KDTnLrWU0q8DPTAZrVgnwJ4mPHm/vs+/leXTf
	sjiFlWDEwoV2oyng6Qp8rfU7cgQ/BQvKwknv9XpQgSL7AZWukQAOyYkY2K22cSxIwlAg8mEQuw+
	HeruDN9QP52Yz1TJSwVa20NP2eApewMVrvdSFEfrBUnALqCRaqJBpkry2u86j6NQAPMw2wc2bGV
	Nl110cHFoOnCqFE4cK9/iLuYYOgFuh9CpN+lFTGh5ue635LxmnndMWoz6sE9y+inP0VwMXrFN2o
	J8PlQffjHzTU2Z6ft9eyNSLqy7KO9NOuTxSBHmsE0MXk0O5HNtt6DS6MmDNGaIgcF8lzbKZ2WgT
	xawbNILuE7iZr9E0VZwwSgMhmxFees4/uT6QFXISHf1nyFE3MA6drUED6WN381zJ2UPl8QxPX/t
	F0UcprF7A5TI8toswq1tJ8EjHSyS6I6PzkkM7rsxoUVzKjMiBES8GYxqjpE9Imr2vAHBRGs7fKd
	irpLspO4QgpcElSS5z+Q1/AQcH4v7lmS9r61mg1cxFzqRa9lFmXi8l/zsxUFfMcPe16PMDG5Qc1
	8=
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr7555478eec.10.1795449322783;
        Mon, 23 Nov 2026 07:55:22 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:22 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v8 2/2] selftests: net: test joining genetlink groups no family owns
Date: Mon, 23 Nov 2026 15:55:03 +0000
Message-Id: <20261123155503.2497063-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
References: <20261123155503.2497063-1-anilkaushikwireless@gmail.com>
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

Check that a Generic Netlink group ID no family owns cannot be joined:

- setsockopt(NETLINK_ADD_MEMBERSHIP) on a free ID fails with ENOENT,
  and still works on an owned group.
- bind() with a mask of free IDs succeeds and joins nothing. With an
  owned group in the mask, it joins only that group.
- A socket bound to the free IDs is not a member of the NET_DM groups
  after drop_monitor is loaded. Skipped when NET_DM is already
  registered or drop_monitor is not available.

The free IDs are found with a family dump, which only lists the families
of the current network namespace, so these checks are skipped outside
the initial one.

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 127 +++++++++++++++++++
 2 files changed, 128 insertions(+)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index baea3e7f0f8f..875ce0443814 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -74,6 +74,7 @@ TEST_PROGS := \
 	netns-name.sh \
 	netns-sysctl.sh \
 	nk_qlease.py \
+	nl_genl_mcast.py \
 	nl_netdev.py \
 	nl_nlctrl.py \
 	nsh_gso.sh \
diff --git a/tools/testing/selftests/net/nl_genl_mcast.py b/tools/testing/selftests/net/nl_genl_mcast.py
new file mode 100755
index 000000000000..4e86a5556b62
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,127 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Tests for joining Generic Netlink multicast groups that no family owns.
+"""
+
+import os
+import socket
+import struct
+
+from lib.py import ksft_run, ksft_exit, ksft_eq, ksft_raises
+from lib.py import KsftSkipEx, NlctrlFamily, NlError
+
+NETLINK_GENERIC = 16
+SOL_NETLINK = 270
+NETLINK_ADD_MEMBERSHIP = 1
+NETLINK_LIST_MEMBERSHIPS = 9
+
+
+def _groups(fam):
+    """Return the multicast groups of a family as {name: id}."""
+    return {g['name']: g['id']
+            for grp in fam.get('mcast-groups', []) for g in grp.values()}
+
+
+def _free_ids(ctrl):
+    """Return the IDs in 1..32 that no family owns."""
+    # Outside init_net, the dump skips the families that are not netnsok,
+    # but their groups are still owned.
+    try:
+        netns = os.stat('/proc/self/ns/net').st_ino
+        init_netns = os.stat('/proc/1/ns/net').st_ino
+    except OSError as e:
+        raise KsftSkipEx("cannot check the network namespace") from e
+    if netns != init_netns:
+        raise KsftSkipEx("not in the initial network namespace")
+
+    owned = set()
+    for fam in ctrl.getfamily({}, dump=True):
+        owned.update(_groups(fam).values())
+    free = [gid for gid in range(1, 33) if gid not in owned]
+    if not free:
+        raise KsftSkipEx("no free group ID in 1..32")
+    return free
+
+
+def _sock():
+    return socket.socket(socket.AF_NETLINK, socket.SOCK_RAW, NETLINK_GENERIC)
+
+
+def _members(sk):
+    buf = sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64)
+    # An array of u32 in host byte order
+    words = struct.unpack(f'={len(buf) // 4}I', buf)
+    return sum(w << (32 * i) for i, w in enumerate(words))
+
+
+def _bit(gid):
+    return 1 << (gid - 1)
+
+
+def _notify_id(ctrl):
+    return _groups(ctrl.getfamily({'family-name': 'nlctrl'}))['notify']
+
+
+def join_free(ctrl) -> None:
+    """setsockopt() on an ID no family owns fails with ENOENT."""
+    with _sock() as sk:
+        sk.bind((0, 0))
+        for gid in _free_ids(ctrl):
+            # ENOENT
+            with ksft_raises(FileNotFoundError):
+                sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, gid)
+
+        notify = _notify_id(ctrl)
+        sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, notify)
+        ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_mask(ctrl) -> None:
+    """bind() skips the IDs no family owns and joins the others."""
+    free = sum(_bit(gid) for gid in _free_ids(ctrl))
+    notify = _notify_id(ctrl)
+
+    with _sock() as sk:
+        sk.bind((0, free))
+        ksft_eq(_members(sk), 0)
+
+    with _sock() as sk:
+        sk.bind((0, free | _bit(notify)))
+        ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_before_family(ctrl) -> None:
+    """A free ID joined with bind() stays unjoined when a family takes it."""
+    names = [fam['family-name'] for fam in ctrl.getfamily({}, dump=True)]
+    if 'NET_DM' in names:
+        raise KsftSkipEx("NET_DM is already registered")
+
+    free = _free_ids(ctrl)
+    with _sock() as sk:
+        sk.bind((0, sum(_bit(gid) for gid in free)))
+
+        # Looking up the family loads drop_monitor.
+        try:
+            ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
+        except NlError as e:
+            raise KsftSkipEx("drop_monitor is not available") from e
+
+        if not any(gid in free for gid in ids.values()):
+            raise KsftSkipEx("NET_DM got no group ID that was free")
+
+        for name, gid in ids.items():
+            ksft_eq(_members(sk) & _bit(gid), 0,
+                    comment=f"member of NET_DM {name}")
+
+
+def main() -> None:
+    """ Ksft boiler plate main """
+    ctrl = NlctrlFamily()
+    ksft_run([join_free, bind_mask, bind_before_family], args=(ctrl, ))
+    ksft_exit()
+
+
+if __name__ == "__main__":
+    main()
-- 
2.25.1

