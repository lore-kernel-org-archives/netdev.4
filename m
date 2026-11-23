Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401357;
	b=DCjNairFH6yvXOfh7oOUUvi6pkZvUr6pGWIRK/RCYfUAxwrlveDAHdDXM9DgH7Ho7/wN
	 0KoeqVE/h4sWLSCSWerjOgTNLUdKeLAKn+T4D6YgL4uK0SqeWnOe++OSnJ0mOPaKZlLvZ
	 nwuwX/d2wvTSde+iVogTm7vJjDw8C6EeFZVcVqj7Iz0CMWCqE46UisioFVN90XQBvnkAd
	 /Z0HYBXoI0DVNtQ3MxJVnqtFKRB3ejiUs7yY8xc2g653YchU6h3O3goqEp0D4nEniEb/G
	 nB4PDhgs8ny35ll6hP8biNRajwnieGZtUcrLsKYq01eZyCbIDtFNROn85tdiON86w3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=st5pGIMSSsdG331Dh3ZbAxiLCbZswNCMENZiPvwdzYI=;
	b=bPABw94AnTxhEi8hbqsBq9SZvxSt0u5huMMXLYWLc88NofAO1eSQRmykqF3zISzqiw/n
	 aEyjMghKKGbuDWalOMZ+7qIWF7D6oA66gaxMtEHpBM7ePPDzpJBOc2lz133uktkwSK1TV
	 i4cp99GyuCx+2r1UTU/r/J1m7l4zCIi6rdcjCnGBIMBiKaUtR+VCZgpoVg896GMWDkB2/
	 CJBuo8ZOuzczvyRk5+Oa7fmTc4Q+iHzussZwplSA31YLlMihDrFle24sOf5UYNUpT2cJi
	 qE14GAdgvihXFYv0U3h+SHBqhvO4qJqNgV/KO486a4haccfC5aBtp4nsVrHugIL9pUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Pw8PEnm0;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAAB606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BAAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=Pw8PEnm0
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2f04e3bf46dso18466095ad.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 18:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795401357; x=1796006157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=st5pGIMSSsdG331Dh3ZbAxiLCbZswNCMENZiPvwdzYI=;
        b=Pw8PEnm0wUjRCQLP0HEtvFtvQLfUyDMiAdPXJOvN6sHBNf5HMrHgvDqJGIlYs1mVJF
         vfSgeNVWvHXvrK6UjZ9r4ydWowzg5zlqLVEjrom9370KYwmJgRnrBLNEV2mRuM0ReQik
         q4qrr9yQboX1xPDqycGtlMWXD8bqR1ej2xzXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795401357; x=1796006157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=st5pGIMSSsdG331Dh3ZbAxiLCbZswNCMENZiPvwdzYI=;
        b=ynkHyeot8i+mcjjcC85X1BJ7elawsphDaZXqyDJf5rdKLgvSxIbqFvYJHTXuJJpyLm
         qiJtxFM9/B22ph8NaeOSStb8TDQKTuD3UpQuw/8973bO6+eGC+p92IkO1nZy3YG/ItKf
         qi7tFJ9mBiBrK6dGLLuoYk0dk2VPgtMcf0ND7M0qyDPWz7kn/2RHddrmQxC0WnDgkqoc
         6cQY8gUrjVdH9jq71KpQXZPYdLOkKXB1ITCYS0AUVz1zImqFpErxawnMDmh1BQyJBps9
         0RTUAubAD+XOS/8CN/jJCxj6mU3iDI1AreV/AfNTny2CS8Hkn2rszv5CjSyZSjFkwM/t
         ec8w==
X-Forwarded-Encrypted: i=1; AL+hErEpqdGpoDpB7UWifYbfUmIWo7jxOWokJgg65nvFJj1d75H5jJXdvVx6+/bF+fDbtv1/6JAkWcM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j+l5HcHC2CB3XmIX0yhwK/2DIMwZThRSBvaGRIToSPOsruNS7
	FFh3o2+PxzjDLC3tNMGOb5hhYZKk9nLWyHPxLBwb1kOik3e2iBQNVDCKFCcvfuUn08w=
X-Gm-Gg: AZFdTZdRjlRZ3sagluEaK9KCgPUwkHTfzJ41P5Jr6W9PAa7LyH0pDh5mHn+atNlA6mw
	zH9Jh3i5TTIxCMpidN/N10m0FNgGsNxnrR29Hz65GeSufB3mbPGsElWKUDizmML0zXSbiC7tRRc
	oxVLd4FdJzXAgt5y3RKPO7wlFRJvpjSXAnhSXPtFf3tnhNoXR1vF0CRcNQ/nbpe/H8r7h5J/US1
	FIbTBQkxDwD9OSn3p8lQ5a7TOZIp/3bqgODepZDU9EF1uCB3oRfBvr2v8K1FQ/360pqA8ThEUnT
	L57ltmRnPm6GaI6ysSMhZZuhypTNyUeCCJXGOM9dMxwfUcF48HpqiNAFFCdRPJggPnqv8jLdn9h
	jEABUcPu2C2TTtIc7ElWoTsBD2CNMl6h3lagb1uaGOHZ4r/dUT7Jl0Wz6tZxUd0O4KJ9Bzt2m9d
	u7AcDD3Req1XNO7T23sW1sdiaJKDVsvM5EbzzeJnzYrFbkjHoulQGaZUXZiizK1Zm6Lq1jgje/z
	bOFD4NeYlq+OwQzg8KgSbr7Ik/nSlMKGgABmX/nJmFvmVrfZavvY/QX9BUa6EUDv6euz6CvoR/p
	EBeGiDFBiumFuBliPN4uvTmVvEsYeg3fecIxg5nOdulv4RaulT8Ki85prt9WU6OD/lzOn+/Dsxo
	f3HzUQ3f+tuO9j3QVlvo2W//IF7D4/Dc6cSRMK7zGh0QhitugDnxl6zgFslNZMoYC
X-Received: by 2002:a17:903:32cc:b0:2e9:4175:3079 with SMTP id d9443c01a7336-2f03f1cf4b6mr119824125ad.21.1795401357008;
        Sun, 22 Nov 2026 18:35:57 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm43609925ad.59.2026.11.22.18.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:35:56 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org
Cc: oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>,
	Piyus Kedia <piyus@iiitd.ac.in>
Subject: [PATCH net 1/3] net/nfc: llcp: fix the 16-bit truncation that overruns the SNL response skb
Date: Mon, 23 Nov 2026 08:05:48 +0530
Message-Id: <20261123023548.3351531-2-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123023548.3351531-1-piyus@iiitd.ac.in>
References: <20261123023548.3351531-1-piyus@iiitd.ac.in>
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

nfc_llcp_allocate_snl() accumulates the allocation size in a u16 while the
length it is given is a size_t:

	u16 size = 0;
	...
	size += tlv_length;

	skb = alloc_skb(size, GFP_KERNEL);

nfc_llcp_recv_snl() builds one SDRES TLV for every SDREQ TLV of a received
SNL PDU and passes the total as tlv_length.  Each inbound SDREQ costs three
bytes - type, length, tid - and each SDRES it produces is four, so the
total
is four thirds of the PDU and about 48 KiB of SDREQs drives it past 65535.
The sum then wraps, alloc_skb() reserves a fraction of what is needed, and
nfc_llcp_send_snl_sdres() puts every entry of the list into it anyway:

	hlist_for_each_entry_safe(sdp, n, tlv_list, node) {
		skb_put_data(skb, sdp->tlv, sdp->tlv_len);

skb_put() runs out of tailroom and trips skb_over_panic().  With 16400
SDREQs the accumulated length is 65600, which truncates to 64:

  skbuff: skb_over_panic: text:... len:382 put:4 head:... data:... tail:0
  kernel BUG at net/core/skbuff.c:215!
  RIP: 0010:skb_over_panic+0xcd/0xd0
   skb_put
   skb_put_data
   nfc_llcp_send_snl_sdres
   nfc_llcp_recv_snl
   nfc_llcp_rx_skb
   nfc_llcp_rx_work
   process_scheduled_works

Hold the size in a size_t so the value that reaches alloc_skb() is the one
the caller computed.  A request that large may now fail the allocation
instead, which the existing IS_ERR() path in both callers already handles.

How this was found: by AI-driven fuzzing built on top of syzkaller.  Its
analysis was then checked by hand against the code, the fault was
reproduced
on net.git main under KASAN, and the patched kernel is clean on the same
reproducer with ordinary NFC LLCP traffic unaffected.

Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
---
 net/nfc/llcp_commands.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index 80a00938c..0a3d66e6c 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -542,7 +542,7 @@ static struct sk_buff *nfc_llcp_allocate_snl(struct nfc_llcp_local *local,
 {
 	struct sk_buff *skb;
 	struct nfc_dev *dev;
-	u16 size = 0;
+	size_t size = 0;
 
 	if (local == NULL)
 		return ERR_PTR(-ENODEV);
-- 
2.34.1

