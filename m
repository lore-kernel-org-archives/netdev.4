Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795375279;
	b=VnQ4bqan2QYHwUduOBn5hErDLhd3zpg3YBCsPUxpzJeQAay3GBqdtNhc1MPJi8CMPN82
	 /AJO6J1ZIs7VykX/N7Yj5BnTfcwI7+2y6MqFuzrHsrGxkGv9ldHys6DchUFK4gJZYgZuf
	 71JF7clIACUfDLaD8sRS/aJItBkh7FaAxMCRWmDWmerIjEr6QwQleE+Vy1QlOEBWON3rz
	 msESP2oKQeA6ZWdq1XRGftwXDvbkJAWlkOD8HOfhAMQ7UbJD3UxdkkzvlkLbL7dm3Wsp9
	 9LIj9JFt+LNTMv7GduQ9BU3i/ym3VB53nDDl2AptSkRC9RadtRg1ewMV76ddAGleqkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795375279;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YvX22Go66K8PzO602+a4bbxhWUwaAgDMlVTyOM3+06w=;
	b=koYtS7bDJjx1DDpKWkxu08rO0gJO9ApSokREvMkOMuaC6eO2drPuQM7qv8ximR/XM3eK
	 yKEFRJIxf6wNFBYzwTY5QQvli1PJxL7fl+YPhxuuPnziWCGu/8gLAFE/S/F0N8fBKHVEh
	 si/DxnJJ1Za333vpHGXUotwzreYN/PakjahWh9vFnZiBhbl7RYmKvdQayIPoLqy1tcgVc
	 WqBYy3etfJS9xbrKzV7kGJpdh+cbXBAcZ8Fs796XNCj6RJV8aPy7TqP7nB04LMgXS5GQa
	 /1njyTWJSKJeIfLQ+DQZsPOpRD47aXIAuOWBgvjoXGP1MDBvFNUCXyn8bgReAzeHKEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kSgD+EVc;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12189606A338
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12189606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=kSgD+EVc
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c5126505cb3so331311066b.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 11:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795375277; x=1795980077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvX22Go66K8PzO602+a4bbxhWUwaAgDMlVTyOM3+06w=;
        b=kSgD+EVcKGMFIxSg2ENAXpKtvdMfYkd+3aNeE4xPWjz0MLBrdWV0smRD7swUhTseow
         EjgBotesYSXSuSR1qa0MXC9AMOaHBw7p/PStwWUsrSEPVogAEUQV/RcUQzvhVII5Z4U3
         i/zHu6+ygutnN2VacXLY2pmc0/1yuJNDccozep7d5xVcC4tRW/62K4cLLwhwY8/Qm5vy
         rW1MnWOOzNAApWJHt5AY5186GcjVCmbGKfT0XjL7UQhiUNSaUY6kQdhI75ykMZwq62lI
         D1pW04wDTWRlWDB48rr2D/63M1Hg8xh7HxWNFO5NrI/dbZvOqPCDoILfx9zYMntXIgkr
         XWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795375277; x=1795980077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YvX22Go66K8PzO602+a4bbxhWUwaAgDMlVTyOM3+06w=;
        b=DZVsP1eIfAoiF4M5ZQovb/irDHAFfQFn/0/ruh2l0ORvyGwb5/ZWtuw7Iwii1ssCIJ
         eaItPzLpDQY8y2MomDYvb9hbdV5PPKocuFVPVA9EdNk0gSl2qZNlyhIUdF96lGpcS8LO
         Er4BxP5ED/H5xrigUY1KvkON5LD590mfsGi8k+HvcqZRGY9oWs7i8iEfjzqmSDf5HJXd
         enFBoi5H+iJUnFqUc9Wzv1Wcn6QLgS5sH3XP4uzNpMdlwsJqJnuaDQAWyyvEeEBvmx3H
         1kHhi83l+8L1Nc/66nyYbYJ86hGCY8XOLSnzZE9ST7N3Ua+ctvPsZbh8QfggqKDcK3NA
         FFhA==
X-Gm-Message-State: APuU4Z9MwD1B9DxCRnyy+K1W6jMmutWb0ePCDUnpU+X0Ku+FaPbAc4uI
	DQkrj8tZrSNEi40mkXz+9SfGAQrfCYOR2JCzKEXroUpSvJF+nhNLFrbJtrZdZ4H1og==
X-Gm-Gg: AZFdTZeUINSVI1yHCYVO3jac3qs4k081Ij1RNYWZFuOEsWg/6dj6Vpj3UtDEhZJ3Hko
	svSkJoXhl4n5tg0hy/OqKrq8FuN+NaZTnjWIucUJ9H7J7Y6600zz0O3x4DZZnzR6H2WdfOOCUxA
	JsqQa8MwQNP+p9DaoxEGwSmNpFIfGBDQEOgCrWT2XC/vWNJF8CoJs6PlAxx0HqWXTd4jGWc/Aws
	c5P/YmzN6CyL+c2V+5NDmYNAt0OtR7yAbuIMoq05VI4lU6gQ8rmD3/TWUgPyC0UpJ7qm0627kp1
	nzp9xs5wNGA7MtppdsxGPaF1ZzhAG6ohRDqdNILPBAZj3TABpSSu8AlXwLDzKehGjyAgF3eeSNH
	1vX8mc7HDeTDOCamQQrXMPQe597Mfw/b3A+Sen8/8miQwjrQvxwKhD1L4do5YiCVOGdipgrvp+U
	EIYeqSBJF5aLNdHDpHKQ+y9iUozLjatiC8JrOlK4eeZHFjpO9H2hzBHieSIIi0ahyVEhjed2NWh
	3C2bRFzE7ayS/936subradmaRXSiIr5QzzocW+1S9eLnGZ+r6yboVGqpJSTx/HJLMQAZWky6WKZ
	qb4sqoJQUoEkfnYBlc1AF57EYVWJyIZrOLUzIrbEebFHk74US41B8SU2524D4ACzz1GAEnti0uM
	YgiUhRcZaKHPH7Wo4NfVtHDj0y4xjpTmlVXW+zkzZlFlWED03/RqIfBVZVV/jbSEO1D3Nv2OA68
	nuX+cnZJyLfWXzF8tQk6YSPDuoVgfe5yZQEoiGkVwliQIoI5U6jml1AsTiaZJfM/1s+YgNGfYhe
	Twn9b8obD04CUknBlEoYPY0d0cTO+sRrgtvAJq1ZnVKLJXJADOLwcayD7fv7EOq8Vtjn4/LASDK
	q9qIST7fGSePYyqwdpqlreU6L5iPWxjoFd4xjTp4D7FPrtawM8n+vMk=
X-Received: by 2002:a17:907:a88e:b0:c42:5363:38dc with SMTP id a640c23a62f3a-c513ab0e03fmr802808666b.25.1795375277441;
        Sun, 22 Nov 2026 11:21:17 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24713a7000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4713:a700::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afeca8dsm338808566b.75.2026.11.22.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:21:17 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>
Subject: [PATCH net-next v2 1/2] net: bridge: withdraw the switchdev entry of an fdb entry made dynamic
Date: Sun, 22 Nov 2026 20:21:17 +0100
Message-ID: <20261122192118.1204290-2-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122192118.1204290-1-julius@bairaktaris.de>
References: <20261122192118.1204290-1-julius@bairaktaris.de>
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

Since commit 927cdea5d209 ("net: bridge: switchdev: don't notify FDB
entries with "master dynamic""), br_switchdev_fdb_notify() reports
neither the addition nor the deletion of an entry that the user added
without NUD_PERMANENT or NUD_NOARP. The user can turn an entry that
switchdev was told about, a learned one or a static one, into such an
entry: fdb_add_entry() does it for "bridge fdb replace ... master
dynamic", and __fdb_update() for "bridge fdb replace ... master use"
(NTF_USE), which marks a learned entry as added by the user. The
drivers then keep the entry they were given, and since its later
deletion is not reported either, they keep it after the bridge has
dropped it.

Report the deletion of the old entry to switchdev before either path
makes it one that is no longer reported, as br_fdb_update() does before
an entry moves to another port; br_switchdev_fdb_notify() tests the old
flags, so only an entry that was reported is withdrawn. Entries with
the extern_learn flag stay reported and are left alone. The NTF_USE
branch is only reached from netlink: the packet path passes no
BR_FDB_ADDED_BY_USER to br_fdb_update().

Clear the offloaded flag of the entry with the withdrawal. Drivers set
it once they have programmed an entry and do not clear it when they
delete one, so the entry, which stays in the bridge, would otherwise
still be shown as offloaded, and matched as such by "bridge fdb flush",
after the hardware dropped it. br_fdb_offloaded_set() now assigns the
flag instead of testing and toggling it, so a driver report that runs
beside the clear in the NTF_USE path, which does not hold hash_lock,
cannot invert it.

Found by an LLM review of the series "net: dsa: fix host fdb
refcount when an entry roams".

In QEMU with KASAN and dsa_loop given FDB operations and
assisted learning, a static entry on a dsa_loop port and an address
learned on a veth port of the bridge, which is a host address on the
CPU port, are offloaded. Without this change, "bridge fdb replace
<addr> dev lan1 master dynamic" on the first, and "... dev vA master
dynamic" or "... dev vA master use" on the second, delete nothing from
the switch and the entries are still shown as offloaded, in 3 of 3
boots for each command. With it, each command deletes the address from
the switch and the entry is no longer shown as offloaded, in 3 of 3
boots for each.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
v2:
- net-next instead of net, so without the Fixes: tag; the commit that
  introduced the filter is named in the first paragraph (Nikolay).
- Clear the offloaded flag with the withdrawal: a "master static" entry
  the driver had offloaded kept it after "replace ... master dynamic"
  deleted the entry from the hardware (Nikolay). br_fdb_offloaded_set()
  assigns the flag instead of toggling it, so the clear cannot be
  inverted by a concurrent report.
- Call br_switchdev_fdb_notify() directly, no helper (Nikolay).
- Drop the comments in __fdb_update() (Nikolay).

v1: https://lore.kernel.org/netdev/20261121191638.1724620-1-julius@bairaktaris.de/

 net/bridge/br_fdb.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
index b601245ad923..4af091c19244 100644
--- a/net/bridge/br_fdb.c
+++ b/net/bridge/br_fdb.c
@@ -1005,6 +1005,7 @@ static void __fdb_update(struct net_bridge *br,
 	struct net_bridge_port *old_port;
 	struct net_bridge_dst old_dst;
 	bool fdb_modified = false;
+	bool roamed = false;
 	unsigned long now;
 
 	/* attempt to update an entry for a local interface */
@@ -1032,6 +1033,7 @@ static void __fdb_update(struct net_bridge *br,
 			br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
 			br_fdb_dst_write(fdb, dst);
 			fdb_modified = true;
+			roamed = true;
 			/* take over HW learned entry */
 			if (unlikely(test_bit(BR_FDB_ADDED_BY_EXT_LEARN,
 					      &fdb->flags)))
@@ -1049,6 +1051,12 @@ static void __fdb_update(struct net_bridge *br,
 	}
 
 	if (unlikely(test_bit(BR_FDB_ADDED_BY_USER, &flags))) {
+		if (!test_bit(BR_FDB_STATIC, &fdb->flags) &&
+		    !test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags)) {
+			if (!roamed)
+				br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
+			clear_bit(BR_FDB_OFFLOADED, &fdb->flags);
+		}
 		set_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
 		if (test_and_clear_bit(BR_FDB_DYNAMIC_LEARNED, &fdb->flags))
 			atomic_dec(&br->fdb_n_learned);
@@ -1262,6 +1270,12 @@ static int fdb_add_entry(struct net_bridge *br, struct net_bridge_dst dst,
 		if (flags & NLM_F_EXCL)
 			return -EEXIST;
 
+		if (!(state & (NUD_PERMANENT | NUD_NOARP)) &&
+		    !test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags)) {
+			br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
+			clear_bit(BR_FDB_OFFLOADED, &fdb->flags);
+		}
+
 		old_dst = br_fdb_dst_read(fdb);
 		modified = fdb_update_dst(fdb, old_dst, dst);
 
@@ -1706,8 +1720,8 @@ void br_fdb_offloaded_set(struct net_bridge *br, struct net_bridge_port *p,
 	spin_lock_bh(&br->hash_lock);
 
 	fdb = br_fdb_find(br, addr, vid);
-	if (fdb && offloaded != test_bit(BR_FDB_OFFLOADED, &fdb->flags))
-		change_bit(BR_FDB_OFFLOADED, &fdb->flags);
+	if (fdb)
+		assign_bit(BR_FDB_OFFLOADED, &fdb->flags, offloaded);
 
 	spin_unlock_bh(&br->hash_lock);
 }
-- 
2.53.0

