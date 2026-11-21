Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220166;
	b=tzsY/9qRXIMCqBSGRFoLEyiW6KC/6XTfj1WfCEr7bD5e0AS/gkqMchRcZLvCGFyZF8pp
	 u/7Uidv5aPAvgcfSUvuLotu2psG5oSqmVUAmpgjP30Gty6mCZV5iT16b8mADwN2Bzs13l
	 AulI4nB42Y0dmi6SMd5X4E2f+TYSnej3tHM9vyEmCu27x7Txk2rHs0jrRDweC4TPYAwPW
	 1MjvsF9Wdm0koPprok08Qmp3DcKbP/oNDUjg+5f7h/aWu2ITbuRDxXDkiuP6NB4lp6PP2
	 N3ZAzYkk6zD40yKIYd1UijHMMrsUXPg3+oiht2LsFNgNJ/Fr5APvGVCiTOJGdkJcM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=xjJ8BKrAG2+EUr00KkERCKet/Aw0+xnaVXzr0akt80k=;
	b=g2nvbUdaNOUDblmfL7jfUAuaFavX8RJZu8w+h/X2OS7kL0MmDOPkdM+bb+XuUgWHmYwW
	 PpCBCpDpXgFIARK4KKfvbnTaLJGiFVMjFauaEYoS9IjTHANU3DFGih8Td98XPb0VJAVe8
	 W952MFanhqHYz3V1YHpfOz9nqSDsIdWb7gmtT9foKDXjPNTjeeCgy2WdxNv/e6HzW51T9
	 FKBb+btyAY3NftzxKXA2R8a8TW2S80pq7izhYCbqxVIF2CD4zO9nPGp8JsBGkyDPVOP+8
	 DpX7Vc2U8VVyp1maQJVE0/p9aBj2YJRTY+02xXOIghdKc+43uVkXfit+PCC1BEkSAkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3YjfnmT;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88471606A338
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 00:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88471606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W3YjfnmT
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so14627035e9.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 16:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795220160; x=1795824960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjJ8BKrAG2+EUr00KkERCKet/Aw0+xnaVXzr0akt80k=;
        b=W3YjfnmTeYU6/ms+XiRnQYBY9P1XpUjslz29m64EpgJ9VFHG62yjA4d/kb6k4SJ1Y5
         26y3BiwWQFIuVGhHhkFKfsH2IJkEWO0sKFEJxqVWoRg5cLNEcRWj1EQVon3EcRu6oKji
         T5tFLbXT9W+TmhwUCSFiXN2Glz4f9YFy3OldgK6HMSpGH569mjMlF6QdxxqiNJmW/ELH
         ND0KG/DSwAxwCyUd3NGNz6vBJkD3/N0wYvV1wyuELbSpslgm69OE25oESbZJX6q/3F0w
         3U5II8m9Y9uf7biEQny0OND/0eu1YGfCa2xjWRok81iQVxof3+IfSMKrsuVwMDbszAhT
         DAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795220160; x=1795824960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjJ8BKrAG2+EUr00KkERCKet/Aw0+xnaVXzr0akt80k=;
        b=EvVtg6o3N0yxmiuuokEhDiGxbRoxYuKzw2DUkzH191XERrqxtDR1VavzHQJDV7ZTXN
         AvwYjJVO63ee40F+PjlV30W+fno8iUEOxl5OZs52qCIc/7sT7xlO1NHMLXUnUJN+Kp8w
         I343OUOlzUi7oLQnICcptE7Z+4INvwCj9vMEIWjGQaSDj69i52FHqnDi1mKUmdlc25lm
         4CcOPgW5g3gr4tOu+u7Qlp1rt2+GXXPzY0mLyE78QZ6NYwwFUFZ1NrMKCxz83sLwU6n4
         V5hBQJQMtwAnueKyzrzZ8Dn4RIWnuiuEHmYhiZAvZxU2cLXf3rjwL5mNC65BAnPZdTPB
         Hyug==
X-Gm-Message-State: APuU4Z/cL8MGJz9LMYwfEglhLZH0VQb6vF3VcMAY22l17NFRG67Q/Zn2
	WHTPRB91LBzy5CwZCki06t0GxoiJJkmUfWwIb8IOqWm7p9PvWjGa6yHwCgwma5Io
X-Gm-Gg: AYBFou1wyXhdvVVo6XoTGMpJVZZTPrQ5LH/Zv2NtnbaoBG08Wk5wBXoakN54DvFWx20
	KoIpTrqKqILKv/bOf1jgRmnL7QboknsQZDsrAZbaX1whOZeFK2DH/ca3+Kv1pyUXG6VTKMpgmEq
	tNXinUxJHVLLcNe0izQYUFd91APBBIqMe219+RqzZirgTqUQepiDrUQT/cGEvCX2dw42dsbyuPj
	Jw6bWlo8CE1YEVllE5Te0tFVuyhq0Usf2Q2xfWrUUlVqZ+5OuGFmiswMxkKusnPHHiINwhkL5im
	tO9t9ixvZAoQrgPyoL8LnuAPu8tsscldD/ecmwH7XEGNSdYYiMVpuzq5HglXOUFAdvjo9ZcUsiI
	tvHr9ZunjG2RmhV+TR0nhijZcwwyIeiTeiSPGBgfGetzrLMr+6+cWtRkyGoscqJ2hv9gNIMjqem
	hpW+vJc5Gjp/hEsav/Gxe7Hnkq18xvluMLdQ75YA18c208bM89gdHq2x+dQaD+UJBuN9zz7UVV8
	GbobYNVFAolu3lBkhgL7IzPJiVuWNKg8mfrRlrNwoFR6+sKBKbX9Te8Y86HWacFWZi2KNOdVy+n
	093BqawstpI45CSZfy6D3+RvJ6i89jPkwsYXvDi1QpMgFldCGGKb++8dDnsdNmtKMsNJCegLNHh
	pJSrJaairTab0q8kVK5uZ4L09tr2hePen4eZLzMViY6F/OZlMHgK3AzNoxIY=
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr103676495e9.30.1795220159721;
        Fri, 20 Nov 2026 16:15:59 -0800 (PST)
Received: from qblck ([188.130.155.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm195388515e9.0.2026.11.20.16.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 16:15:59 -0800 (PST)
From: Artemii Mashanov <ralerrdirsardx@gmail.com>
To: netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net] net: bcmgenet: reject undersized RX classification rule buffers
Date: Sat, 21 Nov 2026 03:15:50 +0300
Message-ID: <20261121001550.732679-1-ralerrdirsardx@gmail.com>
X-Mailer: git-send-email 2.56.0
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

bcmgenet_get_rxnfc() returns success with an incomplete list of RX
classification rules when ETHTOOL_GRXCLSRLALL receives fewer slots
than the number of installed rules.

Return -EMSGSIZE when the next rule cannot fit in the caller's
buffer. On success, report the actual number of copied rules.

The source-extracted ASan/UBSan regression tests passed.

Fixes: 3e370952287c ("net: bcmgenet: add support for ethtool rxnfc flows")
Signed-off-by: Artemii Mashanov <ralerrdirsardx@gmail.com>
---
 drivers/net/ethernet/broadcom/genet/bcmgenet.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 4d2be2a..6a4a7fd 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -1664,7 +1664,7 @@ static int bcmgenet_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 	struct bcmgenet_priv *priv = netdev_priv(dev);
 	struct bcmgenet_rxnfc_rule *rule;
 	int err = 0;
-	int i = 0;
+	u32 i = 0;
 
 	switch (cmd->cmd) {
 	case ETHTOOL_GRXCLSRLCNT:
@@ -1675,9 +1675,11 @@ static int bcmgenet_get_rxnfc(struct net_device *dev, struct ethtool_rxnfc *cmd,
 		err = bcmgenet_get_flow(dev, cmd, cmd->fs.location);
 		break;
 	case ETHTOOL_GRXCLSRLALL:
-		list_for_each_entry(rule, &priv->rxnfc_list, list)
-			if (i < cmd->rule_cnt)
-				rule_locs[i++] = rule->fs.location;
+		list_for_each_entry(rule, &priv->rxnfc_list, list) {
+			if (i == cmd->rule_cnt)
+				return -EMSGSIZE;
+			rule_locs[i++] = rule->fs.location;
+		}
 		cmd->rule_cnt = i;
 		cmd->data = MAX_NUM_OF_FS_RULES;
 		break;
-- 
2.56.0

