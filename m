Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832853;
	b=viIULDRC9z231V3GGrQwgbQMxgvDiDzn3KHkf4reLHrvSPF+yDTvXLRiJwBOslGxOBfZ
	 syBm25eDaxL3lQ1fnHc9u7NneqjJT76SidGP9LaTw0GBQHHtXNIQI2f1qyV+rXqhnaXP3
	 3jfAf/cyJ6d8ePaVBjXPxL8xl8QMeEI2bUiP3lcyyWylbJt7yk0KrQnfxGLj51qUC9YpN
	 CeoLvypkz7zAMbT/nkXkImQdEThs6HDCaFjLfJGGelRZ3KYfG/3RwOt8dv40YkJ5AKkKv
	 GTZFAs/SahJVfa62W1pCYJG1LKjnWAdmb2E6PSRuiw7eyD1u8YjJNkRg06LoY7JPigg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8Y+w5BW6OIJpaIiG+ViK5HqW8ZESkaD2jY5QKwGClmw=;
	b=WpvUGng/TPJAA1cQ4/4D5kouBr0Uf51oqWAr8yigAXcbAfa9WcoMGdu0rSjwvr0ULNO/
	 Q+4yaHm/T4wR4dYO6pLUJsxBIFYVcd+JWELlbuxKX0ONorjlHR0zzy8pWAC9CWSlPfeJn
	 NPX46H9b5sHu00de0DO2nZSnz9RFic9+4YE0KFqqlQ/AidgpMzCh+ucNwv4CDNrwDAwZD
	 YlmbDTmuMJSQZ99vBb5qCX2RyHs8tM3j4meY0kmUEd+OSoHVKjZ76y+149KefvagtwgYa
	 brxvh1BmUkx3MP6tgR4ZVT3bro7PL2A8JmowhbIFs5XBnvTJbekRyMC8HQgb0PBg8Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0Fzeo07;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6D4606A334
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F6D4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0Fzeo07
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-86103aaac12so2877907a34.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832852; x=1795437652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Y+w5BW6OIJpaIiG+ViK5HqW8ZESkaD2jY5QKwGClmw=;
        b=Z0Fzeo075bZN77RomANlawJdtpvPJWRw30R8A0yMlWSmrV9xS+lSHUwrbYQ3Y8Nh9s
         epLkqEZExPULIb8JunxwmFDFdpcoDgLVlu9UfgYWxdxuhGWXZ9osi711VhOQWq++81Iv
         9C7lm2t2pZq0bUpE28wJ6MfXX1tL6mmqzpTFWQrdi5PTOuDfqe4DDkn6N1IHhVbl2pvA
         3v8kJ1/qVsNJSuYnFlgawAshz9oftKjTzs9rsOAXkBc9wI3dIroiJZjipoJTK5DFedFG
         va5gnGcxlv8EHbJSLQnxhmkH9zD0hrFrZiIS5iBzdkmQsG6SY9Wtzo3N0+EBvGjDil51
         f2vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832852; x=1795437652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Y+w5BW6OIJpaIiG+ViK5HqW8ZESkaD2jY5QKwGClmw=;
        b=EqEPewDaQ64Df36HJO4OPsd1aBc+L8xIfAisLlgKYhFeTcDwKwDUrt7eEwBgCo4zs8
         +8tcf51GU33BJYRQiyfVCtM1qmFCHezesH6N+feEDM78S8VIi545daQpOLyrnxiOiu2/
         Qu3my401qT7p9YJfapInTAPHKJvwq8r7NkGDb/JCpSfJceb+eW+Ilc9BJDhL+C2YTNOY
         Vu/WCcEjUPRpSVeCsKa0Wl8UVsP3ROekcDRm5KlFfRNzmL2m6WQdqJDQzOwPRg/BrHD3
         4Vf7IL1KDCwtH+d7/8+JSosIJDJYUVlxB5mYl4ycHGWF4ub4yIqN1DvEo3L35B1EMs1O
         qWsw==
X-Gm-Message-State: APuU4Z+hzJBunYzzmwcAtUmLU8szY7hzHBVU9dr8gFOFiGuzky7UpjR5
	GRYB9/LGLNiUjJQalFZ5TlLcJtGHWVtA7TIV5Rx2FnydXFpS8JBzIfY/NQjQWw==
X-Gm-Gg: AYBFou3L8wGhZhivAUSx9Wo8h8eggh9l/3L5SsCXHtrJJ2WqIO2jdfqQTjx7z+zGXzB
	n0zPboyDgULs8ePPakuN4MfdF0T1zS2y2E/W9hKopPYXjRT6fOW07GFy233Mf1bO1WZZl+aGc9w
	mIa/S45AtA5quFhQCTy/N/xztMmP1ftpho6sHT3gAFPaax4PegTCOFFalSP3PE2HHJUi6dJXzdF
	e/ZORhAbivCDFuSZhHKNxT8SKSZfryukckEWKGU0Z0vYwd7fJXm9deUfEPs6m3om6Iuh4v8oJFd
	4Ci58AaaHmIL+nWlbjb6bpGZMQ586z2dWNVS2PITSM/TtkFCY7/qyzUoIqqht26ZiWwxkvQVRkP
	k9FEQDK2i8CUJ8+eEufOFbsEl5DCijjSLRO+jiaUQqqe9xnm4PZe4mJ3pe11f4zwFSSIe3Rx2Jy
	KXmXQxwHwQF6xwtCQWGeHU/S4/0a2q5cBmLiCthhO06IGmFmee6SHS9squzTrYkome266gkIVVo
	Wm5SPy6/g7MYbrw9jIi0v4uMWVHeE2DZjfBCSkaMatr4tVagR8Z2SoU00wN3v7NYwoURxgFr1Uf
	2zDPnkXL+vObh/zRlIXf3l9noznHrsKmYYNyKDOtYg1cQbvmsazqbUAVTd3Vl1SIJRHyOsiMjdx
	4zf0hoNSTeu/asPMl8I1y2hbN8Y4Fsocro60kqEKiXzclYL4Qz1jlqSaCjnVHGLnMW8gJ/Xv48g
	==
X-Received: by 2002:a05:6830:917:b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-86152678b21mr11542797a34.9.1794832851876;
        Mon, 16 Nov 2026 04:40:51 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c4dd9abesm2830937a34.20.2026.11.16.04.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:40:51 -0800 (PST)
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
Subject: [PATCH net v7 2/2] selftests: net: test joining genetlink groups no family owns
Date: Mon, 16 Nov 2026 12:40:30 +0000
Message-Id: <20261116124030.1595567-3-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
References: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
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

Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 109 +++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 85f51a30c6a1..a765bc77e14c 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -74,6 +74,7 @@ TEST_PROGS := \
 	netns-name.sh \
 	netns-sysctl.sh \
 	nk_qlease.py \
+	nl_genl_mcast.py \
 	nl_netdev.py \
 	nl_nlctrl.py \
 	pmtu.sh \
diff --git a/tools/testing/selftests/net/nl_genl_mcast.py b/tools/testing/selftests/net/nl_genl_mcast.py
new file mode 100755
index 000000000000..71fba0280440
--- /dev/null
+++ b/tools/testing/selftests/net/nl_genl_mcast.py
@@ -0,0 +1,109 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Tests for joining Generic Netlink multicast groups that no family owns.
+"""
+
+import socket
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
+    return int.from_bytes(buf, 'little')
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
+    sk = _sock()
+    sk.bind((0, 0))
+    for gid in _free_ids(ctrl):
+        # ENOENT
+        with ksft_raises(FileNotFoundError):
+            sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, gid)
+
+    notify = _notify_id(ctrl)
+    sk.setsockopt(SOL_NETLINK, NETLINK_ADD_MEMBERSHIP, notify)
+    ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_mask(ctrl) -> None:
+    """bind() skips the IDs no family owns and joins the others."""
+    free = sum(_bit(gid) for gid in _free_ids(ctrl))
+    notify = _notify_id(ctrl)
+
+    sk = _sock()
+    sk.bind((0, free))
+    ksft_eq(_members(sk), 0)
+
+    sk = _sock()
+    sk.bind((0, free | _bit(notify)))
+    ksft_eq(_members(sk), _bit(notify))
+
+
+def bind_before_family(ctrl) -> None:
+    """A free ID joined with bind() stays unjoined when a family takes it."""
+    names = [fam['family-name'] for fam in ctrl.getfamily({}, dump=True)]
+    if 'NET_DM' in names:
+        raise KsftSkipEx("NET_DM is already registered")
+
+    sk = _sock()
+    sk.bind((0, sum(_bit(gid) for gid in _free_ids(ctrl))))
+
+    # Looking up the family loads drop_monitor.
+    try:
+        ids = _groups(ctrl.getfamily({'family-name': 'NET_DM'}))
+    except NlError as e:
+        raise KsftSkipEx("drop_monitor is not available") from e
+
+    for name, gid in ids.items():
+        ksft_eq(_members(sk) & _bit(gid), 0,
+                comment=f"member of NET_DM {name}")
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

