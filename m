Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795338379;
	b=kF4KtYKcjJW2U+zlVqLteyiPqnnSt/gKwPjw4a3ryMIP9I54TGwAP3UVjngL8i5Hf0P3
	 eUYJ6AfXdmNmGZVv4gZEGaXD2IrCqQQu78+1/99l19MciOoad3a31FCMzyJiUhAlgRiO3
	 RI25SZ7x99a5tWEEhe2u0fkNK/Jd5qCPsC9WcKKP1FkYgttrOp6r3xuc0JHNT6dJARC2H
	 RXtxL3U6INSwG5erHOj0GK+Kai6bSyitSHHC9JIQAbn9JoAEK3/FDznzLUv7iO32cB5D8
	 lAmaVfm3cJuXIQ/7Hjvl8+Ji4ppFqb4xP2n6OoHJZylVs9OUhj8JahT28dv9gf33+Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795338379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=poLpXaD2cnjCIvUqVuMOp8pFOOer5fR1DGYJw/icaNI=;
	b=CSHLfbRTBiblZq0QJQDPTjjZUYOj0xIvs26kwjYLPrzbYO9VKXrajXtrN8EmJWWikgw/
	 EupeDuN05PTIekCDJf2x7JMG7gSHhV/uiLs62A7mg0nlkz65ErWgnoid3GWqQfYAyhOzU
	 sHm9W5tRf+Mr+p7hnP9kH7gWYuv/HTQNRHpROSPDIn2mbWST9WEv3TidsyFv8J70qF8rA
	 2S5G5eVB/Jt2LggTuRQ8ojrmFwE/yofnkQOUSKk9UNuvxA4m5JpSiQrGcJIItV7A+mdk3
	 VenTt1crZZIn4pWPluOntIaRUp/53WL+CTl80eBhS5Xvn+LbebYM4j5wxI6j6JD2aiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=foxmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E027606A331
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 09:06:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E027606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso187986c88.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 01:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795338378; x=1795943178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=poLpXaD2cnjCIvUqVuMOp8pFOOer5fR1DGYJw/icaNI=;
        b=xXbZfCSSdmTNAgVQnjAWziGGCZOL1mBi82IoV/NlHU3NGwNrSW4EtZBoRv70iEP4HP
         1yndpsy0P/nPYHWyo82Q8Cjg/omY5X2QQfnH1wwn03mHoekVoPiMTqCs9fMGRP26B9Hm
         7AANopS0ijbmhCkmPxMcaLwD0+iO3192sodhPoeUka/QInNegmnLHN5mUOq9RSV8LTpp
         mWnmvV9rbNdVA42NVUeOU9Z70THfImoFBlEoGLktgDPm/5PWOT870Hr3avbPsQSd8iLa
         Nfus6qNhx/Vui8Fkjo1GjLBpHL5SGlEyq5TxG3Up5gNew4oFosg7LR5awxJZbP1wUmbT
         L+5w==
X-Gm-Message-State: APuU4Z+MjgF5ORLoHtAE2/YUhvEH48ERlZR4iLRjXPQvFlERTV5lusLd
	7kuJNFEk0yBfL7ux+FrgGEdmMyv4acwcJKxU+QMQFoIz11N1nDQValXjebJKBOoC
X-Gm-Gg: AZFdTZfwARudhXmzLicYrKN869pDzSxNOWdkFzmXLVXdRWHqgWzZ3+dxLbOBWAlC+2t
	RUaW5x6tWhHOBlIwYENmPlUVgDUZOidhM60XtfpGA/HD9fxyroy325AA6RYMfQ7TUeiPVl7adBx
	pXdIOU75UzGA4sj3nwc7tiFLWhOV2VDVRMcx9jtQVSMV7xX5wJVw5cjxiqOWI6DYhNzyF+AQT2T
	musOEoiDotljejzregBVEacIut+8l+yJXksvG4MvyiZQCKVacr4WAycP2WNz+quvC8ZXO8Ks92l
	qpBz2GBTjknKUe0aqVFdMf8zGEyh4Jxy0EXQ2EI0mpcbHR7a6kiB2qfqqQ5f6fhsVNJ3d0NHOn3
	nv0+v91tkILpaXbB6RrWZUrpYpA2jeImb7n61l3AIujqz44ExcdWLLiswLFgqmGWYpaD/flPxpt
	NXlRBGB67fWUBSqq10klEsw0Ob5wadux9vIaqT68Qup+YkRgbB62zVDnP0iHq6U/Fw2O8athWQd
	/mEFH7vzHPakI5K4/bsdH2CaLmWke1DwpE1/MQ/vJgRADoALFSib42xtJBKomr719xndZJOYSss
	ftLAUjZf7cPT/DP6CsWPPAWAiuBklLBRqiRDpuA/yoxpuw==
X-Received: by 2002:a05:701b:240b:b0:1b2:40be:a929 with SMTP id a92af1059eb24-1b5568b38b3mr8119547c88.14.1795338378460;
        Sun, 22 Nov 2026 01:06:18 -0800 (PST)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm16839045c88.5.2026.11.22.01.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:06:17 -0800 (PST)
From: Jianlin Shi <shijianlin11@foxmail.com>
To: netdev@vger.kernel.org
Cc: mst@redhat.com,
	jasowang@kernel.org,
	eperezma@redhat.com,
	xuanzhuo@tsinghua.org.cn,
	andrew+netdev@amiga.org.uk,
	davem@davemloft.net,
	edumazet@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	talgi@efi.com,
	hengqi@loongson.cn,
	horms@kernel.org,
	virtualization@vger.kernel.org
Subject: [PATCH net v3 1/2] dim: clear irq_moder on init failure
Date: Sun, 22 Nov 2026 17:05:56 +0800
Message-ID: <20261122090557.19766-2-shijianlin11@foxmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122090557.19766-1-shijianlin11@foxmail.com>
References: <20261122090557.19766-1-shijianlin11@foxmail.com>
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

net_dim_init_irq_moder() publishes the allocated struct via
dev->irq_moder before copying the moderation profiles.  If a
kmemdup() fails, the error path frees the object but leaves
dev->irq_moder dangling.  net_dim_free_irq_moder() treats a
non-NULL irq_moder as live: it dereferences
dev->irq_moder->rx_profile / tx_profile under RTNL and frees the
object a second time.

On current mainline the only in-tree caller of
net_dim_init_irq_moder() is virtnet_probe(), and its failure path
today does "goto free", which only reaches free_netdev(); nothing
calls net_dim_free_irq_moder() there, so the dangling pointer is
never dereferenced.  The bug becomes reachable once the caller
unwinds through the existing free_irq_moder label, as virtio-net
starts doing in the follow-up fix:

    virtnet_probe()
      virtnet_init_irq_moder()
        net_dim_init_irq_moder()    /* kmemdup fails:
                                       kfree(moder),
                                       dev->irq_moder stale */
      goto free_irq_moder
      virtnet_free_irq_moder()
        net_dim_free_irq_moder()    /* non-NULL irq_moder =>
                                       rtnl_dereference(
                                         dev->irq_moder->rx_profile)
                                       use-after-free,
                                       kfree() a second time */

This patch is the prerequisite that makes such an unwind safe;
without it the follow-up would trade the virtqueue leak for a
use-after-free and a double kfree on this error path.

NULL the pointer after freeing it, so a later
net_dim_free_irq_moder() is a no-op and the device is left as if
initialization never happened.

Fixes: f750dfe825b90 ("ethtool: provide customized dim profile management")
Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Jianlin Shi <shijianlin11@foxmail.com>
---
 lib/dim/net_dim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/dim/net_dim.c b/lib/dim/net_dim.c
index d8d4f6553559..bf59deae6a29 100644
--- a/lib/dim/net_dim.c
+++ b/lib/dim/net_dim.c
@@ -141,6 +141,7 @@ int net_dim_init_irq_moder(struct net_device *dev, u8 profile_flags,
 	kfree(rxp);
 free_moder:
 	kfree(moder);
+	dev->irq_moder = NULL;
 	return -ENOMEM;
 }
 EXPORT_SYMBOL(net_dim_init_irq_moder);
-- 
2.43.0
