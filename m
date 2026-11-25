Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629630;
	b=1OczKEIu0/pl6YtbT4pwtOkw/4/18Mzwimm6dyiOnkzsXV2BS5BqFqVGlDkR+ApY5wZg
	 rcP4v6QIEUL+jEmQws/qcsqBC3hiquQTJTjwuCDlsp7TIxO0giE/EcE9TlTDQKkGmD1y5
	 O5yZDA2IRdMfJA8IOGQNoEBHwOms3HwGe1a9ThErIj30PKldlFqHiRMwNrowaLbUUMazV
	 w/qt+ePaMiBuASQnyZdu2Ne8PvUqlVM/HZ+QoLP5e1ISxEePrDmGgMPgr2zY7/zcqBlzO
	 cxi3+NeZ89sF6x1C1lQBzJYA/V15Akd8h2XQ38Enn8q7q0SiUzALI2QCsRw//HUnjww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ybq08NfCGGRDLgIcrDYKd/XJOpQjXuujh7BORjeX0cc=;
	b=rfjO05kwRTFBXcofJw5+SgaSBR/1wTN9OURcoFPO6PSq+JbQSn2mJojHQrctAtVrqURS
	 aKPKKoap/irWv8CvjxQ31Xw+gP9wo/IMJ2NIqanHqmrqDhrVkUxYqbxuQYSUJirv3CkDm
	 hrrBptXpU2aT5qGx611bAivHACkV/IZ4mOcYjaywVNUc41Xiy3ubOA8axBmljalZOHL9I
	 kq+1jpjfDFZJOVkRpuF3UbyCjrwPWAi8PNcd6r6nrO9ZXXZPjowxGHESpc3FegO9/AZQ9
	 PurNDUGejuyXxEPdVEwIPqD8n7ZYNW+6ZqrYV80SUnc1DojfL+dGWqHiLEox6LIeHSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gq5yHQ9V;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E7606A689
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 18:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 812E7606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gq5yHQ9V
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f03920c477so52133965ad.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 10:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795629630; x=1796234430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ybq08NfCGGRDLgIcrDYKd/XJOpQjXuujh7BORjeX0cc=;
        b=gq5yHQ9VLcwYkwjr1vkTpEDyAlBQ4Sd3FCsFvzewZ+ebZZFnyePB8yPDif9oy3gME6
         ITa1WdI2UIk9dbCgxH0ruYuIf+nC9giMFawzjryr/7c5qDhxZkurJ8NGYfMNDMmGEoYV
         rl0E5COxhONIBIibPCroq2M1Lwdk0qQRPl4Mf1uYxEoeOcRwVZxyGODpxHmrtQdsKYnW
         FB1LazRC470fCGwZNUtXmV8rfPWeHW6sDHJ3Bg5K/bW7CtLSJZGTyHN8wM7D9rrJb1u8
         MMHKXygbp0655+fkMJPo42dk4PB8a99j0KRoM6au7Gcd8oDgG9NGAWijdbYFPS2N1KlH
         4xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629630; x=1796234430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ybq08NfCGGRDLgIcrDYKd/XJOpQjXuujh7BORjeX0cc=;
        b=tDgyNrgtU0qHy5cwynhEblxVPg1y/GTzhMFRDpd5ftNYhh1zstXJQnvPBgE+RxQ9q5
         hvAs/olajxJ3lFx952/8RGdt+mbbxDDYXHd53TAk6/n1TmZiTxsJDt7MOTotkhFZ9FMy
         G9BbJN+b0mdGJ5BPDSCO8dcnIbDViQGjBeRIvdGgcPaGnF0R7vVcS6SVnK94uBK3u/B0
         GdJDNFbkDshLfA2I7LElmZpRuf84odcmkm6lMF7v6L61MNlsPG+3tSq6Yg8u/6ONqydA
         C2M6a7QE9tEy7qKNI/C41C8it8ij//n048UiCBCaRFV3R/wLzkYFnHoUfZqiZWmLrLQF
         nU6A==
X-Gm-Message-State: APuU4Z/1220cY3GwmnegIIRP0qVKmVy7Xb9chvfnyeS6A0Q1ObT9XjCk
	v2uUrvGFM1vptts9US3hTpLFG7y7Gjlu6lg53ZOHEdMN7Fb7zCdWPo+bP4MHleQ1o+T272K68G8
	kFUym
X-Gm-Gg: AZFdTZdXKOw4Pei9WDIAnivfkSfQQ4mLB25G36augpejKPHR0HfOib9HiH3CrpImg0a
	5gur+5RkR3lr1cr4TIAY+1ntvxwgn2ql5anO1AF8vJcoqiHlp7mvyYc32rhzcto/HFxhkYiT+fT
	ukGbvvHcwthF/Azas4d9ewDWEHivn8Rd4Sn8ZPeJ8cHGcuJ70vMfeDGHzlNBubOzLtKQcZaGxFd
	4UIVnXZFS3bFYxhVt7oF8rTEupwk/JQI7uQQh1W0d3CKSJgFn8GXojZlq8+U184fhg2mFMEQOWs
	IYRlTIPpaaOfTLhRnvJoBCfuUl+Sp1McyrHFN8PMb1FMf6sXBUbTjIEaXoQ7u3BDBbaBNVQ9T4W
	iWnJ6WaLPJETkOM//QCuVuMo9xxJbWNU5HzHjxG+LAkdOEfM0RnMek+ODBXIUo+c8hJCm6/fQsb
	dSI0CS1TemqTtppBQntOR1hlKF+BLbIrXknjb614PZ/egwecI4/X0J14REZI46UvWHpbooObJUe
	ovYIkpCrQ8Rc7JNQV3eLhZ05GgYwc5bz0Qav0aF9rAwCzAqih6z9zCWx1E4v+9/gdHiPsYpEEcE
	bBRE102T2VCqhcDVN/mKaAYtCiA8Voe3B0zvs4/8FEg=
X-Received: by 2002:a17:902:da83:b0:2ef:e5b9:5841 with SMTP id d9443c01a7336-2f050c1d8cemr175723835ad.35.1795629629861;
        Wed, 25 Nov 2026 10:00:29 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:57::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215e2sm91189495ad.63.2026.11.25.10.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:00:29 -0800 (PST)
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
Subject: [PATCH net-next v3 2/5] net/mlx4: factor csum flags into mlx4_en_csum_flags()
Date: Wed, 25 Nov 2026 10:00:15 -0800
Message-ID: <20261125180021.1804204-3-joe@dama.to>
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

Extract the code which converts skb csum fields to WQE fields into a
helper. This helper will be used by a follow-up series implementing
software USO, to reduce code duplication.

Signed-off-by: Joe Damato <joe@dama.to>
Reviewed-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_tx.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_tx.c b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
index 29eda78b9977..1fb265a30a30 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_tx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_tx.c
@@ -860,6 +860,16 @@ static bool mlx4_en_build_dma_wqe(struct mlx4_en_priv *priv,
 	return false;
 }
 
+static __be32 mlx4_en_csum_flags(const struct sk_buff *skb)
+{
+	if (unlikely(skb->ip_summed != CHECKSUM_PARTIAL))
+		return 0;
+	if (skb->encapsulation)
+		return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	return cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM | MLX4_WQE_CTRL_TCP_UDP_CSUM);
+}
+
 static bool mlx4_en_prep_vlan(const struct sk_buff *skb,
 			      union mlx4_wqe_qpn_vlan *qpn_vlan)
 {
@@ -890,12 +900,12 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct mlx4_wqe_data_seg *data;
 	struct mlx4_en_tx_info *tx_info;
 	u32 __maybe_unused ring_cons;
+	__be32 op_own, csum_flags;
 	int tx_ind;
 	int nr_txbb;
 	int desc_size;
 	int real_size;
 	u32 index, bf_index;
-	__be32 op_own;
 	int lso_header_size;
 	void *fragptr = NULL;
 	bool bounce = false;
@@ -990,12 +1000,10 @@ netdev_tx_t mlx4_en_xmit(struct sk_buff *skb, struct net_device *dev)
 	/* Prepare ctrl segment apart opcode+ownership, which depends on
 	 * whether LSO is used */
 	tx_desc->ctrl.srcrb_flags = priv->ctrl_flags;
-	if (likely(skb->ip_summed == CHECKSUM_PARTIAL)) {
-		if (!skb->encapsulation)
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM |
-								 MLX4_WQE_CTRL_TCP_UDP_CSUM);
-		else
-			tx_desc->ctrl.srcrb_flags |= cpu_to_be32(MLX4_WQE_CTRL_IP_CSUM);
+
+	csum_flags = mlx4_en_csum_flags(skb);
+	if (csum_flags) {
+		tx_desc->ctrl.srcrb_flags |= csum_flags;
 		ring->tx_csum++;
 	}
 
-- 
2.53.1-Meta

