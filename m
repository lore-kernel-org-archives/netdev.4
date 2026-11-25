Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617936;
	b=mBSNRDblxhCmlINPuTp65LZuv3e/SATJIr6GZzbP7JIXvgxga9T6/vALaUU0I65T/bVm
	 bvEohSwsJilLSTwimuqYaTizOzD17+4W596r4Px48eEWxbcNc5fCQdKK2Q8XDMOMhUgJR
	 qHvzwdidL7FsmLo1TQE2f4Ekig4S42SmnXKMfmA74N8l4WMaTOoQsvu39963Mkg2DkLWq
	 sPolQ1wRkOd6X/gakUy2xF2U1UnRCYc3Tp3DMMB5ns8wo+CA3dAoo0VgNnM5xYnicghLP
	 o/RjwTeFLXy0BnXNUjJL5+0y/9RIfYRiWjshcqA10cQAbe3rNq/hcv6sogTIkdD6fkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KLKc3B4osYNTD9bs/JhYAcZWnzt4jgwzPUA+YoQpf1c=;
	b=pn5spkubYDrY30iG6mJcuOZL9XEINoJxYCd70bVq2yGaxZ3kQ4fJH2t6bvIVXiCZ0/Lv
	 FwBvsRmZecSEgDDJl7FqW0HQt+BjfUX/bl7k/kI+p7hXScuLjDZHCu5R87ARfS+AdEMes
	 KZGKPcvE+Jv5GCvqEpcub/iFeY34bipQBmMPfE1n0Jzs+NdH7B1BUjHdk+IGPeWm92QDH
	 D10urbbiLw1mPF17h8TbIu90DWMlKZ10rm8McbGOSXA5ghUMyZIrjillXbtr+gqoAZuhD
	 0wJWNFKyUTaGa7wziqT/axSYLm+cDPwIdiZnUWa0jtHvAnxm2ZKBKxVPorCMApqkdew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQcqIh0M;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2B3606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE2B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lQcqIh0M
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so139143eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 06:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617935; x=1796222735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLKc3B4osYNTD9bs/JhYAcZWnzt4jgwzPUA+YoQpf1c=;
        b=lQcqIh0M5fwQWmXE8dKaX0YfqfTxiEmLt7Bs1xCMdipc/+cGkDgGJV6vaFvoojUQMS
         ZXL19SO1HuLzliCP5Qua3JvjIzzVRmLSoUyG23VirQkWiSqMbINs5yv4AOc5pMUf1n9b
         IphvKJbzM36L7sAsU56FOVnfA8QADUB4Zor94cblYZi3UfW7ru613GriG9chjOCcdv3o
         p+VhKyp6UcX7eFc4sXW0XPChIM12VhWyh6vw4XeJfTScyqPsIIJpSSPWMgAcsnz9wW1s
         /B7tuInKHfo3HZLTX0qyy6af6J2v4xURI+quk28m25zqvaj8M5QXFvA2hBlN6vS0kr9s
         aunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617935; x=1796222735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KLKc3B4osYNTD9bs/JhYAcZWnzt4jgwzPUA+YoQpf1c=;
        b=q4lGSMSEJOdyHr5Zq+jNENaYd2oDDu3lkgZAIkGMEkAtBRsnwF2/sCHiJRFt/9sWa3
         aDmAjNeagZtc6SDaIqA+cEZA9kX63+FvvKSgHDxiHEONB1wI0g8KpkqbL8eSg3PyIHdL
         e9cPxbC9Iz2zyWF5oj6wiPccGXmW19H2vzr9EmlXOTpdOXq/cVET7cniqzZPF4j0NBdA
         09RKMM2SO/FUIKOgAO0bZvcW9DzFZwzbFIgsCXwB1W1Emr7ptg3V1dYTN8GkyR8rH29u
         kX6dZKcKlXIdiRQtwOxYsACIGzu4UnwcyRgcTNCyqwWK3Gxr4noQI8wHzK5bzm6Ce8Fm
         Ttpg==
X-Gm-Message-State: APuU4Z+4ZALjjDSGbOdFC/MtbRYEd3GYcfc/qZ+XivHrGtRO/x7w55St
	0x1BXH7u/wlrOak9hkCpTX4rk9MPpKbztvtb9rLwfDYt31qDlD3JjPiid+wp9Q==
X-Gm-Gg: AZFdTZeWISBf3SxikDIIPVv8wwrqJLOcGzdG+ASTizNkf7hiFlIiHDPRQfmYYsYxTVE
	Jh3DwKODIpIZeLY8cIE3zUj9VPihR9+eA+P1xfBDSq1AMuztSPoyDeoFTSom+DtyQVQlJzDLzQF
	aTq5vjiKKfRfpEjfIFU5EgVaj8N/Ly5PMYd/5VTUFDIg+PmwnpPrYOqcWsVKmLHDxo6SW+JEHMT
	klDyBnap/Fl4Az4fKFxFF66P47ZhkfSQ+yv/FvuoVxZudel5rblbGnu+t+A4VHT7TeIzQfjxHcw
	BXaRcAMa/uIxyYhuUNuuZ1RDGguBUPPnVTLE3CEMULnGEp87NSpa6CyeGFN8zIGE9rP7HMnotOQ
	DiDX4Lzhj/YOlhFpyDFuYLS53V/3wT7/2qcNujj/4o8koHaUvTZ52o9DW1gBrdFsSZBYsm5/mju
	Y9nPktXL7+pT6e89dTeaKmtFd4TkkOykxzXWNMBTKXtWnmUIzYIiDvXjNZm86y3aTWn0wKcWQIs
	6cjdbpWfKrL7wsZc80aPO9uE/x+jcxVSCMCzhaF7u/h9hgFYVBWvDx9zQs8t7Qm0Tvg5RmxnCwi
	YFrWM7AHEVtv99exqD3reN3YIcQaqZVvG7h1p30mm5/R/AOjEEUqa0ya+II4DVMjE/xNvAJZoRm
	SUMLArE7hLGf/zrEG0dR7/56sHUt0++/WdnILPP/EYzbD142dPaCEpeeTXV08L4zZMkqghevQ3Y
	OJYawoEVmfxSk7sbkggeQ=
X-Received: by 2002:a05:7301:6405:b0:37a:cafa:6d78 with SMTP id 5a478bee46e88-3856ff54addmr21142074eec.33.1795617934647;
        Wed, 25 Nov 2026 06:45:34 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57121181eec.28.2026.11.25.06.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:45:34 -0800 (PST)
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
Subject: [PATCH net v9 2/2] selftests: net: test joining genetlink groups no family owns
Date: Wed, 25 Nov 2026 14:45:14 +0000
Message-Id: <20261125144514.2717012-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
References: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
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
  after drop_monitor is loaded. drop_monitor is unloaded again at the
  end. Skipped when NET_DM is already registered or drop_monitor is not
  available.

The free IDs are found with a family dump, which only lists the families
of the current network namespace, so these checks are skipped outside
the initial one. It is found with its fixed nsfs inode number, which
also works in a container with its own PID namespace.

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 128 +++++++++++++++++++
 2 files changed, 129 insertions(+)
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
index 000000000000..8bbe3d22225c
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,128 @@
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
+from lib.py import KsftSkipEx, NlctrlFamily, NlError, cmd
+
+NETLINK_GENERIC = 16
+SOL_NETLINK = 270
+NETLINK_ADD_MEMBERSHIP = 1
+NETLINK_LIST_MEMBERSHIPS = 9
+# include/uapi/linux/nsfs.h
+NET_NS_INIT_INO = 0xEFFFFFF9
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
+    if os.stat('/proc/self/ns/net').st_ino != NET_NS_INIT_INO:
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
+    try:
+        with _sock() as sk:
+            sk.bind((0, sum(_bit(gid) for gid in free)))
+
+            # Looking up the family loads drop_monitor.
+            try:
+                ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
+            except NlError as e:
+                raise KsftSkipEx("drop_monitor is not available") from e
+
+            if not any(gid in free for gid in ids.values()):
+                raise KsftSkipEx("NET_DM got no group ID that was free")
+
+            for name, gid in ids.items():
+                ksft_eq(_members(sk) & _bit(gid), 0,
+                        comment=f"member of NET_DM {name}")
+    finally:
+        # So that the next run can load it again
+        cmd("modprobe -q -r drop_monitor", fail=False)
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

