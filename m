Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573618;
	b=J6//gse8KcSc5Y/zYCYcO5qbVkAjO+uMoXDdgoltqtXK9xmvltcXnzM7LVWgflIa6Fie
	 ef2EUtPC7+mD1fzjgfQ+/vFYqkTOEK/oIgsjrWudC+DtrS8UrbHNBFK6BeAnXyh7jKoLE
	 YyME8nQVomrbBNwBgydKxSmBkTnIuDXFLc9z3HjWTVgEXwq8TtNwwHKWHEvT9w5SvCibZ
	 EgoCkE/rbh1FTIR1JZd3wZ8I81ke8r+oexKYgJICIFGHRJ/P3sV/t6Q5bCS4kE3zBy+aO
	 ZsGQ/ibUMN8lt63V38f8NnGK3RVXJhUsMei5xhHcFYFyBMXx4F28GPmWefjMgHihrlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=nxEUfGG+ty5o7s1mxmsn/WqbaAcfsDPEfFvaxrj0uA4=;
	b=swZo/InlfcfERI+K43ssQzIjqfu7Kk2QqaVyBEisbAvw3QuPvoMY/C1RIGDW8yE2ebjT
	 ORRqZQ5batyj6Qq+5J3cO6lTuHmemlAcx+F1Rj71ygbDvLR2LmWBdeKZT3Xmtejj4rz3A
	 4R6vaPTbhqyxZUoeGvcjmC5MOTlpajauWPS+UTtxzdIMkXi85ReXbk1OIkh7clXYW/Nmh
	 y1aWEqiv/wPGIyCw2xKLrJgyDpqrezDXuY0NNpLSbbGt25DW7i+b4jm9isJ+r04mRNYD1
	 QOyfB50OCwNovXeMqqQwzbAu/3HwqLzv9XA6+KPglXMJjpNhwFoNVUl9t4CexSs7YOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mam+MHs5;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA8606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EA8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mam+MHs5
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5361e313e63so70598311cf.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573617; x=1796178417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nxEUfGG+ty5o7s1mxmsn/WqbaAcfsDPEfFvaxrj0uA4=;
        b=mam+MHs5rNAX6gl67MTAXxCSp6YdeTtR4BXMQZ1d3TuSr4mxNtFPD0jpZ0qyo9AUYk
         9Chc2u7sIS9c2qxed+yeMr0gA+edtNgt2R/HKeurFfy3DpaG8HJTIilIDrubFf9Qi7Qz
         lUJKIbFiRz601Ax0i89VMTQCPa7bGjW0wxrfUtWisYsVsZjTM1HJTNXk7hAPozH1u/fJ
         Rw+nlzJ+GJ6HFzsvff1TYhrWOF7xoR4N2cpceW+oqj3Zz6ACQcDMFfKJuUboaCHJNWhK
         KfhxEMoM6YMjnyUQ7TCVaUHWHnI37JmWxoD6qvkS1RbDM2FwHg1szAfuk/2p8lZ/CS4l
         Xl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573617; x=1796178417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nxEUfGG+ty5o7s1mxmsn/WqbaAcfsDPEfFvaxrj0uA4=;
        b=m80rF21lt6lddLN0WqFA9zs9OllYUKGAoB8HktrTMYbCRUVhpVjuDaSyQM0bR4/szb
         P1WUsKJximPHChCmlhpFyFowEbqZP/Of9OzsWWzAJBfzySL4dXI9FlMIi0Sb0XDT/Hi1
         UWrAnckW6Kjg5/udrtybgDyAmTOJKFgJxytxyGMGPC9J42VQ+yC7uS1ZaQCPCjJpYJkZ
         6qLh3Z+QXKBrdyVhDEtGUty9ZpWTUSgVdFZDEXpWdAAuOOdBIA4gO1Oo3RXk735/knTR
         fTWeEIYKJmNWLyR/9rElswJBybqXWvrjHQhW3EJtkrag4A977v39RoKeF84vB6eRkT2P
         8BEg==
X-Gm-Message-State: APuU4Z8JZOnoaBYFvxv7cwxsXxNrrrplvaE7yUsUzOEd83wNoQgXF9xR
	gGKlrU1VaZv3SX8w76m6ADJKseup5ftCEdmWnpN7ks7KV0T5qlYV0SVG1WC3DWKSmg3W0efnKA=
	=
X-Gm-Gg: AZFdTZdrFfOXqQp1u79mi6/rJKTiYIXfTbC+RrBdGvq3DKwxCPd5dYIYXUcsCER2caF
	QE42vA4Eh5430IKC3XrhW7lDvPtgn7NX7/tkKnLW/8mPC1i5iESgD8PIU7HcvpVSMYmSwjTMiR0
	9jg4ScwEYM/ffiOytsgzBNnKRnMxD+0YPmVYl8H+0pmu1sDzy31n2FsJUy/FDEHyb3vDKHH/baM
	sMvCBiY9z0o331tT03z0tCkbL9DhqB2svTKmxrQ2vdKiLw/EUL5Le7HbypawO43hUL6Il+MIto4
	GekC8uWTyDPegNNJ62DLZ9xmSwrqA7Y/Pg1SVJQax9ZOSUwx1WNd/k/v5fchhMqpR0ZBtbILUu4
	2DXe3uRzGHFqU26h8oeDD+sjPggB/p2Cq+Bn3ZwjzH49dkmQ8ikDqQVyTjZEhMca2h2oy9UVvUb
	q9CwrGC8qu4Y+xBB5R6frxfS5LejTOEYXpUIeKCLi+FVqCty1mCslCCKRYUeg2sfLkvsls4VMDS
	2EGFGpFW5FbcKTULVTvaWGdhiV1l04KyCzGyE114+Jjt63rfoWVlMc8InLml7em8u4CZCvKiHkW
	Rgt26eJKRJyvlbhA9Bee+y6kgiBxgR2ybtQPuebfA7PfJREaXw==
X-Received: by 2002:a05:622a:489b:b0:535:1a91:1d24 with SMTP id d75a77b69052e-55d76a203c3mr318792701cf.43.1795573617056;
        Tue, 24 Nov 2026 18:26:57 -0800 (PST)
Received: from Ixchel.lan ([70.49.63.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78807b5fsm141778231cf.6.2026.11.24.18.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:26:56 -0800 (PST)
From: Vlad Banea <montrealtango@gmail.com>
To: netdev@vger.kernel.org
Cc: hkallweit1@gmail.com,
	javen_xu@realsil.com.cn,
	nic_swsd@realtek.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] r8169: recheck the TX descriptor after a vector-map interrupt
Date: Tue, 24 Nov 2026 21:26:43 -0500
Message-ID: <20261125022643.1169045-1-montrealtango@gmail.com>
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

With the vector-map interrupt model, the TX interrupt can arrive before
the descriptor write-back is visible to the CPU. rtl_tx() then stops at
a descriptor that still looks owned by the chip, and completed packets
stay unreaped until BQL stops the queue and the watchdog resets the
chip. The legacy handler is not affected because it reads IntrStatus
before polling.

If the first pending descriptor still looks owned, read a register,
which makes the write-back visible, and check it once more.

Fixes: 677f8f8c4c5f ("r8169: add support for new interrupt mapping")
Signed-off-by: Vlad Banea <montrealtango@gmail.com>
---

Notes:
    Javen Xu confirmed that the RTL8127A, the chip upstream uses this
    interrupt model for, is affected:
    https://lore.kernel.org/netdev/d672fb6d16b04fb4a1c9b3202d276662@realsil.com.cn/
    
    This was patch 1 of the RTL8125B RSS RFC; the rest follows for net-next.
    Since the RFC, the second read is a continue instead of a repeated read.
    RFC: https://lore.kernel.org/netdev/20261111220114.3863505-1-montrealtango@gmail.com/

 drivers/net/ethernet/realtek/r8169_main.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/realtek/r8169_main.c b/drivers/net/ethernet/realtek/r8169_main.c
index f151ab681393..76b96f31017d 100644
--- a/drivers/net/ethernet/realtek/r8169_main.c
+++ b/drivers/net/ethernet/realtek/r8169_main.c
@@ -5228,6 +5228,7 @@ static void rtl_tx(struct net_device *dev, struct rtl8169_private *tp,
 		   int budget)
 {
 	unsigned int dirty_tx, bytes_compl = 0, pkts_compl = 0;
+	bool recheck = tp->irq_nvecs > 1;
 	struct sk_buff *skb;
 
 	dirty_tx = tp->dirty_tx;
@@ -5237,8 +5238,17 @@ static void rtl_tx(struct net_device *dev, struct rtl8169_private *tp,
 		u32 status;
 
 		status = le32_to_cpu(READ_ONCE(tp->TxDescArray[entry].opts1));
-		if (status & DescOwn)
-			break;
+		if (status & DescOwn) {
+			/* The vector-map TX interrupt can arrive before the
+			 * descriptor write-back is visible. A register read
+			 * makes it visible; look once more.
+			 */
+			if (!recheck)
+				break;
+			recheck = false;
+			RTL_R8(tp, IMR_CLEAR_VEC_MAP_REG);
+			continue;
+		}
 
 		skb = tp->tx_skb[entry].skb;
 		rtl8169_unmap_tx_skb(tp, entry);

base-commit: 846a6d0982be30aaba5268aac14a0c557d70cc23
-- 
2.53.0

