Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938338;
	b=wGz0LJrs605pt7rDs7eCC2aPBXhME+5MH5fLjgbJHQdfhQrYKrYvo+M9qPuaNTmV7pYK
	 pPrxpHPvnJSdUKGdTbFTD1lgIavmeOVE8vpDq6R1HDKwOwk3Ck0zXcalkWXcWum6z5Icf
	 V9wxL9TFBQasJJbUniAhGmSegvkQt7nFRqJ62CWpCs5H5uYB/uPtVwDVvMKYa7rqFD8Jv
	 FJXeuWA75n5kI5hq9OncWViUHjMVXhGxnH1RmjtVnDfb66d69/2wFHIrWP8OUP/EPO4ms
	 Ax6jx1GfWVR5qCXPgpZK01xJ7s8Y3ksVrVmXam1ZJCT6turgKntsaanVMCgimJJ9QiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l1QoGpfYuoWprgioM1kY9kP75Z7uroDjcsK6QHLPstA=;
	b=QxQuF3K0m97BrBphYVbuEbgM1ADpxV+iYch2ZT9feASY9GrdChtPF4DRLlsx1SoauUA+
	 YkBfRwu2MmYPZ+WQsFutYeC7GJRe8kiK3iOgGoncbzkZDRO+1hLUrRfPaF4vzLOcVoxGx
	 fZYG9hUyuQiw2NXDAieqTmdBmP49jFfV69Icb0NcJ9l+gmvh3/gvwIzE4GqGP/zz5OR3P
	 r88jm9qqyybhjsfsKERyXNMxsAF/h0H52r8anbPr8axec2qrk8aOrYhIZZyZryrS/hyIB
	 icmoj5FIezaQwQ+A1P5mD4DEuEErslDLHpIupzUvcBm3MaGhtCWEBzKypygWZK0fKxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWEQYxW1;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F4606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 17:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282F4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PWEQYxW1
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b4bd3d98bfso180837a12.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 09:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794938336; x=1795543136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1QoGpfYuoWprgioM1kY9kP75Z7uroDjcsK6QHLPstA=;
        b=PWEQYxW16O38mkSaJMaahtPF/+Eky80WqiTdblJMO07adbco6MQoJlu0MMi7/qZ55D
         V31HeZVEuUq3Kz0Avmdi3/n7wink2ix3uZMdkZFxSw9dj/W7vYKmdEZwda86Jlbv8CZ5
         s6/UCI082JnHRubqyS29HPiMACOz8MJVFVOfK/V52Yky8oB34z/t3PqtIWuwrVofTMyF
         LzFnK3RNDSWZIjvC/yBcO4YUcXxBmdbU8A0nO83uEUtyD9GeLw5XcdWqrbu+VDQp/4Nk
         fyUSG1nCU2Yq2kAxudn1FTzTjKIdoQ/vahB2Yjyuw/es3yIgYbtRLgdwBm2jTrRX9JWs
         /iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938336; x=1795543136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1QoGpfYuoWprgioM1kY9kP75Z7uroDjcsK6QHLPstA=;
        b=bmJdje1zWqHJF/x6fCaONqwEAEMKuT7T8RAsFzZYPJD58RtSClv8IUSAtSEKx3aMWc
         J9h9Juj8iqf/MwotQ7WYmo7b0QThNn/xrBk5wJ0pfIRUIkQNfGw6UzeDqJEaJjpKtiZ8
         sF+UuBrzEu91komjitTJazvfcCzsAKZnxboxyHTwNzEJU5tvptOeCATJwnMEUad6cUmC
         X7LNoNCMvjUzAlxvLWZ4s16qc13JbagTS/p3M3ydW7DeXGfiCNYMLcgOT2SiFQlCr6xL
         qrGTJNB04pagPZ+0/v3LKXiCBXpxoZOTBpHTPseioe/i0Mx8V2rQa3ifT+rNUbj2Q7n0
         sOmA==
X-Forwarded-Encrypted: i=1; AL+hErEtA4QUT14XeaOSeX4VX2JxNwNphUaXT2Msx2VFOM8veEBZ6jtQK3NitNG1/8vi/lyXouviN30=@vger.kernel.org
X-Gm-Message-State: APuU4Z89gLlLRArZSzwWcBY3F8tHO9zXF9WmS9VeZyjzfMmYBLiNQolB
	O9Um+u8vQ1U3hl29EZY1ZiHX5pNfvzfC1B04Pi9IpucR3YYCivO17hI3
X-Gm-Gg: AYBFou1Y+T3kX2Tl8CsupFYeqLVk2PwqRahlylP1vpwgPtTX0e55mbUGSARR6tyZQWw
	Kc+jQXsm0qAfAzSiilkIEDA/5IrW3ZUUoNvGTUPtJWGWdfUtjpF2eORgTbM+7KI+FbNghOnC/AH
	DRJxRdEhkt1doV6KHMBmhHgMiGvPjnsGA0ABWvn+td5R7cpL4IKwpZzVoBf/n9mOEWB7cwMsZsG
	A5XVLWThQm1zDstYav/7FxX8/g3LKyjPSsG3ut8K5/pblL3mMHJrH1AFPniQBi9lC+XkTlFjy4E
	hRUAYy34xPO2m6t7HAdj9NSXlXOmBfXxuAFkMu44d90C6WOXJhpI9Pjph93qM8ZzBv6OiXPuuxA
	S0Zea73kHSWzHwzJIjJwOFfARTWlb0qRU5RDxwQpNsSVH0coo/eEdsuIcyk/wrFvhQQP5s/+6UW
	CTMohimGLtckse3Ch7s8EropPtjMrBuMahcEnfQ+sCY6iyDtby6ZIc1CZNsZKUfC7o9AWvR7cIV
	P+2PrgcGAvDLXwx5yRTmbKgRL2k2t8qtYXJ8aUsEsKvXMzKNhXpkeZyO0WatP1IFU+gVwi+oHIA
	g1tosxGKqEwQMlDi3I4IgK4BQJLvTAgcYHK7Kla4
X-Received: by 2002:a05:6402:450e:b0:6b4:73e6:dc9d with SMTP id 4fb4d7f45d1cf-6b887f1fff8mr18164a12.41.1794938336387;
        Tue, 17 Nov 2026 09:58:56 -0800 (PST)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b886a82951sm78666a12.9.2026.11.17.09.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:58:56 -0800 (PST)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v2 1/2] netfilter: nfnetlink_queue: only adjust bridged skbs that have a mac header
Date: Tue, 17 Nov 2026 20:58:34 +0300
Message-Id: <20261117175835.745796-2-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261117175835.745796-1-theodorlarionov@gmail.com>
References: <20261117175835.745796-1-theodorlarionov@gmail.com>
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

nf_bridge_adjust_skb_data() and nf_bridge_adjust_segmented_data() push
and pull skb_mac_header_len() bytes for any skb with bridge netfilter
info. A pskb copy of a bridged packet, such as one made by nft dup,
keeps that info, and the next patch unsets its mac header. With the mac
header unset, skb_mac_header_len() underflows and the push moves
skb->data out of the buffer before skb_gso_segment():

  BUG: KASAN: slab-out-of-bounds in inet_gso_segment+0xd5f/0x1370

Only adjust skbs that have a mac header.

Fixes: a5fedd43d5f6 ("netfilter: move skb_gso_segment into nfnetlink_queue module")
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
 net/netfilter/nfnetlink_queue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index a8aa7ad832c3..fafadd9057cf 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -1084,13 +1084,13 @@ nf_queue_entry_dup(struct nf_queue_entry *e)
  */
 static void nf_bridge_adjust_skb_data(struct sk_buff *skb)
 {
-	if (nf_bridge_info_get(skb))
+	if (nf_bridge_info_get(skb) && skb_mac_header_was_set(skb))
 		__skb_push(skb, skb_mac_header_len(skb));
 }
 
 static void nf_bridge_adjust_segmented_data(struct sk_buff *skb)
 {
-	if (nf_bridge_info_get(skb))
+	if (nf_bridge_info_get(skb) && skb_mac_header_was_set(skb))
 		__skb_pull(skb, skb_mac_header_len(skb));
 }
 #else
-- 
2.34.1

