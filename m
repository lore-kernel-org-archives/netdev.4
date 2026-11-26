Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691057;
	b=QK9rvemU6RbRUQzc/4ZdYpGC88FZ083Hu+c5xnwyI8uQODTQYMwE6qLuTyT6n08dsyjs
	 9z0lo7JJ7MLZUHHjqhYV17T3VXd5S0cSWgkY/K6H8e7iUseEoXyyOLAoSZTN0/0z9+sOz
	 T3iDJ1rykdB5jJh/Mxn64+Qd+/AVRag1SQUSJysseciTo0v4PlMh+JTe7+5pEeV3sWgna
	 18GijPsE7VC2mT1CpTQ5RA2Lq7wkzEA/vADygzPz3tYOEQCmeUkzTn60ILbOMlXBLuok6
	 mbl6RTDmpmlJ7fWcyYOfUWnEx3+Xz+aYY8VUmlt1VX9GxMCX6iCdE3kjJhl3QqFjcdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yGB59SBjlpRs8qv1kSysD4piQpSZ0FrwanlgMxtvFqk=;
	b=pA5XD7avjyVec80ZryD5ctTCP0F5vvkcie9ILNw4Uw02DJnI+xRL533l9W4w5MQNBEG1
	 TplS7kEf10DsaUPj5kX44ZvebL1541/6TRktwg8mG1GseL0t/ix7KhC9GbqTrCv3SkhDf
	 6DrvdfoN0mg5ghv584XTbSW/U+iN3/dTIFG5D5jrYcVDqIKrRdx/RrjCpkUj0LIQprZ/g
	 IXTjNRDDokpQi93DkxcJmlYyMKux6msPAgGu2i+A9QjMG5cVe87BVF/NQg9Y+nNYZYaxz
	 G3G/1PhuD76Grdgprh+hMpI6S6GE4mrxX2yxUi9v9fbtxeQdkePuwWlVoZ9OlL3kKlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLFsS6mJ;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB44D606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB44D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLFsS6mJ
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9ae391a05so48295585ad.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 03:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691056; x=1796295856; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yGB59SBjlpRs8qv1kSysD4piQpSZ0FrwanlgMxtvFqk=;
        b=aLFsS6mJa2uveTsTpmXrIR70CLi6uSpK5Phds16artD5DT+cTNNErAieAWHYQVdt7r
         E+Pwe9GNz3Kn7Wt+WwmgHjwUNwqUXSe9FatUGytnqeFWrP5Y4q6p/wH7m7FULtJBKKZ+
         b4a4tHSaxqmUpMYwFn/uW7vV5a6lbapbrXObMtQhTIiAvpOY/u1ehs/Pi2yUvE61A7uh
         Jt8tUjQDllqkTUfoZI7xDxaHRaFudBK8gZ8kFleVtikiQaDgDJM487UAz/3BLtIDfb1+
         6qrOmSVMZ49BfWMoHd13V3fhn1ZXs5WILf1Ac13zMqbDgBH5Wfn3KYLWy9qDhoQzaqkg
         JZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691056; x=1796295856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yGB59SBjlpRs8qv1kSysD4piQpSZ0FrwanlgMxtvFqk=;
        b=0QTX03E7tYNdAIEH21UOF3h/2lKzx4j2UzaIi026bIBGwrb2qhnHJhjZsCJcjLk0Jv
         m+mtF/SPQrCx2HxWl/oNb+IuSBFJJ7oNX6+du40NfnDSThspzfdXm8iBURVuoEWZEMIH
         lwWeYStPZJAS/lJasZ2ptdoK4CxOLxpmy+EWnYa6QTr2nigrGDGVlchIMKcmtdGOxUww
         K56URfrdHm2WyR8TkJh2JvFkcI0BO5fZ8NQonf9mBU9KM4EzUNvenIviLoX4LWNHGA0u
         zpCJnmoAUabEUbVLWb7GS7aIjzklZHA23a7Rh0QOHPoi1OL1kr+mZQV+5ozG2rgQAHsY
         almQ==
X-Gm-Message-State: APuU4Z9HRu771x5ZRdNwS1IqXmBdmNZyeehTMQj/Vu05P38i4zRK2aW6
	gJUv+QzKBdL5/EYaqmHXtkSgYpnR0x8+++bOQ29NsepRs4z5ZH+2HmueqCZ4wPI2
X-Gm-Gg: AZFdTZeVG/N8bgE4RvVthp+8HN86SxeRuy5FO+4cdpRgd5mb8lye1VGFOiNYssjAoxL
	fhJzpWbmnkn2tntDGnk7xFJIlgM4E4OefQ3APWG3m/s8ThAVR0wwbNUTdUFjPQpgZA/Y7AM3i4Q
	Liusj3GUzAfQskCaeK+pWzPgbANT58CZ56pDLa3ap2mwRNBztGlQ90S/H10hNY0SC7qX8ObhqZM
	nsyVfKAaeYLH7u1yqteBiXDy5pI/ez6Ql3UXZjkXA819ltukTtWEBvrdsozC03XBz5LlvZIlt24
	2x+3lrODUQwqQSCclshUrkHVc8V1oJIrioD/P0XwF38MVnItycMiraahDzCFYtb4jSdg8pTDPmp
	a74D1FxZsXq9wo+W7Aqq/tLP+2Gn2BQVIJTcC3A4lJmV87pNR3ejxOCiq5dJr+eFBVmTG0IVhXE
	RmS/82zqwZINqpecq9sSFTVvIJR9N0ZzrXJVgFQSDoA1CjdMPSwctbQve9mOLEefDDJn/T6RRuz
	gPXx427YZelbZyw6iKJqV2C6lSXn2x8ytMWeUsmrRQKNwAEfaBEs3OAUhW7H+fmiHs2R6qcNAtD
	UJEaV4jYPpzVAmlRH/sq5LwILhTzlDbKqna872NNMs9Iao2Ck6s2Xnze
X-Received: by 2002:a17:903:3c65:b0:2f0:2204:b3d6 with SMTP id d9443c01a7336-2f031efd630mr181222675ad.18.1795691055877;
        Thu, 26 Nov 2026 03:04:15 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661d:3050::4d0:7d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a74sm104525725ad.12.2026.11.26.03.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:04:15 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Zhangfei Gao <zhangfei.gao@linaro.org>,
	Dongpo Li <lidongpo@hisilicon.com>
Subject: [PATCH net 2/3] net: hix5hd2_gmac: release TX SG buffers if using SG
Date: Thu, 26 Nov 2026 19:03:04 +0800
Message-ID: <20261126110310.344521-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126110310.344521-1-mmyangfl@gmail.com>
References: <20261126110310.344521-1-mmyangfl@gmail.com>
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

The commit in question added scatter-gather feature for TX queues, but
left the release path in hix5hd2_free_dma_desc_rings() untouched.

Give the release the same branch the reclaim has.

Fixes: e5222b1c3f21 ("net: hix5hd2_gmac: add tx scatter-gather feature")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 46386a0954a2..0d4701d1e173 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -816,9 +816,14 @@ static void hix5hd2_free_dma_desc_rings(struct hix5hd2_priv *priv)
 		if (skb == NULL)
 			continue;
 
-		desc = priv->tx_bq.desc + i;
-		addr = le32_to_cpu(desc->buff_addr);
-		dma_unmap_single(priv->dev, addr, skb->len, DMA_TO_DEVICE);
+		if (skb_shinfo(skb)->nr_frags) {
+			hix5hd2_clean_sg_desc(priv, skb, i);
+		} else {
+			desc = priv->tx_bq.desc + i;
+			addr = le32_to_cpu(desc->buff_addr);
+			dma_unmap_single(priv->dev, addr, skb->len,
+					 DMA_TO_DEVICE);
+		}
 		dev_kfree_skb_any(skb);
 		priv->tx_skb[i] = NULL;
 	}
-- 
2.53.0

