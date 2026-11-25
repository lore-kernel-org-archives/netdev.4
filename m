Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636663;
	b=MZ7lz/z0SQNqJxWz51Tc8glCE/oJeeLTxAVHcwoFKLupkkCSsIWUvcTbUnBvPynFDyl/
	 IopYIXSmrPYcaGkolpfCoT4wL++EKRFlpE6Jet6+kRFkXWnYXcDB8R5fv8OFrPyfz2sIe
	 5uOfIy5Z8JCrJPk6Urenk1AvvG1XV0jHGqyAxwnEcLIAPeOvCg2f53I7hGjrpuDmSChEc
	 mflPrucx6Ipy1B1tYIL0y+Kv6x4YIa6NyWnZL1GsdtYcOZGtx0Ww2jUZFSiKwP/7mhl0o
	 sPNQHVzyWVwwaz9cZS8Gqbm3q8dPIht8sxg+gpVlQLxP+Kqwuy+t/v5dX84ResjL+Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=z1Ch7toSay5RAO59Zv8Z5BnunRVmaYyzvcole42LG4w=;
	b=MTrer0SctyR/EYApH5AKpVAz+6l0tjb7RLb+71weTYissOwaNFGr6ncoTYHxDGKRrg4p
	 6DIAYqzVXq6MVluib7KRq6DO/gHM7kzF96KkpR35ztuso3REOs73+sNljuWvwF8eDQhYG
	 gW51zLpVyOJrkB2AJbkORZ65QNI4cy2DIkZZG+XBcdRqFjWS9mjr7moTe+hPVMaEGDlQp
	 zCrdZn2COmKN+isaAlgynNV9rVxE1r21TZX++XLgg5Kn5/t44CZFwqY+pMAb+ncVpyX8Z
	 1rZ8K2tAIwUmo/aw4G/n9ZfuDb9jym1sHvB7KBK3VLx3Qerri2+NMEKCXPGS47zk/kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=gLTfcdye;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FF3606A332
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FF3606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=gLTfcdye
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b546061d58so14142655c88.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636662; x=1796241462; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1Ch7toSay5RAO59Zv8Z5BnunRVmaYyzvcole42LG4w=;
        b=gLTfcdyeliU/SIidmo2Q2PGx6AFjKRsUwtBbq3c9NxKgDz42m+T4bgGqZ+DyDy15la
         KRvi57AXHY44tFkHqpqhRS9xSgEhEERs1/HsqhKHlfJYr2uPa5zshTkMlT3RKIkM3Eo0
         1CIKE41Eiubwc3L6p9mKeTth3O6RWXBnDjzS8XzyNFFP7jAxJuNbqkgSZO114T9vIU4n
         tR8H6XGjr8Ob//tNrYCJ0CETIvvzvl0vFELkU+x2b6RBCKj/CTgYLjr65iXQpE0iybzX
         DlhomEGjt3jgxOuL6OsCCm6m8TBXaEAlIN0CVUBzfP0ca7itmKNpx0NlA4pmlHxJ9SpA
         bJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636662; x=1796241462;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1Ch7toSay5RAO59Zv8Z5BnunRVmaYyzvcole42LG4w=;
        b=f09tlmiHCkCHCwlVZ1XJS7cSz2Rm/PfkfGpNwZkV3YsnITt1HDHdjApewAi/k2lrHV
         Tjghb6EilMjlRmN7Pts9fXDCknK1gCsqp/AaDioApBhf+F1NY1Q/6Yf2cZ2GNcMZv0fT
         aRcLhaprOh82t5HdWtHJadevr2Wt14iDjm89mynZsc1Dbuua9J71/V4eTgXlS1UEITZ1
         qzSxo/X6Bm5/yOoJu3nXJOIbv8FI5pN1MCZinzDMpCtiP8KXhOFbQdVhTeDSRzXFTBkq
         vEE0M/xWg/hXTI4Q8YrTkE7yd0B5guO4iqyYAVbAJq0tr0906XOZTUjVx+O55Vn7Op1N
         Md3Q==
X-Forwarded-Encrypted: i=1; AL+hErEdBCHBPLrJ56jZs3vS4UOnGMFTBDrkg9C6MRFrYwlh6cexXUuJEbwvnmqxpx07GZ2wgzcf+1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3iz4M6ZVFyHTw8itPpADy5arBDhBclT138u90pTBG2CIy3BmC
	JHHarZsR3CLZ5wBEXvZiOTG2OWFcG3Icl4aPBGSLqQjOEJvsQESYGIQkP+HxGUDfT/A=
X-Gm-Gg: AZFdTZcfnsEhnsnY8HEbFUpFq3dnOBBsR7fxnUXR7kKPi9wNSvT61w21xEJbkVNdzPo
	f4FYg6O9PthZjLIRV3D9OOoR5jLApXdtJ9B7kqx8qoiv2mrjLn6NRcw5k7vrG5CYQfxb0/kIskq
	R3rkyO9dnty6KmdCCN535bFdys+JfMpYKLu9YGgqGYXgEMsIa9Fptc3qHk9EGM/WRfgP4qLnKYw
	mBgx258QdtVPlvFgF69VNWCBwdWJ0OLMocbIgBl7svd5ZMgaLwmcaccDvoggBQHE/zwSku3/n+J
	IY/bPzPryMmAjqnq+iad/rjRzsXj9Z3qwUnhXNmHs2Yma83IUr116dSXZ9QR7shlnb8s9ydGVSN
	k5h1dFi1+dnAZ8tjzd95AShEEVV/J/Ac3iyqs6dyciaB1qrUIUFjpz3xg3ZJBsFfBibCL6rBWi9
	dJpQdi2ZBshWtIv7BlTgdao1XAId5P69l3C4lkM1JBilY+kyxpnXMMP/iIR85L2lq4X5RhdMcxx
	4hJKf3iie7gFxwYK3kXE7U0t1f1hluZy7mNyK0WJKJ32iRt5Oe68Se2gBP0G1S0jKuGTmaJRx+r
	KIq42YUwNIoBhgf3GqC/SI3+0C4kxMHD2lUeAcURsZI/LIy+e8ORS5YgiJDlD2STnc1sJtUdhwt
	jo6sL/YlXsVj5japzXobz3DMtsQ==
X-Received: by 2002:a05:7300:8811:b0:386:d86d:d445 with SMTP id 5a478bee46e88-386d86dd49amr1569803eec.36.1795636661951;
        Wed, 25 Nov 2026 11:57:41 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:41 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	horms@kernel.org,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH 6.18.y 1/5] net: init shinfo->gso_segs from qdisc_pkt_len_init()
Date: Wed, 25 Nov 2026 14:57:31 -0500
Message-ID: <20261125195735.57472-2-artem@trailofbits.com>
In-Reply-To: <20261125195735.57472-1-artem@trailofbits.com>
References: <20261125195735.57472-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Eric Dumazet <edumazet@google.com>
Date: Fri, 21 Nov 2025 08:32:44 +0000

[ Upstream commit be1b70ab21cbe8f8bb8ecf39eb34880882252773 ]

Qdisc use shinfo->gso_segs for their pkts stats in bstats_update(),
but this field needs to be initialized for SKB_GSO_DODGY users.

Signed-off-by: Eric Dumazet <edumazet@google.com>
Link: https://patch.msgid.link/20251121083256.674562-3-edumazet@google.com
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
Stable-dep-of: 7fb4c1967011 ("net: pull headers in qdisc_pkt_len_segs_init()")
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
 net/core/dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/core/dev.c b/net/core/dev.c
index e4216b78a1a4..97a6ea8fcede 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -4126,7 +4126,7 @@ EXPORT_SYMBOL_GPL(validate_xmit_skb_list);
 
 static void qdisc_pkt_len_init(struct sk_buff *skb)
 {
-	const struct skb_shared_info *shinfo = skb_shinfo(skb);
+	struct skb_shared_info *shinfo = skb_shinfo(skb);
 
 	qdisc_skb_cb(skb)->pkt_len = skb->len;
 
@@ -4167,6 +4167,7 @@ static void qdisc_pkt_len_init(struct sk_buff *skb)
 			if (payload <= 0)
 				return;
 			gso_segs = DIV_ROUND_UP(payload, shinfo->gso_size);
+			shinfo->gso_segs = gso_segs;
 		}
 		qdisc_skb_cb(skb)->pkt_len += (gso_segs - 1) * hdr_len;
 	}
