Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438154;
	b=B5v5YupfS/6cLeGUdrAv+0AUGOnHfNHOV/xTEglGG2b88oIU7ZNNDObuOYhLkKqjVl9c
	 9fPdx7EvfFGkH2RUyLhyzlm8wW6GGg8AWpQHeXLrKhTlCN1iD22lGufCCbKLFOMHHIeC2
	 OcyYVClLqTXJwdcJ6KZ64DiTu9cx/0Qs1mf+Lw0IqB6vKbeF8/VHIBr60jS2/bPp21STt
	 YgoL+AIrcZDegpmrPf6mWClAQdDTcnrGZ5LCYoPuMxXzdyc1sZ3Th0aUJxV/JvXBxwSAo
	 EFmYgNOhq6RBx1i3Y5nyNVVdSCf0qvhMa3V9if0Lmylx/uOMAdf/iyVICqisliXkWOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1Hgxzjm1uOtQ/P84+Doh9X7srtoVpZDOxSxaVIw14Og=;
	b=WucRmW3GETRWfAus7wD0egGOm588P9Jj0jF+i82tBqEwFbA9w1zMKdDOBIw1dHeChHJN
	 7wzBoCn7e8Pylniph+AiJXkZbXjhnSg99aDPk3tg2uCPiQ3cSiBbrJo1/Gvq8VOJ6San3
	 s3NjkuqecRSr8X5z0ivTmsg2nl99yVXnYIqPLw6BeK2ng32asB+9lO8bYrZ4J4PW1xzio
	 yqtWXUMBFhbFY2god3PvElrgkFBnohKMPJkrmY8wyyRQaAlS1xR6L6N9nwuUCzWXaQB1V
	 KFunZvXFBk0d01grQ+e3D5K9kbBq9oqGnbUwH8S8UT0tp3ZQC6vDZgxV9kf9O/hvnbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Blr6YDc4;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCCA606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCCA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Blr6YDc4
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso23937605e9.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438153; x=1796042953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Hgxzjm1uOtQ/P84+Doh9X7srtoVpZDOxSxaVIw14Og=;
        b=Blr6YDc4vUL2o+spSlBE+pYyjG2ZjWv9xgd0PQoVlnES+BzT623KzqNPkROOuR0YcJ
         Tahd7EeqVO+5sbT5DkHX3SWQ9zAu/qneIEPiCS/gtpVsnjgve/E9Y1wBmgi0NiZcIgQY
         1QZXQfwHkhRbWjHUga1fkoZlyR5OgTBqzJnySDDOlg94QoSWChRcuNQ0wNFwxs9XbRpm
         oyL1z8YvgYaayd97V6vHl1nZxwOjovyIqrGqSElAzpCaZGFnx8U+GdwbcoDXCL1kjcaq
         zDGRM97RI0LiQRMmZgi8h/rf/1JxoDnU46C/ZhUMGf7nOaVPcmVHIHQB8g9V3Ss6frSV
         VSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438153; x=1796042953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Hgxzjm1uOtQ/P84+Doh9X7srtoVpZDOxSxaVIw14Og=;
        b=tbzgadKrqslos3owTdYIC+LrikJCn7I5arzoh96Ys92LNMLhzmUhlHCx2eSDRTESo3
         UdIidMfEv7f+v11rF9F1uqtehjH9ov3NlaA6aMBFqXySrB5PaSrmyx/9qEKa1JM5baov
         BQL8VEgfkfKKUyRcGuwO/VIpXHbCZk58S/6Ci25X/YjmQekxo4KEIACXcyElnGrXF/cV
         +6YisIRu5flqyl0dzSF+t5cOBdQIr9CEp+aua4XErOvYxIJcokkKofRNjzoqbsi4aCH0
         bLRw7nTwF9s8ckWWucg1zKqaGXMG4DvuxGj2FrWBPgXEtzZW+3cd4Gp/nTJm6MlEqXZe
         Mv+Q==
X-Gm-Message-State: APuU4Z9UuxCk6GOBQyxvUTcrD9ZaIm4HOza1RgDAKe9xAP3EhCacOJ9D
	qGJs7YjJ/DHgguB2E/JXW1r0r9jPHFaPk1uHWTrSzlMJStUAbBRoH0Th
X-Gm-Gg: AZFdTZfFBAX/NK4YPXQC82ebtXFcNZJaCSwAUEHjmmGhXCueNenLJAX3LSQ94Xk+ZVa
	ULOYsW2Utka4VYJdeEMMerJEnmwO1gWB/v89FGWxdyeLCpNMRNYIUC7a/PIOJzXumM817Oce4KT
	FObd3w0zOoaqieQ8V7058IEK+RbXnDaw39Bl6+kbhpte4bfp2/8YHrWf6VVMwd3YdVjgKphqqOh
	3pWE/PuzDtWwfiLCQk50RhnKferEitLyoMu1DBwqhYETb0Awl0b65IIdNyacWh8lxKVK0t6OSNG
	yJ6F/k8os0Nk2Bo7Kxlr2HSi3KtSlwIIxhmWOyT2AcrMoCfABYS3r/EGG8qIZ2TS88LPJIvi/I+
	tvDBnwWm6WyjFw5ovAQBV3nryEcMsCPQb9T6URIr+yn6eqE3dp3m6EMY0xB0kJ6hGD0Uq3mtX61
	cdRmCbVrty4aDREoZveJud51i8kMPyDIG4C7b1tlqO9Mb8BPuE3zpcLSjiEXFTr2Yp7Sh9ahZAF
	bzTuWbi8ED79qOxqtzU1Z9+/8hGgDCt5bGWsgwvrAKWoAgtl3gNpcf9Mjj4Fi97KpsXr7hDLFXO
	XeJ71D1d6gIe6gnq13sRluUg87Qka3WRs52hGzA=
X-Received: by 2002:a05:600c:4504:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4bb888284d7mr242846645e9.31.1795438152673;
        Mon, 23 Nov 2026 04:49:12 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm165097045e9.5.2026.11.23.04.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:12 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: ronak.doshi@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	u9012063@gmail.com,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net v2 3/5] vmxnet3: limit the XDP MTU to the rx head buffer size
Date: Mon, 23 Nov 2026 15:48:53 +0300
Message-ID: <20261123124855.1021-4-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261123124855.1021-1-filzador@gmail.com>
References: <20261123124855.1021-1-filzador@gmail.com>
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

With XDP, rx ring 0 head buffers are page_pool pages, but the length
given to the device is skb_buf_size, which vmxnet3_adjust_rx_ring_size()
caps at VMXNET3_MAX_SKB_BUF_SIZE (3072). VMXNET3_XDP_MAX_MTU only
accounts for the page size, about 3494 on x86_64 with 4K pages.

With an MTU between 3051 and VMXNET3_XDP_MAX_MTU, a full-sized frame
does not fit the head buffer and the device splits it over a head and
a body descriptor. Such completions take the skb path with a page in
rbi->skb, which crashes the guest; see the next patch for the details.

Cap VMXNET3_XDP_MAX_MTU at VMXNET3_MAX_SKB_BUF_SIZE -
VMXNET3_MAX_ETH_HDR_SIZE, so that up to that MTU skb_buf_size is
MTU + VMXNET3_MAX_ETH_HDR_SIZE and a frame of MTU plus Ethernet and
VLAN headers fits the head buffer.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was reported by an automated review
of an earlier version of this series.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_xdp.h | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_xdp.h b/drivers/net/vmxnet3/vmxnet3_xdp.h
index f9d843e..6fd8a4e 100644
--- a/drivers/net/vmxnet3/vmxnet3_xdp.h
+++ b/drivers/net/vmxnet3/vmxnet3_xdp.h
@@ -20,8 +20,14 @@
 #define VMXNET3_XDP_RX_OFFSET	VMXNET3_XDP_HEADROOM
 #define VMXNET3_XDP_MAX_FRSIZE	(PAGE_SIZE - VMXNET3_XDP_HEADROOM - \
 				 VMXNET3_XDP_RX_TAILROOM)
-#define VMXNET3_XDP_MAX_MTU	(VMXNET3_XDP_MAX_FRSIZE - ETH_HLEN - \
-				 2 * VLAN_HLEN - ETH_FCS_LEN)
+/* A frame must also fit the rx head buffer, at most
+ * VMXNET3_MAX_SKB_BUF_SIZE bytes (see vmxnet3_adjust_rx_ring_size()).
+ */
+#define VMXNET3_XDP_MAX_MTU	min_t(unsigned int,			\
+				      VMXNET3_XDP_MAX_FRSIZE - ETH_HLEN -	\
+				      2 * VLAN_HLEN - ETH_FCS_LEN,		\
+				      VMXNET3_MAX_SKB_BUF_SIZE -		\
+				      VMXNET3_MAX_ETH_HDR_SIZE)
 
 int vmxnet3_xdp(struct net_device *netdev, struct netdev_bpf *bpf);
 int vmxnet3_xdp_xmit(struct net_device *dev, int n, struct xdp_frame **frames,
-- 
2.47.3

