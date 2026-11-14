Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694549;
	b=V149vMfN6vmgWpz1NLFUjGaJWXEkz5kUNMqgqe7CzW/ru0pPwEqczYZhfv8Vf2OhVvMl
	 61sOY0vOkmK05ZgQNj9+axN/LC1tOKmzPa/Zr8jKqGiBGTiUY/em4mHlJWdpBe1o2UI64
	 VfyBaHdxOvJN9e9mqyETJoYXL2+Aw0VfLQZDHYIsr4wwTQmkWFZGzSXOVCqIXwjsEIk3C
	 rycufYfwG1H/MZeB5pzbdZiNQXJbRPaIT15KHVQBmHu87eVHt5YRE1VfCTCtMs2CjgzpO
	 QHUoObXq8guB2AaaZs1MCsx6Z20XXbg5xPPm42Fc3YbqSFH7mj0e2B3S+FoY+lgLRLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
	b=lvCTJG38aAVIJZQcZC+x9s/y7BJxGCPx7hvOXLy2601Gy9LfEFtqMyhQmRCEKnLemJwX
	 VKLDnyhwTChRROfYfOjew1J6acV9sS05WJDER2CuttvDpNJ5Wzh4apS+K57zQdH+NiaUz
	 CSAtlTg1UtjiKkyXXMSaPkWSq5NbyuwYkIjrmhnh+bIbgJS5MOtKsVCrZ5y6DN+T3RN2D
	 6h4lQZ/GAhp5vmNaBEpRunNUcU8DlYzKZx5Ei81V2KymtVD5ZFEndj0NDVqGuLeoQN69F
	 Gjbjw/Qx5o+h3L+cpoiAR18VWvw+cyJhyPxfIU+5YQTrijS5eoawep+DtUAik/e1OTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq61C60D;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E83360A2627
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E83360A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq61C60D
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1125242f8f.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694548; x=1795299348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
        b=Nq61C60D4mAlZNO7ooeTvcHOc/hrz4DLr1qK456QcqOP2E5oy2bN7gRIeRmqfxTlkp
         6WwmlNVrooFnYXmkqAHp5T9laK6sCm1Blqg94QEWVjSCHFjFHzl/uoSuN/ldL137aSNo
         KwxpJC3yffXA91aJIszp64IYhtM3OEphSw/fnd4nOGLV3wjWT9xXUzasjMDOSnfsKZuc
         XE0AohHW5LRLDSRjj6MH3tkWTcL8CJQ9lEUb37p013sxFjkDRnuQwQljyp8L5lMVtrq4
         T/sqL1nzbf8e5Z5DWsyD9flInuhUU/i04ZErlAarvKQ98BHTyS4Tmofw73T5eMGrodT1
         nSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694548; x=1795299348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqHs6HEOhDu5aRvOORUyDd00kdCJ9afZEREichHXXFs=;
        b=aQAvj5wZAiDupjKhtqs2WHIfQmN9EwLVwbpRt8LnnJHsLxV82kyGUhNDbaFLiH0H+B
         F3X8FIL8ps+qkXWZZpdr5S9OrdIyi0WR4JBxs7cTRruSenbFQHL/5Nca2QR1BpxuSka1
         U73UG53ExYskenzfvjBmDBV6MHMy+BvHV13e1VK9vuCqHi9ExvR+yf7iqrgRbXLQu7zP
         a/vLXkF5It5OtqLcgQJp5Zc1WZ1hpxs4e+afVXnXpxDBd9LcBF2JJDhgew/wm8v+xXny
         eTZrf276v1QxJ6bqXH6cFvbUdQIhdH7qpUw8JjgYPGdrMMV73dJWF830FXTqsOUJJU3R
         P/2w==
X-Gm-Message-State: APuU4Z++WsIH1DUCGcsqEF6kaTp6DzXFWOM6AKg7j0eGtFfgFdAR6f69
	DgrwZ5vCEOz08lcMZG4T0yhxnFbmrNKshrl0zOuHgl8FHEyiqrIjb95SrS0PumjUC5U=
X-Gm-Gg: AYBFou2jWmpsL7QcwmVTWNNn3j8mQungb9qZpLhKqxNniRdjzJyajLhYoj63Lua2o2p
	p6pMY7FiUDKcbc9XKbz5+HUhImYaykSYSv2VZXcbsM3pvs2oKQhL3lQdCzUkpMDLdZuu6Rjhg+L
	wuJzPM/dkXLCxV6s3rbnz3Sc3pXm/RN1pdFwH14B3Va3eSbtQf9zeu7BBabbFxecKsdie0R3EOW
	ZD+wlQijlV1xRB6gjjd0kznSTrItgR6TC7rBNuT9BFMFwGhqVJzQtzCoGXzC6vXGnLomBB7yrrX
	exm+kYwWLjeI3/0LOFvWF4AFOP1SbCQ8BoIIIm5QHPa3UD/wxxI8ZyYMwhmExnD9PZNDn0snMUQ
	gplV5UWwIh3dhNEEUq/ZMCWXk5JYsk61FPAqyk+hNbdtR4maM3sd4HH4vBV6h9/bUnyJBahhbI9
	o1HtClf1HZbt47RQieJ1vpLeyXhr2X416yjrINCOApGg/FpsANDmE/ZMmqmU7/OrAWt8R67fTJ0
	henOv+RT6o1T27CtyZwFGRB0voSh67CvGs1gRif58TF3FejaMTTMOC5OnfxPxyCKd6wtXD+ufYI
	h9y6o9NVLS0pbvu87haKmml8ZC7jUuDQ8PUPpkugmQwi
X-Received: by 2002:a5d:59c3:0:b0:48c:72fc:363e with SMTP id ffacd0b85a97d-49c9487049dmr15265032f8f.44.1794694547772;
        Sat, 14 Nov 2026 14:15:47 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:47 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>
Subject: [PATCH net-next v5 5/8] vxlan: leave FDB state and flags unchanged when an update fails
Date: Sun, 15 Nov 2026 01:14:09 +0300
Message-ID: <20261114221412.255825-6-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_fdb_update_existing() writes the requested state and flags into
the entry before the steps that can still fail: under NLM_F_REPLACE the
nexthop update and the check that refuses non-unicast entries, under
NLM_F_APPEND the allocation of the new remote, and the switchdev
notification. Each of them returns an error with the new state and
flags left in place, and no RTM_NEWNEIGH is sent for them, so the entry
changes while the request reports failure and nothing tells userspace.
For example, an RTM_NEWNEIGH asking to replace the permanent all-zeros
entry with a dynamic one is refused with -EOPNOTSUPP, yet leaves the
entry dynamic, and the ageing timer then deletes it.

Write the state and flags only after the nexthop update, the non-unicast
check and the allocation of the new remote, so that a request any of
them refuses never changes the entry, not even briefly. The switchdev
notification reports the new state, so it still follows the write; save
both fields on entry and put them back if a switchdev driver vetoes it.
A successful update ends in the same state and sends the same
notification as before. The ageing timer reads the state and flags
without the hash lock (see commit 7308ef8b4a67 ("vxlan: Stop rejecting
dynamic FDB entries with a nexthop ID")), so it can still age out an
entry that a concurrent successful update makes static; that race
predates this patch and is not addressed here.

The patch "vxlan: vnifilter: account the default FDB entry to memcg"
later in this series makes the NLM_F_APPEND allocation fail routinely
at a memory cgroup limit, on the path that changes a vnifilter VNI's
default entry; this is ordered before it so that failure leaves the
entry as it was. Like the rest of the series it targets net-next.

Found in the automated review of v4 of this series; the other error
exits were found by auditing the rest of the function. Each exit was
triggered in QEMU on net-next. The refused replace and the failed
nexthop update need only netlink requests; the failed append was
injected with the kernel's fail-nth fault injection, and the switchdev
veto was triggered with a test-only module that vetoes the notification,
as no switchdev hardware was available. In a production build (4 vCPU,
ageing 1 s), 356,026,806 refused requests in 1200 s, in equal parts
replaces of the permanent all-zeros entry refused with -EOPNOTSUPP,
appends to it failing on an injected -ENOMEM, and nexthop replaces of
another entry refused with -EINVAL, let the ageing timer delete the
all-zeros entry 1,193 times; the test re-added it after each deletion.

Tested in QEMU with the same requests: each exit now leaves the state
and flags as they were, and the loop above deleted the entry 0 times in
341,241,414 requests. test_vxlan_vnifiltering.sh, which gains a case
for the refused replace later in this series, passes with and without
KASAN and lockdep, and fib_nexthops.sh passes.

Fixes: 6681712d67ee ("vxlan: generalize forwarding tables")
Fixes: 906dc186e020 ("vxlan fdb replace an existing entry")
Fixes: 61f46fe8c646 ("vxlan: Allow vetoing of FDB notifications")
Fixes: 1274e1cc4226 ("vxlan: ecmp support for mac fdb entries")
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: new patch (review of v4 6/7); says how the gap was found and what it
did in QEMU (sinfo bot); writes the state and flags after the steps that
can fail instead of writing and then reverting them, so a request those
steps refuse never changes them, not even briefly; a switchdev veto
still writes them and puts them back (local review and KCSAN runs).

 drivers/net/vxlan/vxlan_core.c | 40 ++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index d11028b37472..2303d652d396 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -987,6 +987,8 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 				     struct netlink_ext_ack *extack)
 {
 	__u16 fdb_flags = (ndm_flags & ~NTF_USE);
+	__u16 old_flags = f->flags;
+	__u16 old_state = f->state;
 	struct vxlan_rdst *rd = NULL;
 	struct vxlan_rdst oldrd;
 	int notify = 0;
@@ -1005,21 +1007,6 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		return -EOPNOTSUPP;
 	}
 
-	/* Do not allow an externally learned entry to take over an entry added
-	 * by the user.
-	 */
-	if (!(fdb_flags & NTF_EXT_LEARNED) ||
-	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
-		if (f->state != state) {
-			f->state = state;
-			notify = 1;
-		}
-		if (f->flags != fdb_flags) {
-			f->flags = fdb_flags;
-			notify = 1;
-		}
-	}
-
 	if ((flags & NLM_F_REPLACE)) {
 		/* Only change unicasts */
 		if (!(is_multicast_ether_addr(f->key.eth_addr) ||
@@ -1048,6 +1035,23 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 		notify |= rc;
 	}
 
+	/* Do not allow an externally learned entry to take over an entry added
+	 * by the user. The state and flags are written only after the steps
+	 * above that can fail, so that a request they refuse never changes
+	 * them, not even briefly: the ageing timer reads them without the lock.
+	 */
+	if (!(fdb_flags & NTF_EXT_LEARNED) ||
+	    !(f->flags & NTF_VXLAN_ADDED_BY_USER)) {
+		if (f->state != state) {
+			f->state = state;
+			notify = 1;
+		}
+		if (f->flags != fdb_flags) {
+			f->flags = fdb_flags;
+			notify = 1;
+		}
+	}
+
 	if (ndm_flags & NTF_USE)
 		WRITE_ONCE(f->updated, jiffies);
 
@@ -1066,13 +1070,17 @@ static int vxlan_fdb_update_existing(struct vxlan_dev *vxlan,
 
 err_notify:
 	if (nhid)
-		return err;
+		goto err_restore;
 	if ((flags & NLM_F_REPLACE) && rc)
 		*rd = oldrd;
 	else if ((flags & NLM_F_APPEND) && rc) {
 		list_del_rcu(&rd->list);
 		call_rcu(&rd->rcu, vxlan_dst_free);
 	}
+err_restore:
+	/* The notification was vetoed: put back the state and flags. */
+	f->state = old_state;
+	f->flags = old_flags;
 	return err;
 }
 
-- 
2.53.0

