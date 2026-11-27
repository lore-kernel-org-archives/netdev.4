Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795791290;
	b=u0MR1ScF1/QTL0iMQRy0UH8zGsaiJHKW9UAAIAULinQRlITAfkwftCaa7vDU0YhJ4d2q
	 cKOzKh7c1tgUaCLG6jun6ZQ1ZPMEXdGfJ5Zi9N6IP2ZmQkkS3WOrlyZDJ92CO8JEHsNJj
	 nbtONkKZfjoybd6I2r2RXmUb1JDRhCm6LeNyRiSi1ZxeAgcXhrTNrdJrvPavxa2KICkcC
	 OYMWwheBBZBzCB2qrisKpguUtucDaLQ1jL3/RIFIEM6yCg59KXkbdh9xugNOvxESyWZJw
	 rJgekj/kh0mC9yJNtxHGeF2lRQrq7mzaW5QtrekumOMY0Ev7HRYDl/ratf1es4BT/MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795791290;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RMEkb0e+QnThfBCVHNyZn2n9hltwbKVsmgePmagIvQ8=;
	b=n7nl2r2m6Aidlx/efMLFx29a5csGUZagBR7Ps7xwNlRioBHYAT0z5gTcgZIbe/tW9b/j
	 bQ5bpBKsPkt6iJxyS11o3aY31H9EPTyUUvbVDULUweRkBhRv4dTf2ZuBI9+D6xweVrxEq
	 FUo7gQCbvRaRnpuVDTbZDSfEXU4tH4oAM9YYlFmK7BBk/h0F/MHeUR9jhCYwcOiR7Kq4F
	 mfddAsK2UHTbUg9DHbMySZqTWQivTal8plNdzOMffj1sF8EQzgmmrJfTWHFgBYl/F/56+
	 icTfiBeBCQHtH1U92oM/3LLnwTxijODFqGNsC5QJhshwCF+B51+QHnofSFAbYIokXAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=Q3lf+uzQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SluIs8tS;
	arc=none smtp.remote-ip=202.12.124.152
Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9246606A323
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9246606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=Q3lf+uzQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=SluIs8tS
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E7DFB7A0525
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:54:48 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 27 Nov 2026 09:54:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795791288;
	 x=1795877688; bh=RMEkb0e+QnThfBCVHNyZn2n9hltwbKVsmgePmagIvQ8=; b=
	Q3lf+uzQLVRVk3dWTNPtG7YAvt7fWtcFenCl4gZMMUtkBGXsckvZ7cR7RNqOlUjh
	uyRKgm8VFT8gV7fBswT83SbFU3W600QM8J/mcUhOwrMzfyIk93fxh4X9WCS+3olv
	p0zRm2PSt6bit5J1qkws0kX9bGrYU3/Dv1651IY/3rzo7r/7uFlKj9KFE91lGv5f
	TFSKsPX2mDCa9JI3dqv47IYjfkHvs3TJtRRKSeaomy4mvrUHu0vd3+iO8YviHslm
	w+auvk76MVKRCDTAXd9E7dUxK4pR6tXpyI9K6+b2VE1d3cbesTr+zgGTnZcz9F3J
	2NKN5VN4vUBfAQQCZJTxKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795791288; x=
	1795877688; bh=RMEkb0e+QnThfBCVHNyZn2n9hltwbKVsmgePmagIvQ8=; b=S
	luIs8tSYYRVhSA8ap82hLNZezf+xfIIK6fxPjFK00/CuOs4XCDicuGZzRJCmrLx9
	2ybLThlXCkwu9HkwZiXWyZssDwqDcKYmiPnqlq/XqlHTcaoRKa2koI0UBR02NipI
	67GeHc+oMqvdXzPanET4VyrpDrV4FQM+RlT9E0tpOdnl2fnGzKMYgppFRJj6mXI3
	8yu7J/W5DlGaiSUKa+uUMlfn3I3oj0x8AzU+C5Crpzb7YdyVeFyf5ant5LPviJ00
	HT3SM4v/ki8KIeRGsbrDNlZ0i8ljPrMUSWpEmcPa3/tca4biWrNnC9aFGmrd+A3u
	53VSMeIczGMCCtReZNYoA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795791288; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PG5ldGRldkB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:Ypacjeg1tscIIN1taxZ9tOY+UPa/0uSuLbBjQ7+775IZtU8
	eu1p4+/PQv7A52DARWB9mbYn+wFQCyII4I7bymjXU6lRWW/BSufUsrOWAYMInt6k
	K1vICrVEzaaoxASiI4KbiEBnMDLO7j9hC35/Hz/wvQjyxsTRCGRn2tGG8N1DfJ6B
	SF68uc77woY1bCt2aLnQejx7RVmsT/kMEy4gDmbmY0/Etmh6prf+XJhkM0/tGlmK
	Qfu/2oEledpmfvPcm41CxuUenZ3KGaFTHpOiYEij5NJudHRtJemb8LWE12eCUDeQ
	RD54AC+7qOIeG912qF7dNvCfECkE2KNnLyRNNRA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:T7cLScqI6166EyL6js3LIA92wBrg+6ZOCG6fRLRgQjc=:Uehw6pISAd64VXnNUcAOSVfTucahImbtjv+ooljOSdc=;
X-ME-Sender: <xms:t5kJayVle4B-UcEP73dsqWXKdeevB_G5FWMwL3WB0gWMrOBTc_WH-Q>
    <xme:t5kJa0nGh77C8S3Ula3s9eR-afyz8u4sBhjwTis140lvoeVlHwEf2yrijraVP6lOb
    TPlQwlZ294SkBcytjOhXUR884pkZVjM76MJFnv6h_IlWyM6ccjuswo2ow>
X-ME-Received: <xmr:t5kJaxNsAcngTcXbMa3dPGckaAHpg3QegKgNBsBJFExAVYha_MSatAFtB6tX0k1YhZSsDbp2eOe92p6K4TXms9LNObe1CUkrPYAcwQ>
X-ME-Proxy-Cause: dmFkZTGeYWoKyAfr5vcv4raxD8gT0Gh9NR5r8ffk50LVzuKIT+66Wr4tdKa6c2Vj+/mLlh
    iIG7tjLNT33rl3n6As7g+fEVTzgKpPZnnTtreZ5G8ElxVXpT0L4np7bxYIpHaIwOggi9Jf
    VWUZg7WkhOgW8sPBVpGj6JM4scCkA4vKFXyVdzqD6KSqGKqLnBC4inGs8WC0Pk32LOyXJI
    Dl7vpuNdDfXFTfd7zCdzF0030IJlA/XdBenLAPYWD/TmeLJxIyf8FEr2GI6sV+X7GrN7Zk
    w0OkZ/Bpq5bx8sUHYUyZ1Pgm05mwnE5PsRBm2Ks2qZKClG7PTVUIPkoYDExLFy07UV0KIb
    g97l795lvEn5pguoRRwoWIkTCm1uWz9lkiWt4jdMytXoz+J+VTGzrXOO+t6hCm9pEOf9Fp
    HD53q3JEPeQiumqgqFvFmVuxeilSX41YFWm4qTAF/Vn5vrsb6VqFlMw9Od9l3cFGly/bq6
    DleJi4rbdkazISmq04OiVlOLJU9w1vtAl2KenX0N3cP6KQ0FDrKrQ2inmqmvsthXgeAra2
    TPySHOFWs4IEnEjPnXl9p4Q7mx9kQxyaLN/taTWym5WTjsBlYmImFEjA5q4pFej/FeCqLj
    op1xAPnNCTLRpx9HvyCy7ZdmK9sXMYIS58QPb2R+nB9QNdsj2GxiM/Qa9d6Q
X-ME-Proxy: <xmx:t5kJa8Imqrrc5q2526Bop86Sc3jBbR12iEOB1SdhqLGZSuiUE8desg>
    <xmx:t5kJa72Ol9k7qrmcxMdlumqmcTU33girEqgSc3e8x1K4zqXs51XnTA>
    <xmx:t5kJa4Uaeq73mjnMvX6AJKAq28Mlp8IqI4Q9RHdPOd8dr9TbW2mnIA>
    <xmx:t5kJa1MMu71Yu7XZdWWoaHt5XnwFVXf534Nb1o3XXc-TAH04XjCaxg>
    <xmx:uJkJa4bRJZBH2ACri_mP-SqsP8t_WDzTF-sOyWzF7gvCm61vGejYfbuO>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Nov 2026 09:54:47 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 27 Nov 2026 15:54:39 +0100
Subject: [PATCH v3 1/3] net: atlantic: AQC113: Ensure L2 filter count is
 valid
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-1-b5efbc124dcc@jannau.net>
References: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-0-b5efbc124dcc@jannau.net>
In-Reply-To: <20261127-net-atlantic-aq113-apple-l2-filter-slots-v3-0-b5efbc124dcc@jannau.net>
To: Sukhdeep Singh <sukhdeeps@marvell.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=Uehw6pISAd64VXnNUcAOSVfTucahImbtjv+ooljOSdc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmzOmRu7Tp3+McEjdrqnuT7vimJjt4L0Lx8UDbcuOdh5S
 uXvv1+6HaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACbyuYCRoWPhlMCn+TPuGZ3J
 ncm+egrHa9YzpppXLvxIvh3Ju9G/kYmR4Wzskppw9dMJ+TekVoqof3gaxvGv9eRzhwW2oe03/Yw
 eMgEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Set l2_filter_count based on l2_filters_base_index if it is out of the
range [1, HW_ATL2_MAC_MAX]. At least one L2 filter slot is required for
the MAC address. When the firmware delivers out of range L2 filter count
values the best option is to compute it based on l2_filters_base_index
which is already validated.

Fixes: 6c1ca112a6e4 ("net: atlantic: fix AQC113 HW init: ART, L2 filter slot, MAC address")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c
index dc9b2ef4640b..9ad5bbb11bdf 100644
--- a/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c
+++ b/drivers/net/ethernet/aquantia/atlantic/hw_atl2/hw_atl2_utils_fw.c
@@ -629,6 +629,8 @@ int hw_atl2_utils_get_filter_caps(struct aq_hw_s *self)
 	if (priv->l2_filters_base_index >= HW_ATL2_MAC_MAX)
 		priv->l2_filters_base_index = HW_ATL2_MAC_UC;
 	priv->l2_filter_count = filter_caps.l2_filter_count;
+	if (priv->l2_filter_count < 1 || priv->l2_filter_count > HW_ATL2_MAC_MAX)
+		priv->l2_filter_count = HW_ATL2_MAC_MAX - priv->l2_filters_base_index;
 	priv->etype_filter_base_index = filter_caps.ethertype_filter_base_index;
 	priv->etype_filter_count = filter_caps.ethertype_filter_count;
 	priv->etype_filter_tag_top =

-- 
2.56.1

