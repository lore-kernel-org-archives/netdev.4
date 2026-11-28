Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795855005;
	b=TuyIq+qR1sQ38A8/B/ydznMjyjBJ+KrZd6eW4IAVJlF7XgUnAX+p2EFd/QygbGclS/ym
	 DIhm7vCWo35BB8PI/XPe/m+q09ZwEEFxAnmAIXL+Ru9LexscmEXBvhKLwUfGcvJQNo6Iw
	 yo/y7MFPWbB545BeWrz1vH9b/Zu+9k7itbxXuvfSXbDBR5hf6PDVEI+6b4/VVPo6OVAxP
	 e6+4KnQkQI62ag1USpMbwzIlTi8ImLAW4maAbANIIut4fCuepL7aVlxvbbH0qlZFg/v0i
	 /CPYXV4cQIcjV67ofOjhO5NLE256hvd7GP1UjeM4FVyT8Ey395XXbtj/C0Ky/hef3rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795855005;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=58KUfz/Hnfqtpf4UjWDMVSAjWIwuZ4LZczcS7Hrh/9M=;
	b=c+DdbS4BU2uPZ8lYxgfqRmQDGOsFzswtlTnxFHfQxCFbI736ysHNemqW0uRXL+VQI+mL
	 vei996qYfJnvkCC71RV4Oh3DbmtKj0hKcPbx2ZUsdtajHB+fFSfxNm4OeK9VY6pu7fCuV
	 FwIH3ZJVl4p7bfH96mswUH3cvjotbKZUdPBQ75zwz1rASoA2iSt9c0wmPCnQasRT3cmWS
	 orl6VvnOIYwLtElrgaafXdYEhAk37sGZH8nmFIKRJzUp42kCxg3svOTeX4l58BNAA0INL
	 diV4s3wIHREnCoR9/TBokyECt2/E9BjAjDqgFsPQg2N9GK8tj/GiJYmk7HmN2IvP7QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wh0Ym4Zn;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD4606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FD4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuyanghuang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Wh0Ym4Zn
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a064f294cbso6526675b3a.2
        for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 00:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795855004; x=1796459804; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=58KUfz/Hnfqtpf4UjWDMVSAjWIwuZ4LZczcS7Hrh/9M=;
        b=Wh0Ym4Zn1ClGj0MpHFaXRzG8ZFmNt9pdE/lqVTtLeHE3cMQp+XUQUA4G4m8ktsNNbh
         9kRKY0bEyjgpPcatUxYcA74KRKkoCuXFaaP1BfJ7idjbVOzSYJGFWUZ5qGUlXd6u99W6
         FNs1ZtUCoienLxe0PooD4+sz+uCI6sObemEYRAv9Jzzz5dqKw8ADVbe+m4fAzkiABJQG
         PH+PuzM8gYshsPQ5HbvyeohU529RuIWEJp51uYBf0SjzB2VT2BWqaRaZeijUrDB4UBL7
         drMQQiJ+a3GVmKo1D25LPraq6Aln6D4q7JqMzpnPR11nuiMwGMYCqWezs8aSYR2gs9nQ
         bTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795855004; x=1796459804;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58KUfz/Hnfqtpf4UjWDMVSAjWIwuZ4LZczcS7Hrh/9M=;
        b=oQ2hvdI1XB7KcJ60Jber18ilykWY8BaEfR8WfYZxBqw9DpNGZG5/c6aCV+Pv5zzSY9
         qyK6Mg1z3ChozEaAwfO8KGlOA4WJxy4HQTbZuEi1tkXTxARWd1KbFmXnsCnKtb0dvkHC
         DK37u6dQxlkMDFNfXQFrm4tX+cZcETLJAqVNKsZNjqVsANnPO6082WEnru6YJPYFB25O
         cm/unYF7Z2SL5EODSc8OVwk40ystO/YHNUuWyrJX9Ydip9ED0Gn+ifLDpr/p/PEun283
         SlokpvPlUp/p2pqDOuhbXtduMRSqthjwWDF4STgtRJG8A47p2YsbmMkppvxGWIfd1Dx+
         l97A==
X-Forwarded-Encrypted: i=1; AL+hErH+YJmwGFMF8/iYUjTYPkmz93AyVe9C2rBnyZLo/6uV7Eg1xLCjUn1+mFoUByt106F2r/73uac=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8fFDC+C+jq7QdXWdIOR8YAgZHLz3oNov5fjqyh6FLksCvN7A1
	uz48D050nKIWWuubqcYKEJ6U8aUVEGEqso0hXeztkHMSYMvrXZnwleFYZ9JhVkPcx6GEVXvPWYc
	mfAdn4+BNPcWlfTxw0ZTgKiNLEQ==
X-Received: from pfob25.prod.google.com ([2002:aa7:8719:0:b0:8a0:91b7:e7b9])
 (user=yuyanghuang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:b53:b0:89f:b166:bddf with SMTP id d2e1a72fcca58-8c87d80c2bbmr27061204b3a.58.1795855003866;
 Sat, 28 Nov 2026 00:36:43 -0800 (PST)
Date: Sat, 28 Nov 2026 17:36:39 +0900
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261128083639.1404522-1-yuyanghuang@google.com>
Subject: [PATCH net-next] net: use dev_net_rcu() in __hw_addr_changed()
From: Yuyang Huang <yuyanghuang@google.com>
To: Yuyang Huang <yuyanghuang@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Commit 646cb8868bd2 ("net: add a generation counter for dev->mc
changes") bumps a per netns counter on every dev->mc change, and finds
the netns with dev_net(). Not all callers hold RTNL, so this read can
race with __dev_change_net_namespace() updating dev->nd_net. At worst
the old netns gets the bump, which is harmless, but the read is still
lockless and should be marked as such.

Use dev_net_rcu() under rcu_read_lock() instead. The address list lock
alone does not satisfy the RCU lockdep check.

Found by Sashiko AI review. Theoretical, not seen at runtime.

Link: https://lore.kernel.org/netdev/179185709988.434549.15422498299449004512@kernel.org/
Signed-off-by: Yuyang Huang <yuyanghuang@google.com>
---
 net/core/dev_addr_lists.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index b6f25e487984..700d9247ac0c 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -30,7 +30,9 @@ static void __hw_addr_changed(struct netdev_hw_addr_list *list)
 	if (!list->is_dev_mc)
 		return;
 	dev = container_of(list, struct net_device, mc);
-	atomic_inc(&dev_net(dev)->dev_mc_genid);
+	rcu_read_lock();
+	atomic_inc(&dev_net_rcu(dev)->dev_mc_genid);
+	rcu_read_unlock();
 }
 
 static void __hw_addr_count_add(struct netdev_hw_addr_list *list, int value)
-- 
2.56.1.839.g22a8290db9-goog

