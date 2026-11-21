Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795288600;
	b=YqeNOfD7NV+zlm/Lw5I4FxW4UCINRHLu/Djr364p9NHPb3ie0dSnn5PjKbRzI8m6qpmH
	 ZqRA1vs6nYauPSNAVocppinjuY67dCqgSmzJUh7bULDOXFUfEFvi+z1L1HsVbO8+g0E13
	 5xp7D8L9+xfNJkdRvtqZaCBJiyjKlCA05/9cnGdZi4poX9arRPJ0SgZ2JiCw/GUL/WdR+
	 CrIEsDQFxZ5imeHnVc/q18YPMqJtk/TCIurFG8ZEJh5wiqBgdVyIULHLAwuwgzTRCogGg
	 hNCbVOtQqwllEAmfCtyrieGeouZngzxydHG8TRBnV4xFqgndN5pziBrvkXeddJh3wmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795288600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TgHFnT0Aq23ijZjgXPqXmSzHBW3c5oZyz2iVakOwM3E=;
	b=C5+SYcFyNJyrUTe/DBeh1WMc0LKDz2358ILrxfN23KRtrXrOUK5kK6HA3NJBKCi3ToTa
	 jwmVq8f14ZhaPykJlN741SxihgM3DGEiq52JBeEM/pO2RqHkbX//UUEL/hphH0ZrGt3XN
	 06TAyg149xGRDVjk6RCgQ3y1+xZr6opESg6Hyt83b8p/9NI5tJOlmri8dQITWrLIXxx4p
	 C5BM/y2Mo5PuQ7o/8CEqhNPGKZn+U3WOcTamJc5mJk9K4NlgeKq1X+hzkOz4F9BVfrKAu
	 HtI6XVDRvRmJ4U6hRIEJydBuYpa0hJL5sDjdsIOrbIppbMRdEaC7xGpmP/x8rE7QA/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Ir1fv6WM;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D7606A330
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:16:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449D7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Ir1fv6WM
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4322d310e7so359436666b.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795288598; x=1795893398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgHFnT0Aq23ijZjgXPqXmSzHBW3c5oZyz2iVakOwM3E=;
        b=Ir1fv6WM/+s/V2JDVfFhXhA8qufnuLFEQM2H7dzvoP3IBXQ26UKh57jHQzH6Ec3u9I
         +Cnq82E28lUBuhSzUxKhMnoj6lOGEX2ipOx8XebGv5qDsNuyC4FExPP/W3n+ykFwPKpQ
         ybRo4N9AfrF0s0cJtzZXuwDhrTABE38NponM94H8iPaDePNUG17l3gcB0ILuc9+M+cPo
         bQz/ACZDjxl0VayMYQFLrdyVnfsjPSbfcYb6XCALlUrmoZAlgJB4YcNmcPVIqLn7gpX0
         cwrV57WwBJAPtMUv6UmzYwNrxuWcCMLU1roYjrQTG/YNHSEKlvzKC5xSWaoT0wwboJaf
         cX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795288598; x=1795893398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgHFnT0Aq23ijZjgXPqXmSzHBW3c5oZyz2iVakOwM3E=;
        b=t4QGQqhqlbgtso77JqnIA6/L1w+nODseiAQTDhveS/MUEFXTHIbP7DvJC/pzJW7DIY
         9yWdb241Q6xY62egt9YsrLW5v3KaQxsWeSi/6YS4r5oQf7q7DwY7vL5UmHYsDmS+51LE
         l0qnweXawthjJ0l0b9rY6GGBVq7kcg6x+ouJLHQ4NcIhh7cwfX67OWOfGmxSUEqcm5Xd
         58YXh4GkxUjGzarrKxA8LlGh3h0Yrs8yPYSlAtNotZlPwKr4cksbytzkG/NdHduRgk+r
         9qKB/JQpNFzVj4pPaA1nJYJ52nw4njfNa5h09K9GCeDuxsGfywKpH+9CtW1x+2/MBZkL
         kzIw==
X-Gm-Message-State: APuU4Z/XPAHZNyfX5XKpSGQuO/7MnLbO6T9LxH7kczJDC1nnFoZ79f+m
	XWSaCc4LEKXk4OT1NtDtjr47iNNq1j934kJWwC8ggq23G2KDJxyeHC09tyunoUk4EQ==
X-Gm-Gg: AZFdTZfa84blCMP9v9S6/MNn2Q3F11dX3EM0aEae0onQiiYyh0KNUYVBYaMmbXdfmlo
	zwH04oQN1qwy7bKoGWmNEfnata3wa7r4u2QOXBu9ap4vucltTbboXm+TiJyg366Dn7jVksWeWkg
	J/TR1yyuMRAyYQgvZ+X18TNkgPpHCU+Qm6xgHQAy17cZ/4U97yYOoxGAyZirLW4VpzlKW+G3ZCE
	EMACjcZ4CFXAvYs4DGg2TR/zjlTbWzi/sxHpGnDrWw9S3T9YKGtYmoPtTYBBLNXkdcYzS6FHZy/
	GysaBO5MgGIleSvX47jjMFYgg7+F9QTmH70sxl8/9pM+H8VW+oyn8IqGP4+BDs37kkW0Qlv47Eb
	COg8vh3FXf7kTY8oQa2S5aD1DTN0NZzLbZNZJgOAq9+GKjxxgnJF/EFCSGT5q3aATkWbQ0nVp5h
	tizrOKhVlDXN1Pe7BmkhwouZpW6pl+HQoPODn42CzLsQMWXLf1wxusjeG1anUeNoQ+yiK+JD39E
	uBW5xRVSp1sVe3qJwZKzrWLjZ0AIrq9yrfpFzn3DPGcvxQ67jDHqXG2YXYRF4IgjORSMAPZQ8eQ
	q6gvkdyxa6vbtXBfFI6XLuXjkgUpyn4mlalzpy+4tkNo1Ti8cYju/6M0J37u3+3THI3eBDavDNj
	oj1SAPu3SJAMqAzZgu4tASnsv+vKCtMFGS3iYxw0usBSKHyEx/+IwRhY4sjPV9LwAf/gj4Jf0A/
	jBCKA/ZhiRug7sOIdaPSK+fgXbCf33rvX837VuRQBAu7HgkTd4du2AjytgDeWzuU4BvRisr4e0n
	AvdDWTFfRkNkJKNE1R0hzD0SCOLj6m8iIcUki48U+LG6HJ/B8oSVef5btflufs8Mzam+UodKwVb
	np3zkebMIyQngznzVvrRQZLAllEx0P/VVOdrQa/qcbUPRN5PpPcWmS1073PKFG3rXli/26rAgNK
	a
X-Received: by 2002:a17:906:3d21:b0:c51:24a4:1dfb with SMTP id a640c23a62f3a-c513ac7edecmr423647466b.40.1795288598612;
        Sat, 21 Nov 2026 11:16:38 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f2470dfa000000000000000a27.dip0.t-ipconnect.de. [2003:f2:470d:fa00::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae66674sm226439266b.15.2026.11.21.11.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:16:38 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org,
	bridge@lists.linux.dev,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>
Subject: [PATCH net] net: bridge: withdraw the switchdev entry of an fdb entry made dynamic
Date: Sat, 21 Nov 2026 20:16:38 +0100
Message-ID: <20261121191638.1724620-1-julius@bairaktaris.de>
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
BR_FDB_ADDED_BY_USER to br_fdb_update(). The offloaded flag of the
entry stays as the drivers report it.

Found while reviewing how DSA tracks host addresses for bridge FDB
entries. In QEMU with KASAN and dsa_loop given FDB operations and
assisted learning, an address learned on a veth port of the bridge is a
host address on the CPU port. After "bridge fdb replace <addr> dev vA
master dynamic", or "... master use", and the deletion of the entry,
net keeps the address on the CPU port in 3 of 3 boots for each command;
with this change it is deleted at the replace in 3 of 3 boots for each.

Fixes: 927cdea5d209 ("net: bridge: switchdev: don't notify FDB entries with "master dynamic"")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.

 net/bridge/br_fdb.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/net/bridge/br_fdb.c b/net/bridge/br_fdb.c
index b601245ad923..377ca8341029 100644
--- a/net/bridge/br_fdb.c
+++ b/net/bridge/br_fdb.c
@@ -996,6 +996,16 @@ static bool __fdb_mark_active(struct net_bridge_fdb_entry *fdb)
 		  test_and_clear_bit(BR_FDB_NOTIFY_INACTIVE, &fdb->flags));
 }
 
+/* Called before @fdb becomes an entry that the user added as dynamic, which
+ * br_switchdev_fdb_notify() does not report: report the deletion of the entry
+ * switchdev was told about, if it was
+ */
+static void fdb_switchdev_hide(struct net_bridge *br,
+			       const struct net_bridge_fdb_entry *fdb)
+{
+	br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
+}
+
 static void __fdb_update(struct net_bridge *br,
 			 struct net_bridge_fdb_entry *fdb,
 			 struct net_bridge_port *source,
@@ -1005,6 +1015,7 @@ static void __fdb_update(struct net_bridge *br,
 	struct net_bridge_port *old_port;
 	struct net_bridge_dst old_dst;
 	bool fdb_modified = false;
+	bool roamed = false;
 	unsigned long now;
 
 	/* attempt to update an entry for a local interface */
@@ -1032,6 +1043,7 @@ static void __fdb_update(struct net_bridge *br,
 			br_switchdev_fdb_notify(br, fdb, RTM_DELNEIGH);
 			br_fdb_dst_write(fdb, dst);
 			fdb_modified = true;
+			roamed = true;
 			/* take over HW learned entry */
 			if (unlikely(test_bit(BR_FDB_ADDED_BY_EXT_LEARN,
 					      &fdb->flags)))
@@ -1048,7 +1060,12 @@ static void __fdb_update(struct net_bridge *br,
 		}
 	}
 
+	/* Only from netlink (NTF_USE), with the user's flag in @flags */
 	if (unlikely(test_bit(BR_FDB_ADDED_BY_USER, &flags))) {
+		/* After a roam the deletion was reported above */
+		if (!roamed && !test_bit(BR_FDB_STATIC, &fdb->flags) &&
+		    !test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags))
+			fdb_switchdev_hide(br, fdb);
 		set_bit(BR_FDB_ADDED_BY_USER, &fdb->flags);
 		if (test_and_clear_bit(BR_FDB_DYNAMIC_LEARNED, &fdb->flags))
 			atomic_dec(&br->fdb_n_learned);
@@ -1262,6 +1279,10 @@ static int fdb_add_entry(struct net_bridge *br, struct net_bridge_dst dst,
 		if (flags & NLM_F_EXCL)
 			return -EEXIST;
 
+		if (!(state & (NUD_PERMANENT | NUD_NOARP)) &&
+		    !test_bit(BR_FDB_ADDED_BY_EXT_LEARN, &fdb->flags))
+			fdb_switchdev_hide(br, fdb);
+
 		old_dst = br_fdb_dst_read(fdb);
 		modified = fdb_update_dst(fdb, old_dst, dst);
 

base-commit: d5b89d55a322b632e2b465b392a4c1d9d338db9c
-- 
2.53.0

