Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095681;
	b=noJdXdPNjXvcvFxv7JIbrmY5B/J9/Fy3fLkQVKjk6kHNHy0GsOKYdr+BB8ksYAg2s6i4
	 klTn4YgoirbtG7J0LG4wWEYHWNcr6/eX5oQ2/Gse4st0nXXyfX9PmM8j1MU29lha33e/k
	 SFxR3rTEDFWCeupJlZleeqgHR7v2Ic8kwCfe2Z76iLUALS313Bbi3mSmIoaQUdU9gOShK
	 ctVLfqS8gsUJVTe7YD1q5YjgrwVHvFH3Wa4WkygNCaR6n2aTmAXE3I3YHhPh3PRVctqLQ
	 vThf9cNEbeXdJZK/OnVN1Pn0bWDFYZ+3duRPDHow410rvVljA4bmzPEepWVOnOTn4rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=epsMv7ubUMbNGL97hoQb0bSNJhUxNTty6N7abdxd6yc=;
	b=E7KE/FUo0EwTQ0Rps3GVKj+5epGuOIffPthiWOZ1wNYf46QYYUm4pwOWanBAUFuQxd42
	 lHP2Du7f4p3qq7KSvrTWtFhaptYE2a1xXPQ/Lk3wjcaThrNVtMjbrAstvvsupYkPnz5E3
	 fmXcJEfYpltFmKaDurxymTMGpeD16FCKsfDYHPwnAK7PC205rskB2YSIeAYpzdKBXLLaM
	 /kJiQmBxqAE+5xo1JzjfoskTNkAu6ZZ+KDei/1YYvCNepJzgr0kdulrrdGSLiAbSuigq6
	 TJIPY9JnKCYTiwXsixxF4/dDQ8rf9MuONJeikDAmmOMz68+S4Ho2j6zpB31UjfmPLSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oseP62wl;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE460A3804
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:41:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DBE460A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oseP62wl
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c51239b0e3bso178635666b.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095679; x=1795700479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=epsMv7ubUMbNGL97hoQb0bSNJhUxNTty6N7abdxd6yc=;
        b=oseP62wlfKUASQ8EyQShWBDIsidX8ySxDvtbL+MsM1me9ZPWI8DKGmkmvKKnYIy0OH
         8zJ7TiMF1ucvWVZEmY6QKtl3/s6o+j+Wv7AGyvRkB+62cEDMysGtmHwzk44UYThpU9Zp
         D47Ai7AJ4yNpY6cNvahucMpRHj8vLRZeNsyAbXyxRkuoXRQifA+hwW1GIQ7C3US3tJ3c
         Cl6Lhb1yvkSC5g8HGZj1bcOC0EbYF+eztpeh/zBylf1uZqDuNpfBV/cc3maJhyhsbPtp
         mcE/FhZlA6n/u/5fW9sKBPDGqVDiSditLdMRuu0GX3XwPFyXDszNXeBpAtEl6+928Zxb
         dXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095679; x=1795700479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=epsMv7ubUMbNGL97hoQb0bSNJhUxNTty6N7abdxd6yc=;
        b=xFo3XuAoW3t/mISh4lbxtm31GdgIy1aMyPWRRRthmELqTOR5k9+jnRvcFCP9jHEUgG
         mtkMFU1fbGIejmYZLwYSXWniGtmwkgaBP/3RKQFvv2tjIOTrgoVhrvobkF/Q+bhra9zy
         ag+iXagMmt5KcGFPgeYCXU81+OUM2Vx2yD3sIwfoxoN3R2TTvPg8vxw9KIOMrTDo+rIc
         0p5WTpVeshM9EBh5OjRDQBP47v0nVPDboAtia/ryYzRVGIiViRP+zqAbp+DvJbHs6q8Q
         l3j+uMiSDq/G3KaDVhv/JJItB+vDWpsJLnMg6VPcY3QdR5E43jjgnRNc2OWW7jN/mYlG
         Mp9g==
X-Forwarded-Encrypted: i=1; AL+hErFC2w/2FlbMjt3SPfsaQyIcb17dwoJUJgLj9LXbfxOk59d9sgeYs3lOOhU9iN1m5clLAeCGtBk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oXGnw2PxCNcnFm9yB21STPpBTIirbOmldnk7z7DoUhRQUvxVg
	YDaSa6YY86z39/HpKqTRqNVMA2xNly/HHHpFWca8rNbKSZyTvQU9oPb/
X-Gm-Gg: AYBFou2YtcQp7g2LfO6eWkTF3A2qRKt8BgboJklGRvpMf8t//aZq2rW2jN5bDullUTk
	Cn1tv7Y5kHTpZNYhP/YtfzL9hW6Bu+9JR7K0L/ZkANHiMXw7wOOkp8naXWDmiZnLqQQ06pA+CMo
	c5U6Toe0Vm6uU+3YHE8wG+uQCDp5UipzHaU79psJ3EXRNQv1UjdxEOMISJ6pE2LbKVWT1qSC7HF
	MOeDpGrixeLn1KpAYIi7KN2wqOB1okhno9IDB3HOFIJ4ejWc9sAa+jtIskdNb10MeWjHac8spfi
	6TZQ4nXsRjd17EcZhPhz8PPUBweQZM4UMpStZV9sQQp+o+elR54sA0nS2aJ6Sdb80GKPN2zH6p4
	dslRcib6qKqvCKVkPZComTMBsEGxdD9LdRu9mDGKuaTpblna7QkfsViEupza+nhxWTr/z/K0+RG
	i1uW/OqN+gudeywj5Yf0G6k555CLRmxclAwkchzY2najrZ6BiTAQtSGVRB0POlzWvQX1YAYMjnD
	eplqFZMcCseEvbBNKArTKFweWc6q4DmVB+b0i9h3GhznpjH2y7VI7JEWOsKq+M/HMuta+1EdtSP
	RIZnnUgbu+rDxI4IJ1TJtuID2IVm9XfpM3WxRj4tsld+2Ly2VdQvCcv0XkAAvthC9KH/qDjmHR7
	4uaWTf4v1jV9j/w==
X-Received: by 2002:a17:907:c8c8:b0:c49:cf3a:a324 with SMTP id a640c23a62f3a-c510e148c36mr562345166b.22.1795095679437;
        Thu, 19 Nov 2026 05:41:19 -0800 (PST)
Received: from VivoBook-ASUS-X712UA-M712UA.lan (user-31-175-182-49.play-internet.pl. [31.175.182.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c512346fc3fsm105582666b.59.2026.11.19.05.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:41:18 -0800 (PST)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yongzhao Chen <yongzhao.derek@gmail.com>,
	Alexey Immoreev <luixo-public@luixo.me>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 4/4] net: dsa: qca8k: bound the data of a management ack frame
Date: Thu, 19 Nov 2026 14:41:10 +0100
Message-ID: <20261119134110.15048-5-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119134110.15048-1-kuncy7@gmail.com>
References: <20261119134110.15048-1-kuncy7@gmail.com>
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

qca8k_rw_reg_ack_handler() answers a management read by copying the
data that follows the Ethernet header into mgmt_eth_data->data. It
trusts the frame for both the length and the layout: the length field
of the frame allows up to 32 bytes while the buffer holds 16, so a
frame announcing more than three registers writes past the buffer into
the fields that follow it in qca8k_priv; and qca_tag_rcv() made only
the 2 byte tag linear, so the copy reads skb->data without checking
that the frame has the bytes it announces. The handler runs for every
ack frame, whatever its sequence number.

Size the buffer to what a management frame can carry, and pull the
announced data into the linear area before reading it. The pull can
move the head, so take the Ethernet header again after it. A frame
that is too short is left unacknowledged, so the read fails and the
caller falls back to MDIO.

An LLM assistant (Claude, claude-fable-5-1 and claude-opus-5-5) helped
write the change and this description; I reviewed both and built them
with W=1 on arm64. The management path was exercised on a QCA8337
behind an IPQ5018 (GL.iNet GL-B3000) with tag_qca.

Fixes: 90386223f44e ("net: dsa: qca8k: add support for larger read/write size with mgmt Ethernet")
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
 drivers/net/dsa/qca/qca8k-8xxx.c | 24 +++++++++++++++++++-----
 drivers/net/dsa/qca/qca8k.h      |  3 ++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/qca/qca8k-8xxx.c b/drivers/net/dsa/qca/qca8k-8xxx.c
index 76c0f7c97b..9a7e90f48d 100644
--- a/drivers/net/dsa/qca/qca8k-8xxx.c
+++ b/drivers/net/dsa/qca/qca8k-8xxx.c
@@ -170,6 +170,7 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 	struct qca8k_mgmt_eth_data *mgmt_eth_data;
 	struct qca8k_priv *priv = ds->priv;
 	struct qca_mgmt_ethhdr *mgmt_ethhdr;
+	int data_len = 0;
 	u32 command;
 	u8 len, cmd;
 	int i;
@@ -190,6 +191,20 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 	/* We can ignore odd value, we always round up them in the alloc function. */
 	len *= sizeof(u16);
 
+	if (cmd == MDIO_READ && len > QCA_HDR_MGMT_DATA1_LEN)
+		data_len = min_t(int, QCA_HDR_MGMT_DATA2_LEN,
+				 len - QCA_HDR_MGMT_DATA1_LEN);
+
+	/* The tagger made only the tag linear. Leave a frame that is too
+	 * short for the data it announces unacknowledged: the read fails
+	 * and the caller falls back to MDIO.
+	 */
+	if (data_len && !pskb_may_pull(skb, data_len))
+		goto complete;
+
+	/* pskb_may_pull() may have moved the head */
+	mgmt_ethhdr = (struct qca_mgmt_ethhdr *)skb_mac_header(skb);
+
 	/* Make sure the seq match the requested packet */
 	if (get_unaligned_le32(&mgmt_ethhdr->seq) == mgmt_eth_data->seq)
 		mgmt_eth_data->ack = true;
@@ -199,13 +214,11 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 
 		*val = get_unaligned_le32(&mgmt_ethhdr->mdio_data);
 
-		/* Get the rest of the 12 byte of data.
-		 * The read/write function will extract the requested data.
+		/* Get the rest of the data.
+		 * The read function extracts what it asked for.
 		 */
-		if (len > QCA_HDR_MGMT_DATA1_LEN) {
+		if (data_len) {
 			__le32 *data2 = (__le32 *)skb->data;
-			int data_len = min_t(int, QCA_HDR_MGMT_DATA2_LEN,
-					     len - QCA_HDR_MGMT_DATA1_LEN);
 
 			val++;
 
@@ -217,6 +230,7 @@ static void qca8k_rw_reg_ack_handler(struct dsa_switch *ds, struct sk_buff *skb)
 		}
 	}
 
+complete:
 	complete(&mgmt_eth_data->rw_done);
 }
 
diff --git a/drivers/net/dsa/qca/qca8k.h b/drivers/net/dsa/qca/qca8k.h
index 79754755f1..b7aa0d832e 100644
--- a/drivers/net/dsa/qca/qca8k.h
+++ b/drivers/net/dsa/qca/qca8k.h
@@ -396,7 +396,8 @@ struct qca8k_mgmt_eth_data {
 	struct mutex mutex; /* Enforce one mdio read/write at time */
 	bool ack;
 	u32 seq;
-	u32 data[4];
+	/* The data a management frame can carry */
+	u32 data[(QCA_HDR_MGMT_DATA1_LEN + QCA_HDR_MGMT_DATA2_LEN) / sizeof(u32)];
 };
 
 struct qca8k_mib_eth_data {
-- 
2.43.0

