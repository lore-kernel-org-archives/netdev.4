Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629636;
	b=ogp7uIGg14FhaQ5yV6S0nH4R6vwud4vRourVGWvmbQZ5lWRfqInc8GtwXry1rVuV8dLr
	 TtoYb5MDmUFgKVksV0xOc+XhBNJntmPknaPGSwe/QweJ0pcOKyzPyelLHwSSTLxNKY5L2
	 8HBCGQndLNAsWCF9NGmUpqmd2qNkCEI46DM0SCCmKUR5IafziUjuzwTv3K8N7MnA1SDaw
	 /NaBrPi1R7UdGcjV21Lea+bWEQn6WMAMbgVmgMm0khg+Bjs9utmwJApvi77xQBf6AzMRy
	 hgduS07S1gUeI4FoXaP8iqbWNjoI2Oi40CfoZ/xt+bf2zi7lpeaRB2cYirkemvJVktQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3pm0NV4l/0E19QH1D7hyEXJVUZBwSAdff5s9WN+kmkw=;
	b=wPn3RKJlkQPzFmbKd8DtZ+EaoO9lRkolj7gHZKsIxGo33Oggcqj5zFxRnYtZInARf9J2
	 iQ+/AyKhqE1Bsm3EjCN4gVFSvplQGHpw7eJO4M3TWz7x1WuRBbSXYHBk6IptBby2wqRjd
	 MRSYsool/9NGRmmXYkgzpU5EYaUcEcBRa63tns+Sv/kUAtBXizcxe15PBiVc9K6QyxQ2o
	 LM49Ieuow0RjwLOl3O3YzPAlXu6lD3MHfTnYZQwgQfEHkz42afDSZTXo0PhX9XvQtIoUq
	 8UI1MP+GK9VIf1aIACZK2YdqedzFK/a5nhs/tG6yqsUVkWryebaJVafRLXzU1DNUfMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qBoKpS3Z;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77077606A689
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:00:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77077606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=qBoKpS3Z
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b600fae14dso2175632b3a.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629636; x=1796234436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pm0NV4l/0E19QH1D7hyEXJVUZBwSAdff5s9WN+kmkw=;
        b=qBoKpS3ZZAB8952Iym+pb8+MiwHIZecNThqHFY21LgH06n26HX/kC9kPbvCPXaIFE/
         WCgnQ7QIM3sXxomeD/2k6pk/fBFqYC6wH1584SXgaEGeXKmNHUtJZ4rpwWYjAROfU2uf
         eTLLkE06V1Af6gyF4ZujBdukvmLgr0BdMh6ixf952Sjs4aMfxux7oVFBt6yOWb4ILTxT
         /Bs9r17IDrmKZ38nrhrkmjkvBqXWIrLT3YcUCbLa1nwpu9jZCSrv2nmsGiOaKg87SjkG
         i3wL1QXraLDm+Vf2MRO6y5sjJeU9KaMvVE/Ewnr0NaqPXFBMoraDCkFy53K8+WrWXNnn
         DH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629636; x=1796234436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pm0NV4l/0E19QH1D7hyEXJVUZBwSAdff5s9WN+kmkw=;
        b=CckU52aj6zATmULhUaHYC41DZWXHJmel7TEsaZVVO0BQDv6+6Uq4YohwZ1zSfJCZYj
         CVZCISkwnvOQQsCtxX9nBRzbK03GE9+CsT7X8hR5GZyXisUtBOwrXcPT/1CNDPq/NcuF
         /bbOJ9YFdxqrYoCPfAsux97xB0avqgIqKx9mQ8jbY9UBz68GXlMXqFwsWVCDUHkdO2A8
         pvix+f5EC1wxYJSqSeWdDfseoum2pf3vwO3l2G0PHPWPXqqrmkFDBE/2OAUYizEWfFPu
         zUlwg+m43wcgnrnEwz+lJ+0ra9foDz59trPeHQaz7vpAFw9LN3zADUovBIG5IDDAW8LJ
         cwJA==
X-Gm-Message-State: APuU4Z/HTqSfekibhjwvCovwe4+J43HPLRmZizuXqGGYgHtaPDxi9IVr
	NvDFAMUgBp1gpL4f50cqJQFwxiQxaALNA93rU9ve1Z7BHOJH9n1o/k9rze99oYPAqNrGA/jZfHz
	gWW9n
X-Gm-Gg: AZFdTZfKVnxgEzCW4Pi7HYwu8lFm3+Vz+1k/b5n5/9N8Fx8CTCIv2CNpTMgodzJzKhi
	y80gV1CmfYMRaBCrlP/L4p0NZVqHtmE49nLOPkH9tysAsvQSYjZjmHBLE/vTx8Gjn0SzO3rPjjk
	N/7L7bROyASdBdcM0R9vrTxUfTpQEKP0ZEKUZ4R9mxI8eXeV9gjZrW6a+g69LAP/hTcEwYIinuO
	9K/06wvWEa31RjNx+Eds+WMpjQOPjTibb8ZEUgCUnO8tliJsXY9tCZQE8EMSsqEFw1wNvSn6bqH
	1NJzzPngB12v9H0bcyxkW8NhVb66TIKbhc+hFMmpBL0nDdC0eINQZhp4TePtW7ALKbJG0tO/m/x
	LHd2BPSI/m7Pu0rBWwEK368+/UXgt2ep+bODk0ftiguwtMiJ64ynVzhCBpeAZPht/M4+79yIfln
	AFRboKK9xkWUuAerbBi9O2DbFzGU8M+UCSydITMPZ2mQC7Fxpg7rcGX0ozzY2LT3GkCkW7BBnWz
	LUz2Onc4U6mwYqfEuo2BgqxWLArpDlKF5769od5P4OMXXwba0YltEOZ9V7mxW50ZCw7sIJPBjXk
	TIY0+taINu/rbDUTJqVNzTSH6gZmjoNeXzF7GxDmFsZc
X-Received: by 2002:a05:6a20:6a04:b0:3fa:df2d:d3e2 with SMTP id adf61e73a8af0-4014c756bc9mr17912134637.16.1795629635828;
        Wed, 25 Nov 2026 10:00:35 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45756sm9446318b3a.27.2026.11.25.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:35 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Tariq Toukan <tariqt@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com,
	mbloch@nvidia.com,
	Joe Damato <joe@dama.to>,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v3 5/5] net/mlx4: flush pending doorbell when dropping a TX skb
Date: Wed, 25 Nov 2026 10:00:18 -0800
Message-ID: <20261125180021.1804204-6-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261125180021.1804204-1-joe@dama.to>
References: <20261125180021.1804204-1-joe@dama.to>
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

If mlx4_en_xmit drops an skb (for example because DMA mapping fails) and
that skb happens to be the last one in the batch, the doorbell for the
WQEs posted earlier in the batch isn't written.

The queue stays awake, though, so those WQEs are eventually announced to
the HW after the next TX, but that depends on traffic and could induce
latency.

Avoid all of that by writing the pending doorbell in the drop path and
clearing the flag.

Suggested-by: Mark Bloch <mbloch@nvidia.com>
Signed-off-by: Joe Damato <joe@dama.to>
---
v3:
  - Add mlx4_en_flush_pending_doorbell which clears the flag.
  - Call it from mlx4_en_xmit (Mark).
  - Dropped Daniel's Reviewed-by

 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 8a43c86f815c..8fd1850ba756 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -759,6 +759,14 @@ void mlx4_en_xmit_doorbell(struct mlx4_en_tx_ring *ring)
 		  (__force u32)ring->doorbell_qpn, ring->doorbell_address);
 }
 
+static void mlx4_en_flush_pending_doorbell(struct mlx4_en_tx_ring *ring)
+{
+	if (ring->doorbell_pending) {
+		mlx4_en_xmit_doorbell(ring);
+		ring->doorbell_pending = false;
+	}
+}
+
 static void mlx4_en_tx_write_desc(struct mlx4_en_tx_ring *ring,
 				  struct mlx4_en_tx_desc *tx_desc,
 				  union mlx4_wqe_qpn_vlan qpn_vlan,
@@ -1131,6 +1139,8 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 
 tx_drop_count:
 	ring->tx_dropped++;
+	/* an earlier skb in this batch may have deferred the doorbell */
+	mlx4_en_flush_pending_doorbell(ring);
 tx_drop:
 	dev_kfree_skb_any(skb);
 	return NETDEV_TX_OK;
-- 
2.53.1-Meta

