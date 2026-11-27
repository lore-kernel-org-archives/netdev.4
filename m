Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749789;
	b=3qtX6HC61H58IYE6kDnBsf2eOKvs5oNUWxXfb1k5GRvQTSHlpAFvnse99cjHis83hA/M
	 gLQ/2tamm++x++vuwoOCSN+DSod97KMOw8TF1ESkr4Rd25X/zsbUIgGIuyESRlqCxuK5T
	 yCqsNIUBJBi/z7R8FbTyshXp8hpznT/YDPzf4lklUc0LxLdqDhqDsZuGQkIXF4gI5P+/I
	 BneK8NZChnbTbgdbZFVTZakViSUakyuEs5aUFMk5FyNZ5Rv71lwFq5wX5Fta3eII+hM+X
	 yBI5J7kY+dqW3jZaK7URK7aAoNGUeptfAOPoGsAruDrKvqhG4fzp+O8c+QftF10YHuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=skeWlY9qqzvD2S0y6NSVBgm7gug5B6mxGigPdEgMeRg=;
	b=At6+A7fk0qwPaZ3oE30GuuGsh2gtt4NXHcA5JVz+1a6Iz4xMVDSM4mn/GSsn8IQ/RhvN
	 GHTsX2b/VsMmKxpCQmLzu659Tz3ItJKj9rdyeaY3hAMX0e5l9cRTVwhXjr5WX819Ns7Up
	 BVp4h5sZXcnMg/Jw2oMkbbqGLMeG/s2/30vkZU1vgMz+Hjzxx4r7MvBfiysaRXgVbpgbL
	 yLEJeAfUK+XUepLJmY8aPRI1DvKEIL1Xvy+Ck8oCDln6NQc2uJWLKQnRZR7uK4vif7304
	 zc8hkON/582+7p6z767Ec3oP+NZkEZcCm105vUNnjXCxfG9MfCt8Ehr63XdHr11S6cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhCyEaNC;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77FD606A32C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 03:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WhCyEaNC
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3ada81853so8866751c88.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795749788; x=1796354588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skeWlY9qqzvD2S0y6NSVBgm7gug5B6mxGigPdEgMeRg=;
        b=WhCyEaNCh/5h4fFok113/zslMkpXx1htd+MkLdA2Uz8QdeMa4BsIlCZDRLNxcl6PyG
         VKbhgjrOMSbNbPa1yaNgIrP0ACv+Bt6ooLiBcY3tm4ZmLfMLw9oMT7yAcaqOeStaJCpQ
         vB9kdk9TKhWebYS8D8GaXjl/ZKb7VWHeW3ygrRkC6+uYf7FxPjRF//q33qdZw8VHoDhV
         7Nm76mKgGFHkJ7VPOLgEsrn88IVUuB1HZIKB9aP50TKxeLrF+5kSb1VSmG9Xyo7ICJ76
         jNpDrSrWDoJwkIrSS3PhIyURrpqy+kCh0/d427QkO4Xh5Lzd66RUe5YYXvvvj+yar4j+
         QBvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749788; x=1796354588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=skeWlY9qqzvD2S0y6NSVBgm7gug5B6mxGigPdEgMeRg=;
        b=F2aCKh4D3UATXRW5WeYPYc6QGwrsK9OPOwNJwnuTSo+v3cL3VoMAEX6ZSJzbkJEaxQ
         NaBsLxCo4qSQNygCRNntadwklLpQizgF8PKYpD4z1sJVR5I6aLvDDN3g3Iuv0FQF/Qm3
         WL2EvK+LTZoktsQKJlpi4dhe6lUovwbulP8NUXkTKkuT80LHvp6tOz4Wb45Vn6/7FfWc
         aaXAWjtQv9/fB3wROYTZ+Ydou5fZAWPDBumce0t2mRGOtAl6p1jk1DEFscM5dcMLPu4v
         IBuYY0HQxACMeo4fIqYe4ttXiD9eqTYDhsddAbReeqBvnthgUPxPkK9a+WPRNv9dTp6y
         /3cQ==
X-Gm-Message-State: APuU4Z/7OEHELr0e6IXmGckByMBBLV1KXnBmzsV0HJzNwzrFuzrAiNmA
	zH8oETMXV4hp9Eltrsmc09wAfVLTBQQkqDNMEfl2ZVj06qgrUtSHi0lYlprChw==
X-Gm-Gg: AZFdTZcLRziVdQU+haG8085aDa/XefzuNsUN0aprvjbU1Pe81l7/mqYW7WFagnzARuE
	IFxRzBwzA+TQhrO5ddC8guD2WOl2n51yIPWPaxMFd7VK9Mu/+JEW6zdbgGfoD9ph14XEGVHXliO
	3918ljWJeDdmLj+Ku11KOdiuQOTJn8Wxme/ki8FESWspXSrTdqbUpQaG3bw9juyNYuVR/Nt25wn
	7yR/utzsIWL3NVtqemDRGja8p7kFo6lAONovlnThz9ZjMeFFWaHiUTZj7c/Kwc/Vi/U7k08XDSb
	h+N0eh94wT8OIjKJjq8vtA1zd8k8QaftOu4S6wWiXtmgd6jakkRXF7Q/vn0sjzMRkhP6rUYnsCJ
	dP8WW0ckfTVCLhiTA+ZxVCJV+Y/JG8bGeoqYkVtTq7YWLM9W3UkImtPLEaic32B+wr5U37/l9cM
	aNEDv6mYJdAK2NXR/zuwMzliDr2G5c/PDQm+9xX9F4ljKVwkf1mN0bitYPlYsCvyoFyKTzhECZx
	ROdy0CXr6mM+9mCk89EWpxPBJ0175sszZqxujQ0SGQpRviZobESY27WHwTUA9M4CYCQHyUTnqyt
	o2M2+iNnqbO+yM2ku9clRyYGO0viDGY90O3B88xgs4hViimlUm3insY3QoSc8eBz2+OZWNokqQw
	+NiDwj3JM7coEkBpyzhJpu+K2IfuBYHOF33m39tsHJrmNQ398flAprjUBoZFaknsWVTfr+9mvZQ
	==
X-Received: by 2002:a05:693c:65ca:b0:386:b826:407 with SMTP id 5a478bee46e88-386b826061cmr13286774eec.20.1795749787617;
        Thu, 26 Nov 2026 19:23:07 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm81845568eec.10.2026.11.26.19.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:23:07 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
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
Subject: [PATCH net v10 2/2] selftests: net: test joining genetlink groups no family owns
Date: Fri, 27 Nov 2026 03:22:46 +0000
Message-Id: <20261127032246.2886407-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
References: <20261127032246.2886407-1-anilkaushikwireless@gmail.com>
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
  after drop_monitor is loaded. The test unloads drop_monitor again
  after it loaded it. Skipped when NET_DM is already registered or
  drop_monitor is not available.

The free IDs are found with a family dump, which only lists the families
of the current network namespace, so these checks are skipped outside
the initial one. It is found with its fixed nsfs inode number, which
also works in a container with its own PID namespace. Kernels before
v6.17 do not have that number, so the checks are skipped there too.

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 138 +++++++++++++++++++
 2 files changed, 139 insertions(+)
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
index 000000000000..32b4951f8816
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,138 @@
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
+        raise KsftSkipEx("not in the initial network namespace, "
+                         "or the kernel is older than v6.17")
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
+    # The returned length can be larger than what the kernel copied.
+    buf = sk.getsockopt(SOL_NETLINK, NETLINK_LIST_MEMBERSHIPS, 64)[:64]
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
+def _unload_drop_monitor():
+    """Unload drop_monitor, so that the next run can load it again."""
+    try:
+        cmd("modprobe -q -r drop_monitor", fail=False)
+    except OSError:
+        # No modprobe in PATH
+        pass
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
+        try:
+            if not any(gid in free for gid in ids.values()):
+                raise KsftSkipEx("NET_DM got no group ID that was free")
+
+            for name, gid in ids.items():
+                ksft_eq(_members(sk) & _bit(gid), 0,
+                        comment=f"member of NET_DM {name}")
+        finally:
+            _unload_drop_monitor()
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

