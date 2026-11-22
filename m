Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369475;
	b=lckKd2l6m7u95fJrP2TgC0Jphuf7jeHreBrcGdWOXTXZRYvgKXo8TGyt749wvEn3+VId
	 NF06sj0Rk8/fPPX9Uw+h5a2Jrw7BHP9TOmA60WqBfZacNzawPG/XBSfWzvhcoQ0zbEsuT
	 YA82El7HMn4JK0r+gyRHwTmrrYafOOnEIby+jRkfXth3MgnPNBgmcfHfJhpaQ6SjQmmkC
	 GgOfp/0RW4RpOqqBKITwaqgwG/PyUFfW4ir1v7cEozM+p3YB98eOu75PnWzIHQFiWB7QK
	 1Tc97EHwE7kso0sRACas/pJlSL0QyWMvnfnxTDpmxceKIQeG2X2N6tFLH+HcyMqiAUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cLbZ9xw43NyHfpQP28G4sSIRyISVnGyD/qZutlGH6h4=;
	b=NE+HiDPfcAwsOY4p7xMIknNev8uIN7MliMFU/47Aw9R0wHlFct5U0cDdOEIjDYEVXlG4
	 BRyyzxXuH3qomZtKohcUHno4WbRsyi1gGY6x5lbVOjn7mScp/1qJ9Y7tTUtzsMMRwzm+P
	 tkiwJyPHLANAz09ZVoQSPloTQUmfpgYRAH2eUsInPFSjs7ZOPuPx9vB/rboWu1lXvR84p
	 XAWm+SY32y4sc+GyrgJnYXQkywSsyk6h4tQB1n5ljS3yUV+pS94PKIdbbkh68Bj+h3m80
	 Jc7uULu23uwwz9V9hbSJe6NzyihYvjusmqx2BLus28irmQEE8kfSSYmYIVa3WI+wP9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lONPxLCd;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88182606A6B9
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88182606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=lONPxLCd
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c50a4a2132cso353485466b.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795369473; x=1795974273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLbZ9xw43NyHfpQP28G4sSIRyISVnGyD/qZutlGH6h4=;
        b=lONPxLCd2cFVnVCsvsACcdHiMrEPIi6VJkAmqZkhugwuHZw9wgc8DD0CNbIvSmkRIR
         X7iejpU8Zt/hgQbEcejqOinb6OJf2Vcv0S79ezc3/V0S0hbef+xpkAg6fR5TdeIo375D
         MypU+B/cif4VdXP4VR4P1/ffDnmiyIsaasAxj2HLjPP8rBvCLX+SUnBGdVmFW4obafCG
         uFRY3RBRRrrsv2zfrtxwDGo7Y72uBn+RaVp7yTJ3nY3l58g8XOiWSEpqFdkeBZOl2OdO
         ye8p5pKkKOm3n2qjVgB3NskNXA44yVKec38RuNw/KzGCrns93UXgjVPpEzW50KD6Ymxb
         wHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369473; x=1795974273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLbZ9xw43NyHfpQP28G4sSIRyISVnGyD/qZutlGH6h4=;
        b=uEa8a54cIv+XGCGRbe24eLoumvcc/OBwQrxnSMYMpYANYIEeDUtCWUQokgt5ldW7/0
         G3fnTg7L/nKc80Ff9JQCnd9gS8cg7rwBLDZYvcVTTfJtZ5SY9J7YS279LaeyYvt/Oy7M
         Of3nW0zrqlww/L/F4lBwVRgMWGjJp2/jvHUIlpo16idHO9p3G+bdCcpjQVOw/5B013Hc
         J6r0dxLhw56DWWY8klUYdIoVzSwqAyMdB7jXWCo/LyxlmNmBG1iGiTtRJqhHXOGkS1YG
         HS5Q7eKc0FIe1b2J85xENLAplygVCq+bqL/Zl83daNuYjQJH9F3IDg0ovRWs4cFkbReQ
         wuvA==
X-Forwarded-Encrypted: i=1; AL+hErEsNUeZEv0nfI27pVSuQOwV87EbI+XVChxWEEyZIOiNaQ6ymlMUJDT5TV2spDrYZmlzi/l87Gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ownk6vgpiMfHz3Z1senMxsVKwIInrbPz/33tEzI3770UwZIQ0
	Ls8aQ6TwL+lWdTipGdvihzVi/sWU3mJeOlEUoizKLr2w+O3jBM9wCZy+DzCy+wTjyw==
X-Gm-Gg: AZFdTZf+aG9cv3J4/Pl/CziQNsDXSD8ZbHimNcSwd6468broEev61MupNaEmVxmnaGT
	K2k3TGluyiUTmPY+O02cZLaWfGZgUFwUxeHGcShPmB6QzZXJAMRNqHI5aG5IJPPmUr1jMv0ZXP7
	P+62lZ1Iq5S8HHnTEX3DbFNzlzEY4OpLIrSgnOuZ/v5XPBxlUR+rYwMpNkoiOXb8XXN/4YZi7qr
	vnLgG4bK4ZJZ9yE27aRaQ2iUZ6Z2gJp2iLHnZXblltpRStYOVDl+JvmUMICsziaWkJJR04je+7w
	jOqyqYD1RZ/kAZIv018AZXMz8/Z3bhjUyGEkmyoULPShUJuBwfsm1h+7FVCFS7yER9NJ7ucNNlj
	rjReKc3XcT3Ung+LQw0tPnKS8sOt1mph0EhfuRyOQ9dyxCqBR5UnvzFTSwdf6EfVecKetLn+YZp
	nK2YEzDOlaPSioobR22F0O2u6IEAdCN0Xd0EnVsm0wcoHzBCNDraIooU+OkKtS80Dpp7fSyBXAb
	T8IJ+3IOfLMYOBuFhjx18Gl/6rSdmURby0Brgz6LyQkcENaOCPN9Jy9Hq8r9wlnbxJrkYWVLB11
	1a8Balkx8Ds8PpDnrZvVPib+87zklXRTpRVIllmhpRO6HLocMkYK1dkQDGkWa1NaUJn29p25IQv
	YDjiK8SI7+hpqG2laGJthBL4UHlJSHw6m2ZubMCJbjJk/fCK2z7QyRT7u/yA6iwZOp4c5Dy56k7
	YzBA99t2K0bvuhMMDysh++lpFYGvh5fhWnsF8RuAbv7LhxYFXgj+j8zigjGqPSEnNZljoTw6Uq0
	catz/SYgkBdBidB3kpTxiD3ZNcmoXz2eP66wVpQDj9CnJKpPEzw15gxQYkOktA7ssV/Wo6oP944
	AqSKE7WZViUevnf6seNFL+TkcmRDtqwHtIKI60gkEWlyV5erQvxbnkJoNYaPT5Wp5bYECmubheo
	=
X-Received: by 2002:a17:906:66c1:b0:c50:5ee3:e5d8 with SMTP id a640c23a62f3a-c513aaffcfcmr587681866b.24.1795369472716;
        Sun, 22 Nov 2026 09:44:32 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247138e0029c66979a611ac3c.dip0.t-ipconnect.de. [2003:f2:4713:8e00:29c6:6979:a611:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b001172sm336293466b.79.2026.11.22.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:44:32 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>,
	netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next] net: dsa: report a deleted FDB entry as no longer offloaded
Date: Sun, 22 Nov 2026 18:44:34 +0100
Message-ID: <20261122174434.975426-1-julius@bairaktaris.de>
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

dsa_user_switchdev_event_work() reports SWITCHDEV_FDB_OFFLOADED with
offloaded=true once it has added an FDB entry to the switch, and reports
nothing once it has deleted one. The bridge sets BR_FDB_OFFLOADED on the
entry when it gets the report, so an entry that the bridge keeps after
DSA deleted it from the switch is still shown as offloaded, and matched
as such by "bridge fdb flush ... offloaded", while the switch no longer
holds it.

The bridge keeps such an entry when the address moves: an address
learned on a foreign port of the bridge, which DSA installs as a host
address on the CPU port when the switch asks for assisted learning, is
deleted from the CPU port when it is then learned on a user port, where
DSA does not install it. The flag is also left set when an addition is
still queued while the bridge withdraws the entry: the work items run in
order on the ordered DSA workqueue, so the addition reports the entry
as offloaded after the bridge withdrew it, and the deletion queued
behind it reports nothing.

Report offloaded=false when a deletion the bridge asked for succeeds.
Such a deletion reaches every DSA port that can hold the entry: the
user port it is on, each port of a LAG, or for a host address each user
port in the bridge. The reports come from the work items in the order
the switch was changed, so the last one for an entry gives the state
the switch was left in. A deletion replayed for one port that leaves
the bridge or a LAG is not reported, since a host address or a LAG
entry can still be held for the other ports. When the last port of the
switch leaves, the flag of the entries it held stays set, as before.
DSA's reports are ordered against each other, not against those of
another switchdev driver in the same bridge: a deletion still queued
here can clear the flag that driver set on an entry re-created on one
of its ports, as a queued addition could already set it.

The addition has been reported since commit c9eb3e0f8701 ("net: dsa: Add
support for learning FDB through notification"); a deletion never was.

Found by an LLM review of v1 of "net: bridge: withdraw the
switchdev entry of an fdb entry made dynamic".

In QEMU with KASAN, with dsa_loop given FDB operations and assisted
learning on the CPU port, and a tc mirred redirect that delivers frames
to a dsa_loop user port (test-only setup): an address learned on a veth
port of the bridge and then on the user port, and a static entry on the
user port that is deleted while its addition is still queued (dsa_loop
delays it by 500 ms) and whose address is then learned on that port, are
both still shown as offloaded without this change, in 3 of 3 boots
each. With it, neither is, in 3 of 3 boots each, and a host address
that stays on the CPU port when one of two user ports leaves the bridge
is still shown as offloaded, in 3 of 3 boots.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
This depends on "[PATCH net] net: dsa: hold the device a queued FDB event
is reported to" (https://lore.kernel.org/netdev/20261122173347.791590-1-julius@bairaktaris.de/,
the prerequisite-patch-id below), which keeps the device alive that the
report added here goes to.

Trigger: an address that DSA installed as a host address moves to a
user port, or an entry is withdrawn while its addition is still queued.
Impact: a wrong "offload" flag in the bridge's view only. CVSS 3.1 0.0.
Until the fix: the flag goes when the entry is deleted or ages out.

I used Claude (Anthropic) to help write these patches.

 net/dsa/user.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/net/dsa/user.c b/net/dsa/user.c
index 5e72fb34e308..7bcf8d3b5fcd 100644
--- a/net/dsa/user.c
+++ b/net/dsa/user.c
@@ -44,6 +44,7 @@ struct dsa_switchdev_event_work {
 	unsigned char addr[ETH_ALEN];
 	u16 vid;
 	bool host_addr;
+	bool replayed;
 };
 
 enum dsa_standalone_event {
@@ -3629,13 +3630,14 @@ static int dsa_user_netdevice_event(struct notifier_block *nb,
 }
 
 static void
-dsa_fdb_offload_notify(struct dsa_switchdev_event_work *switchdev_work)
+dsa_fdb_offload_notify(struct dsa_switchdev_event_work *switchdev_work,
+		       bool offloaded)
 {
 	struct switchdev_notifier_fdb_info info = {};
 
 	info.addr = switchdev_work->addr;
 	info.vid = switchdev_work->vid;
-	info.offloaded = true;
+	info.offloaded = offloaded;
 	call_switchdev_notifiers(SWITCHDEV_FDB_OFFLOADED,
 				 switchdev_work->orig_dev, &info.info, NULL);
 }
@@ -3668,7 +3670,7 @@ static void dsa_user_switchdev_event_work(struct work_struct *work)
 				dp->index, addr, vid, err);
 			break;
 		}
-		dsa_fdb_offload_notify(switchdev_work);
+		dsa_fdb_offload_notify(switchdev_work, true);
 		break;
 
 	case SWITCHDEV_FDB_DEL_TO_DEVICE:
@@ -3682,8 +3684,13 @@ static void dsa_user_switchdev_event_work(struct work_struct *work)
 			dev_err(ds->dev,
 				"port %d failed to delete %pM vid %d from fdb: %d\n",
 				dp->index, addr, vid, err);
+			break;
 		}
-
+		/* A deletion replayed for this port alone, as it leaves the
+		 * bridge or a LAG, can leave the entry held for other ports
+		 */
+		if (!switchdev_work->replayed)
+			dsa_fdb_offload_notify(switchdev_work, false);
 		break;
 	}
 
@@ -3774,6 +3781,7 @@ static int dsa_user_fdb_event(struct net_device *dev,
 	ether_addr_copy(switchdev_work->addr, fdb_info->addr);
 	switchdev_work->vid = fdb_info->vid;
 	switchdev_work->host_addr = host_addr;
+	switchdev_work->replayed = !!ctx;
 
 	dsa_schedule_work(&switchdev_work->work);
 

base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
prerequisite-patch-id: 7d26d57478287c871bcb5eb5837534cf4a2b48a3
-- 
2.53.0

