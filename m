Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795449319;
	b=w2xlP9ttMBuv0/XkSldNmGKv7DfA0pi1pR84e/MZDdbg7v/05oxojENGGYf+Qcj80vB0
	 on/PpkgH0RIPs8v2vtJf/XESk/gQGTFFfm1h9803IVegNRKFJExaZ7QekRuxNmPqfsjdq
	 /ckvy5BwS53lc35gfsrwR70zGNYjIFSry4D06hDDL8g36uWdm29eyXnqztyt3JVuhJkpk
	 ASPlxPp1Fziq3OFMhYSSCreRpn7HPJcPm5xIU/avo89i1dINDWU8dgGKYMefrmJIEvodH
	 C6I0rC2WQLyWMXUuCNttfQRx/rNbS3dYRg4vPiixWybEc531BUpZf3dSafQr2K3BZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795449319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
	b=ANCcC1AVX4kkwqhVQvtRT0mNWiCd62ZZxbcppNQfYZ9DoVRTsiZ02p/I7sWxdMHrKNO4
	 I68dHAf/USeJTtaSIjiI9shbPcQ2x0WMFPZeNJlz8i57K481c5WDRCWlDoGa3uj6U1nxz
	 xEDzToKsL5/FjkphllY8JGkIJ26UHeeqnJv2l5AIjBRBdqn7UHPYUrs1+nl3SNTO2Kx/+
	 uzcHX8cxiPNmzmQzyPNlvRmmRRX78OgKopxsU+2CkLWfnuHjiK4ZzL/9SGZzMHKksk3v3
	 A1HS4xe8XuPOTuaPMpdKss6J6JUqp8kXuZ9j4FZUuPspNt0QOm2vMLt1TGRRM9A8rPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPSfMFOu;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150EB606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 150EB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aPSfMFOu
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-38587f3de36so4175997eec.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 07:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795449317; x=1796054117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=aPSfMFOu6PFjIwdggbW8g56x5ZKRojysXz/kD72fr9n/i43MCrlSkfKNz1nJ1CxRJ/
         Q64jKpBRjr5jkUeYS6BUDbDlRrEvbBwttsJRQcmL0TOU8sA4sc+k+bZdepYlKN4JWHwP
         ILT5/RtNktJIaAn0f8Jpx3UWc/yV/LeX5BK1J/4kOvduHtjtqr61W2wOn96zbtUf1ZoF
         PT0Ygw95Km48Llm9/6kdoOlILYiQoZ6Wj5Ms+r2UB+s384UDfkDpiprVNLYLvM61sX20
         GzJM6kUGZmMg5Vbt2+uI8e1wEHjmo8uI1NjwC1P9ASDN3ZI22p9u9Gu5pve0avXk3+bW
         Tc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795449317; x=1796054117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hznFWbWvFOaXuVUd+3ixFiuNbdML6L6UHVu/kgMSL3M=;
        b=dni5NZuV8kXDLckIEM1puazouCooqx7Ci7p8oZG1F6UejwDvwINySwFbnhpKFcrER4
         mVhXcjQoLexymH06U8HbQcoX5w6JYhbxJ5HLkKEtV14j/zOC1la+6XTbzpkoQpoWIhDO
         VFBvpHUOz4B5iPvZdnO+J7NHhrdjWG5a5c5XtEZfTNwokJ0iRUC3oBE81OLSEh9EZ7An
         YhL05zYCxAZvT6zB9nr59+9oIQcxW/Cj3jtIQzdSi8bDHReeF4IFweMTEmFhsj3A9VWD
         HREk8DnaJY8+kEHXkeLfalyoFnGLOZsyvx5M6U+U+3InO123CT9VUhx6B6Sce72vpOsq
         qMfQ==
X-Gm-Message-State: APuU4Z9XdwsLW18wGjpSTWrKPXdilcQ8J7WO37dk8aJ2nbojqv+VkFhE
	jURqDVy6hi1meYwauYEchwISoKpWOCSGJw3T+oYKWolZomSSzOniPg7xYZv1sg==
X-Gm-Gg: AZFdTZdF75HIX3NM2uIZAx9ym6GGiMerFXalM17xNSWn5vEMkJX7YvZrlqecOHk1Rox
	rM17B/RkrKZaDrlgKxikrPhkvMEhzKG3D4kpR7M8dkshJ2zPC7oFT5c4mF+nNiCqXgx8MQyimrM
	NQ9GoSSqUzBS+dKshabSp+mWXZ12fbbJXntGHOrNKNzDomHT4K/1Uf6w+JN62l5T7wZdYhef5ST
	GMTl7tM6fxKWQCVGKEow5ZJP9Q3oQoqyJbYeacsCGsJK1VKfXYHqK40NbuGP805eTZjUJdGyce3
	FmoSkAz/kTk2d9DOJGVq3dbSItwDE42ZdWWOV0lASk0hhDICogI9jIC0tw7Nt2nyfrsBBaau8g5
	q6skLAv7Z9LD+riPWQ/+soqU20T0jX/4Wlv+q6v435q2gvfzOKcxgkzj9y+vQwwqyC2bUa2difP
	3c18UVJqkE7iJ6XKJDmgrZkm4dqez/PEb7p75wFwZ9JXE44XBxHxP7dqGKB7rOxtfGXK4Ywr356
	+5nn0bo1AYAAjIKNCqGiK/NqzpmnSI5xLexTdc+t7P23Havg5dbWtsYnmlzoLuiXP18Yg9ZfY0a
	pUOlafFN5r/BPIHHcBRUYoeS3ZfIhzQWNogBfTAXUu6Ifn8eLCQxit53OYbLgvKVdb35Kj6KjaL
	Q85pNCtJdqS5WXSVDK+cL0mYYpNhVKyv0TajpdlEqkyFxexQKw0FhPv20tMcpB7GO76xdwYfpFw
	==
X-Received: by 2002:a05:693c:60cd:b0:386:98d9:d5cd with SMTP id 5a478bee46e88-38698d9d928mr10220171eec.39.1795449316917;
        Mon, 23 Nov 2026 07:55:16 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm13723517eec.18.2026.11.23.07.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:55:16 -0800 (PST)
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
Subject: [PATCH net v8 1/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 23 Nov 2026 15:55:02 +0000
Message-Id: <20261123155503.2497063-2-anilkaushikwireless@gmail.com>
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

genl_bind() checks the GENL_MCAST_CAP_* flags of a group only when a
family owns it. For a group ID that no family owns, it returns 0, so any
user can join it.

A family registered later can get that ID, and the socket stays a member:
nothing checks it again. An unprivileged user can join the free IDs, load
a family module with CTRL_CMD_GETFAMILY, which calls request_module(),
and then receive the notifications of a group with
GENL_MCAST_CAP_NET_ADMIN or GENL_MCAST_CAP_SYS_ADMIN. For example the
drop_monitor "events" group always gets ID 1, and is free until the
drop_monitor module is loaded.

Fix by returning -ENOENT from genl_bind() when no family owns the group.
There are no group flags to check before the family registers, so this
applies to privileged callers too: a program that joins a fixed ID such
as NET_DM_GRP_ALERT before the family is loaded no longer gets its
messages. I don't know of a program that does this. One that resolves
the family first still joins. Say so in the comments on the static
IDs.

bind() takes a mask of groups, and most IDs in it can have no owner. Such
a mask used to work, so keep it working: netlink_bind() skips an ID when
the bind callback returns -ENOENT, and joins the others. Only genl_bind()
returns -ENOENT. A skipped ID is not joined, so it is no longer in the
groups that getsockname() and NETLINK_LIST_MEMBERSHIPS report.
setsockopt() returns the error, as it asks for one group.

This does not cover a family that is unregistered between the check and
the point where the membership bit is set. Hitting it needs a
privileged module unload at the same time, and the capability check
already has the same window.

Found by the Sashiko review of the gtp multicast group fix. Tested as an
unprivileged user who joins all free IDs, then loads gtp and
drop_monitor:

Before:
  joins: ok=62 EPERM=2
  gtp/gtp (ID 15): member
  NET_DM/events (ID 1): member

After:
  joins: ok=19 ENOENT=43 EPERM=2
  gtp/gtp (ID 15): not member
  NET_DM/events (ID 1): not member
  bind(), an owned group and free IDs: ok, member of the owned group only

genl_bind() was added, with its first capability check, in the commit
in the Fixes tag.

Link: https://lore.kernel.org/netdev/179324692107.3134.14443689892607921337@kernel.org/
Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
---
 include/linux/netlink.h          | 3 +++
 include/uapi/linux/net_dropmon.h | 2 ++
 net/netlink/af_netlink.c         | 6 ++++++
 net/netlink/genetlink.c          | 5 ++++-
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/include/linux/netlink.h b/include/linux/netlink.h
index 882e9c1b6c1d..b4eb873850e7 100644
--- a/include/linux/netlink.h
+++ b/include/linux/netlink.h
@@ -48,6 +48,9 @@ struct netlink_kernel_cfg {
 	unsigned int	groups;
 	unsigned int	flags;
 	void		(*input)(struct sk_buff *skb);
+	/* -ENOENT means no one owns the group: bind() skips it and joins the
+	 * others, setsockopt() returns the error.
+	 */
 	int		(*bind)(struct net *net, int group);
 	void		(*unbind)(struct net *net, int group);
 	void            (*release) (struct sock *sk, unsigned long *groups);
diff --git a/include/uapi/linux/net_dropmon.h b/include/uapi/linux/net_dropmon.h
index 87cbef48d4c7..4f2fee982c8a 100644
--- a/include/uapi/linux/net_dropmon.h
+++ b/include/uapi/linux/net_dropmon.h
@@ -58,6 +58,8 @@ enum {
 
 /*
  * Our group identifiers
+ *
+ * The group can be joined only after the NET_DM family is registered.
  */
 #define NET_DM_GRP_ALERT 1
 
diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
index 69bb951b5fb8..ee573ba6396d 100644
--- a/net/netlink/af_netlink.c
+++ b/net/netlink/af_netlink.c
@@ -1033,6 +1033,12 @@ static int netlink_bind(struct socket *sock, struct sockaddr_unsized *addr,
 			err = nlk->netlink_bind(net, group + 1);
 			if (!err)
 				continue;
+			/* no one owns this group, still join the others */
+			if (err == -ENOENT) {
+				__clear_bit(group, &groups);
+				err = 0;
+				continue;
+			}
 			netlink_undo_bind(group, groups, sk);
 			return err;
 		}
diff --git a/net/netlink/genetlink.c b/net/netlink/genetlink.c
index 5cc1037d4917..e5d4f3c4e22a 100644
--- a/net/netlink/genetlink.c
+++ b/net/netlink/genetlink.c
@@ -85,6 +85,8 @@ static DEFINE_IDR(genl_fam_idr);
  * cater to that by giving it a static family and group ID.
  * Bit 18 is marked as already used since the PMCRAID driver
  * did the same thing as the VFS quota code (maybe copied?)
+ * These IDs can be joined only after the family that owns them
+ * is registered.
  */
 static unsigned long mc_group_start = 0x3 | BIT(GENL_ID_CTRL) |
 				      BIT(GENL_ID_VFS_DQUOT) |
@@ -1825,7 +1827,7 @@ static int genl_bind(struct net *net, int group)
 {
 	const struct genl_family *family;
 	unsigned int id;
-	int ret = 0;
+	int ret = -ENOENT;
 
 	down_read(&cb_lock);
 
@@ -1841,6 +1843,7 @@ static int genl_bind(struct net *net, int group)
 			continue;
 
 		grp = &family->mcgrps[i];
+		ret = 0;
 		if ((grp->flags & GENL_MCAST_CAP_NET_ADMIN) &&
 		    !ns_capable(net->user_ns, CAP_NET_ADMIN))
 			ret = -EPERM;
-- 
2.25.1

