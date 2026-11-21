Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795287503;
	b=UMyuConZahhRfCXRmZul3H4WQzCODkDUX1rsTmNY1edmTwZTzltLkW3cuoiPuvWx8KCe
	 v+TIRo62lVdGcpeodTYY6BlurAbNLorc5tklceHLtmRqdxtB9PrFza9FUKHeVyQs0JBzp
	 QpQklrJI8pki4HoBIG2vzeWPiNleDp9BbxNClLgg+OLZ8B5G2VJhlgoWX4k3gj82yCVtB
	 9Q8NQqPVTs3iGNIHu6VbYsw/qySneZkwJyYj6vt+BWutJhjVWOek1L4+8PbAZvX4+j5gM
	 lk+lbAyFOj/tcxplMeQhlCDJsl1zY/5oFdfvYgFxa5c/jaD0Wa/nu7MtHpZTXrOazTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795287503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Mv6XydCz2jPzbogW6v5i2Gr96NVmcmAPADFZd1iJAiw=;
	b=hrIYcoVAEwsHRkLhRoxDMYHe6fP5Y0PIJtdwwFM/NPdSd/5vnWuKUD5SUS4kcRvLDSwX
	 In7IokWYCdQzfRwJrwk0z8uFQUKISyLrGqjDA5L9e7LViojQBwu32qFcDohEfV4wcw7pe
	 /TllMpSqqM7pHhFXDcfhVbb5P+FtRKrEiDRHJ+ihjompgGGvflEQQqny2/N+JxGKY5VDf
	 gMDLhV6tEZoWortO91yddjAqYc/oN9MfIcUQfsVvChnLrvNrN2kRBVS5DaaD3Tee1KVgP
	 ogauBo++6SDUtd/dVaRxENHy1RPNITfXs2R+9Qstsmqd4fJNVJ+qljOlesXz/m52p9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Kn7l7Ay7;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE98606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDE98606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Kn7l7Ay7
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso2302404a12.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795287501; x=1795892301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mv6XydCz2jPzbogW6v5i2Gr96NVmcmAPADFZd1iJAiw=;
        b=Kn7l7Ay7D4WqE0qSdwI2zd81PVBPF0i9bEbKodA5qVK/g/6bl+qxRSL7UzQAvmJBZ5
         IY09Xn4UuUlY5sgW98fNJRZLw2ncm5v9tFeJHjWabRb24toJDTbdiMn3zPh/+mwnU56U
         gklXkK2UO1BAOPTV1NQG37AD8RL8QN0HpRSXtu6htju35f/EbJomidHltvbcPNSFOIsq
         I3o8/POeyzNuVxpM2IvFTdzfq+8QAcxnGJShYS52HECiFdkpffNN/ot2aInY73wYt7G2
         rrOPBOStWvFYxXZbticH82twUcke9vp454269zhQshewwyZPmcLmTQ92P+W86FgVPX7B
         9rrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795287501; x=1795892301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mv6XydCz2jPzbogW6v5i2Gr96NVmcmAPADFZd1iJAiw=;
        b=ROzeUqxdHSyZvtC5cv0GAKgbCeIzFXmGfkSZuegRsYph0fsj+7939b8A1y7MyogfVj
         jEnL9hFHp3LQT8ZjqeZNGJBCZ3RZ4p8ugY5Ozw6LFql43bTLs+p7S+WIHGv5xXM7s2EC
         n0YCtuDfx45VH0JkWZrTE0zRmT31SZFlqOv/Bs3tyQAL75MJoB/zrGb1OlkWY7Aan2Gy
         zAJHtpC0MoE5ShFbpq8OseLmk8JGUKKvoz3fBSVgFcwF0sxJ/sXQIMiPwvg+n94og2Dc
         /LGZLi0As99md1DrYjLuF0QZyTj76AXMYn3opDYEEE77oTRNeXq8tdvm8yrm/Yuat1PA
         OkxA==
X-Gm-Message-State: APuU4Z8PIfcPRftNzrwRiPs9XuzB3hRzyB1ExMV+wztIplMojXRWpNUU
	qw4paEU2DneXY3dVt/VvszWk/MdgmAy7alMXF/uvHSsfFm0MvbjPvYzW2qD0cisF3Q==
X-Gm-Gg: AZFdTZfK8IMWyQTJVlm8gJ+QCNtL2jxVea4erOXSYGk/HyVOoSJgYOUGbZ5OH4/S/b/
	kYGrqZR64ogPczg082DNY1imPJXb1kHughrO8JuDFlKBrVd75B23AxUUAd9tryU55KF0uD1Y/54
	GRK9mxo/aInMlwkrNgPHusY2UZDJWtzMBGAIrkSCZ7fmg+MXNoDffFo8Y8s3mVBK3gyZTb1on60
	xHc/9wnFexv+rIKp8bK86boMuTzeOffyEG3GRtWJJ6+dy7k8ZnkWQ8Fcc5ODkNXhMZxo2QilRfn
	rabuVKhAbhSGqb2vmPSeFdXPdMXqTFBdJmxsY8gvEuca9H7wJ0ailrQrf1gKBALXzmZ5cAOwJcj
	ceEJKwAhpnbxPE7sE5FejAdeMwiEHYSgEJxP1eTrIF+5zzpRfc4sLOsaxN5uzwV5QC5gS7ox3sA
	d0FpFwYJLu3vXtIb4swvthBOSO2ZHi2UWjd8kphqyup0PS+DDwNt/pfUNo5lKkccIh+N9RgdCyX
	ym5GroxftzE01N9CqG/0KdfAthWe1yNvtiMNwBWnAe7/0gDzi3E1eWaRkCZ2GgNGzOmyRx8MQr/
	LOtxwXec06b89xOfCJnq4t3hvyKVGQdE7KzdG7PHQh54Tgx3I3ySGY0ios6PHxB0/PSKGjdh6WK
	I67HG1nyHgzW9IRSzxIUcip+JIvrmk7J7YmiO2o1CKN75t07O4y3iuT7ttgmgeMv7sW8UBjF1tK
	z1EWPRVS4gBbmBk6CKIio6t632UTfMlH3ZMqFwiUXD+OWmCo9OTjkUIFz3hqUHNwa6GDBOxA4L+
	mtp0rySJ42fMRWrQf6/87GX3xKhc2shlirxrIpRSPaDmjg10nk/6maaDwKbu5uWbmaFwuY5wvuU
	/6XcrfN9YgY6LcNnQ9a2OjTZmRRdX5XgXyWZcsCh8DtwWsDv1FZDm9g=
X-Received: by 2002:aa7:d819:0:b0:6b8:a703:8ffe with SMTP id 4fb4d7f45d1cf-6ba37c7ba68mr3945297a12.5.1795287501199;
        Sat, 21 Nov 2026 10:58:21 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbeecsm2779030a12.6.2026.11.21.10.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:58:20 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>
Subject: [PATCH net] net: dsa: do not run queued FDB events after the port left the bridge
Date: Sat, 21 Nov 2026 19:58:21 +0100
Message-ID: <20261121185821.1471559-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

FDB events reach DSA from the atomic switchdev notifier and are handled
from dsa_owq. The work builds the dsa_db from dp->bridge, which
dsa_port_bridge_destroy() clears and frees when the port leaves the
bridge or fails to join it.

When switchdev_bridge_port_offload() fails in the FDB replay of
dsa_port_bridge_join(), because dsa_user_fdb_event() could not allocate
its work item, the entries replayed before the failure are still
queued. The rollback clears dp->bridge, and the queued work dereferences
it:

  KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
  Workqueue: dsa_ordered dsa_user_switchdev_event_work
  RIP: 0010:dsa_port_bridge_host_fdb_add+0x141/0x5c0

A bridge leave has the same problem for an event that the notifier
queues after dsa_port_pre_bridge_leave() flushed the workqueue: nothing
orders the dp->bridge check in dsa_user_fdb_event() against the clear,
and on a switch unbind the work can also run after dsa_user_destroy()
freed the port's net_device. The notifier and the taggers read
dp->bridge->dev and ->num without locks while the bridge is freed.

Clear dp->bridge, wait for those readers with synchronize_net(), flush
the workqueue, and only then free the bridge. The work reads dp->bridge
once and drops the event when the port has left; the FDB helpers take
the bridge from it. The join rollback destroys the bridge before it
tells the switches that the port left, as dsa_port_bridge_leave() does,
so a dropped event programs nothing after that.
dsa_port_bridge_dev_get() and dsa_port_bridge_num_get() read the pointer
once, and dsa_port_bridge_create() publishes it with
smp_store_release(), so a reader that sees it also sees its fields.

The rollback oops was pointed out by the hosted Sashiko review of a DSA
host FDB series [1]. In QEMU with KASAN, dsa_loop given FDB operations
that take 15 ms, 40 static FDB entries to replay and the N-th
allocation of "ip link set lan1 master br0" failing for N = 1 to 150,
net oopses as above in 3 of 3 boots, and with this change in none of 3
boots. With the change, 2 to 3 host addresses per boot stay on the CPU
port after those joins (3, 3 and 2 more additions than deletions).
They were added by replayed events that ran before the allocation
failed: br_switchdev_port_offload() does not undo the part of the
replay that succeeded, and this change does not alter that.

Fixes: c26933639b54 ("net: dsa: request drivers to perform FDB isolation")
Fixes: d3eed0e57d5d ("net: dsa: keep the bridge_dev and bridge_num as part of the same structure")
Link: https://lore.kernel.org/all/179480421335.3136.15795220009190349154@kernel.org/ [1]
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.

 include/net/dsa.h |  8 ++++++--
 net/dsa/port.c    | 50 +++++++++++++++++++++++++++++++----------------
 net/dsa/port.h    | 26 ++++++++++++------------
 net/dsa/user.c    | 25 +++++++++++++++++-------
 4 files changed, 71 insertions(+), 38 deletions(-)

diff --git a/include/net/dsa.h b/include/net/dsa.h
index 5d12191b6f6f..cf1503d8a4c9 100644
--- a/include/net/dsa.h
+++ b/include/net/dsa.h
@@ -772,12 +772,16 @@ struct net_device *dsa_port_to_bridge_port(const struct dsa_port *dp)
 static inline struct net_device *
 dsa_port_bridge_dev_get(const struct dsa_port *dp)
 {
-	return dp->bridge ? dp->bridge->dev : NULL;
+	const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
+
+	return bridge ? bridge->dev : NULL;
 }
 
 static inline unsigned int dsa_port_bridge_num_get(struct dsa_port *dp)
 {
-	return dp->bridge ? dp->bridge->num : 0;
+	const struct dsa_bridge *bridge = READ_ONCE(dp->bridge);
+
+	return bridge ? bridge->num : 0;
 }
 
 static inline bool dsa_port_bridge_same(const struct dsa_port *a,
diff --git a/net/dsa/port.c b/net/dsa/port.c
index 1f5536c0dffc..3c36d7c3e341 100644
--- a/net/dsa/port.c
+++ b/net/dsa/port.c
@@ -427,7 +427,8 @@ static int dsa_port_bridge_create(struct dsa_port *dp,
 	bridge = dsa_tree_bridge_find(ds->dst, br);
 	if (bridge) {
 		refcount_inc(&bridge->refcount);
-		dp->bridge = bridge;
+		/* Read without locks, see below */
+		smp_store_release(&dp->bridge, bridge);
 		return 0;
 	}
 
@@ -447,7 +448,8 @@ static int dsa_port_bridge_create(struct dsa_port *dp,
 		return -EOPNOTSUPP;
 	}
 
-	dp->bridge = bridge;
+	/* Read without locks from the switchdev notifiers and the taggers */
+	smp_store_release(&dp->bridge, bridge);
 
 	return 0;
 }
@@ -457,7 +459,14 @@ static void dsa_port_bridge_destroy(struct dsa_port *dp,
 {
 	struct dsa_bridge *bridge = dp->bridge;
 
-	dp->bridge = NULL;
+	WRITE_ONCE(dp->bridge, NULL);
+
+	/* An FDB event from the atomic switchdev notifier that still sees the
+	 * bridge can queue work for it, and a tagger can still use it. Wait
+	 * for them, then for the work they queued.
+	 */
+	synchronize_net();
+	dsa_flush_workqueue();
 
 	if (!refcount_dec_and_test(&bridge->refcount))
 		return;
@@ -528,7 +537,12 @@ int dsa_port_bridge_join(struct dsa_port *dp, struct net_device *br,
 					&dsa_user_switchdev_blocking_notifier);
 	dsa_flush_workqueue();
 out_rollback_unbridge:
+	/* Drop the FDB events still queued from the replay before the
+	 * switches are told that the port left
+	 */
+	dsa_port_bridge_destroy(dp, br);
 	dsa_broadcast(DSA_NOTIFIER_BRIDGE_LEAVE, &info);
+	return err;
 out_rollback:
 	dsa_port_bridge_destroy(dp, br);
 	return err;
@@ -973,8 +987,8 @@ int dsa_port_mtu_change(struct dsa_port *dp, int new_mtu)
 	return dsa_port_notify(dp, DSA_NOTIFIER_MTU, &info);
 }
 
-int dsa_port_fdb_add(struct dsa_port *dp, const unsigned char *addr,
-		     u16 vid)
+int dsa_port_fdb_add(struct dsa_port *dp, const struct dsa_bridge *bridge,
+		     const unsigned char *addr, u16 vid)
 {
 	struct dsa_notifier_fdb_info info = {
 		.dp = dp,
@@ -982,7 +996,7 @@ int dsa_port_fdb_add(struct dsa_port *dp, const unsigned char *addr,
 		.vid = vid,
 		.db = {
 			.type = DSA_DB_BRIDGE,
-			.bridge = *dp->bridge,
+			.bridge = *bridge,
 		},
 	};
 
@@ -996,8 +1010,8 @@ int dsa_port_fdb_add(struct dsa_port *dp, const unsigned char *addr,
 	return dsa_port_notify(dp, DSA_NOTIFIER_FDB_ADD, &info);
 }
 
-int dsa_port_fdb_del(struct dsa_port *dp, const unsigned char *addr,
-		     u16 vid)
+int dsa_port_fdb_del(struct dsa_port *dp, const struct dsa_bridge *bridge,
+		     const unsigned char *addr, u16 vid)
 {
 	struct dsa_notifier_fdb_info info = {
 		.dp = dp,
@@ -1005,7 +1019,7 @@ int dsa_port_fdb_del(struct dsa_port *dp, const unsigned char *addr,
 		.vid = vid,
 		.db = {
 			.type = DSA_DB_BRIDGE,
-			.bridge = *dp->bridge,
+			.bridge = *bridge,
 		},
 	};
 
@@ -1041,12 +1055,13 @@ int dsa_port_standalone_host_fdb_add(struct dsa_port *dp,
 }
 
 int dsa_port_bridge_host_fdb_add(struct dsa_port *dp,
+				 const struct dsa_bridge *bridge,
 				 const unsigned char *addr, u16 vid)
 {
 	struct net_device *conduit = dsa_port_to_conduit(dp);
 	struct dsa_db db = {
 		.type = DSA_DB_BRIDGE,
-		.bridge = *dp->bridge,
+		.bridge = *bridge,
 	};
 	int err;
 
@@ -1092,12 +1107,13 @@ int dsa_port_standalone_host_fdb_del(struct dsa_port *dp,
 }
 
 int dsa_port_bridge_host_fdb_del(struct dsa_port *dp,
+				 const struct dsa_bridge *bridge,
 				 const unsigned char *addr, u16 vid)
 {
 	struct net_device *conduit = dsa_port_to_conduit(dp);
 	struct dsa_db db = {
 		.type = DSA_DB_BRIDGE,
-		.bridge = *dp->bridge,
+		.bridge = *bridge,
 	};
 	int err;
 
@@ -1113,8 +1129,8 @@ int dsa_port_bridge_host_fdb_del(struct dsa_port *dp,
 	return dsa_port_host_fdb_del(dp, addr, vid, db);
 }
 
-int dsa_port_lag_fdb_add(struct dsa_port *dp, const unsigned char *addr,
-			 u16 vid)
+int dsa_port_lag_fdb_add(struct dsa_port *dp, const struct dsa_bridge *bridge,
+			 const unsigned char *addr, u16 vid)
 {
 	struct dsa_notifier_lag_fdb_info info = {
 		.lag = dp->lag,
@@ -1122,7 +1138,7 @@ int dsa_port_lag_fdb_add(struct dsa_port *dp, const unsigned char *addr,
 		.vid = vid,
 		.db = {
 			.type = DSA_DB_BRIDGE,
-			.bridge = *dp->bridge,
+			.bridge = *bridge,
 		},
 	};
 
@@ -1132,8 +1148,8 @@ int dsa_port_lag_fdb_add(struct dsa_port *dp, const unsigned char *addr,
 	return dsa_port_notify(dp, DSA_NOTIFIER_LAG_FDB_ADD, &info);
 }
 
-int dsa_port_lag_fdb_del(struct dsa_port *dp, const unsigned char *addr,
-			 u16 vid)
+int dsa_port_lag_fdb_del(struct dsa_port *dp, const struct dsa_bridge *bridge,
+			 const unsigned char *addr, u16 vid)
 {
 	struct dsa_notifier_lag_fdb_info info = {
 		.lag = dp->lag,
@@ -1141,7 +1157,7 @@ int dsa_port_lag_fdb_del(struct dsa_port *dp, const unsigned char *addr,
 		.vid = vid,
 		.db = {
 			.type = DSA_DB_BRIDGE,
-			.bridge = *dp->bridge,
+			.bridge = *bridge,
 		},
 	};
 
diff --git a/net/dsa/port.h b/net/dsa/port.h
index 6bc3291573c0..e665baf7454a 100644
--- a/net/dsa/port.h
+++ b/net/dsa/port.h
@@ -46,22 +46,24 @@ int dsa_port_mst_enable(struct dsa_port *dp, bool on,
 int dsa_port_vlan_msti(struct dsa_port *dp,
 		       const struct switchdev_vlan_msti *msti);
 int dsa_port_mtu_change(struct dsa_port *dp, int new_mtu);
-int dsa_port_fdb_add(struct dsa_port *dp, const unsigned char *addr,
-		     u16 vid);
-int dsa_port_fdb_del(struct dsa_port *dp, const unsigned char *addr,
-		     u16 vid);
+int dsa_port_fdb_add(struct dsa_port *dp, const struct dsa_bridge *bridge,
+		     const unsigned char *addr, u16 vid);
+int dsa_port_fdb_del(struct dsa_port *dp, const struct dsa_bridge *bridge,
+		     const unsigned char *addr, u16 vid);
 int dsa_port_standalone_host_fdb_add(struct dsa_port *dp,
 				     const unsigned char *addr, u16 vid);
 int dsa_port_standalone_host_fdb_del(struct dsa_port *dp,
 				     const unsigned char *addr, u16 vid);
-int dsa_port_bridge_host_fdb_add(struct dsa_port *dp, const unsigned char *addr,
-				 u16 vid);
-int dsa_port_bridge_host_fdb_del(struct dsa_port *dp, const unsigned char *addr,
-				 u16 vid);
-int dsa_port_lag_fdb_add(struct dsa_port *dp, const unsigned char *addr,
-			 u16 vid);
-int dsa_port_lag_fdb_del(struct dsa_port *dp, const unsigned char *addr,
-			 u16 vid);
+int dsa_port_bridge_host_fdb_add(struct dsa_port *dp,
+				 const struct dsa_bridge *bridge,
+				 const unsigned char *addr, u16 vid);
+int dsa_port_bridge_host_fdb_del(struct dsa_port *dp,
+				 const struct dsa_bridge *bridge,
+				 const unsigned char *addr, u16 vid);
+int dsa_port_lag_fdb_add(struct dsa_port *dp, const struct dsa_bridge *bridge,
+			 const unsigned char *addr, u16 vid);
+int dsa_port_lag_fdb_del(struct dsa_port *dp, const struct dsa_bridge *bridge,
+			 const unsigned char *addr, u16 vid);
 int dsa_port_fdb_dump(struct dsa_port *dp, dsa_fdb_dump_cb_t *cb, void *data);
 int dsa_port_mdb_add(const struct dsa_port *dp,
 		     const struct switchdev_obj_port_mdb *mdb);
diff --git a/net/dsa/user.c b/net/dsa/user.c
index 041f9060c8ef..81f0d3901209 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -3646,6 +3646,7 @@ static void dsa_user_switchdev_event_work(struct work_struct *work)
 	const unsigned char *addr = switchdev_work->addr;
 	struct net_device *dev = switchdev_work->dev;
 	u16 vid = switchdev_work->vid;
+	const struct dsa_bridge *bridge;
 	struct dsa_switch *ds;
 	struct dsa_port *dp;
 	int err;
@@ -3653,14 +3654,22 @@ static void dsa_user_switchdev_event_work(struct work_struct *work)
 	dp = dsa_user_to_port(dev);
 	ds = dp->ds;
 
+	/* Gone if the port left the bridge after the event was queued:
+	 * dsa_port_bridge_destroy() clears it before it flushes the workqueue
+	 */
+	bridge = READ_ONCE(dp->bridge);
+	if (!bridge)
+		goto out;
+
 	switch (switchdev_work->event) {
 	case SWITCHDEV_FDB_ADD_TO_DEVICE:
 		if (switchdev_work->host_addr)
-			err = dsa_port_bridge_host_fdb_add(dp, addr, vid);
+			err = dsa_port_bridge_host_fdb_add(dp, bridge, addr,
+							   vid);
 		else if (dp->lag)
-			err = dsa_port_lag_fdb_add(dp, addr, vid);
+			err = dsa_port_lag_fdb_add(dp, bridge, addr, vid);
 		else
-			err = dsa_port_fdb_add(dp, addr, vid);
+			err = dsa_port_fdb_add(dp, bridge, addr, vid);
 		if (err) {
 			dev_err(ds->dev,
 				"port %d failed to add %pM vid %d to fdb: %d\n",
@@ -3672,11 +3681,12 @@ static void dsa_user_switchdev_event_work(struct work_struct *work)
 
 	case SWITCHDEV_FDB_DEL_TO_DEVICE:
 		if (switchdev_work->host_addr)
-			err = dsa_port_bridge_host_fdb_del(dp, addr, vid);
+			err = dsa_port_bridge_host_fdb_del(dp, bridge, addr,
+							   vid);
 		else if (dp->lag)
-			err = dsa_port_lag_fdb_del(dp, addr, vid);
+			err = dsa_port_lag_fdb_del(dp, bridge, addr, vid);
 		else
-			err = dsa_port_fdb_del(dp, addr, vid);
+			err = dsa_port_fdb_del(dp, bridge, addr, vid);
 		if (err) {
 			dev_err(ds->dev,
 				"port %d failed to delete %pM vid %d from fdb: %d\n",
@@ -3686,6 +3696,7 @@ static void dsa_user_switchdev_event_work(struct work_struct *work)
 		break;
 	}
 
+out:
 	kfree(switchdev_work);
 }
 
@@ -3718,7 +3729,7 @@ static int dsa_user_fdb_event(struct net_device *dev,
 	if (ctx && ctx != dp)
 		return 0;
 
-	if (!dp->bridge)
+	if (!READ_ONCE(dp->bridge))
 		return 0;
 
 	if (switchdev_fdb_is_dynamically_learned(fdb_info)) {

base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
-- 
2.53.0

