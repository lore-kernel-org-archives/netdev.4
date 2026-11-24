Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795546854;
	b=Ac79Nwm7iSQPkjSqwLDjmDFlkDLJ50MyQ6xY0Qvp/OL7Ktu57GgUAx8htlqi5h92D6q/
	 hsClHPQZ9SljQ2z4MnG7I7v2sPnJbcUw70H7wqutxR4KsS8sKLPrEU2hUYwaT8e7VSqqU
	 9a+T86tmO5G14kprxmYGj3+ZwdkOD2+nK/rpgrnqLXjPsGLBUb/MMSqUB5/TO+asSEaV3
	 Dt4jJPhcNNdUtGSqp5I6sQp49YIrcb5MxZyOT4i6QFl9Y5dFgXi4qbHRXQQoVONlQUfDQ
	 zxNdmaWoE3o1SygMkI+eZJggcd3+U0hfw/JpCGNfFnSwwn3uE+EMauuAaSPzj2QwtiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795546854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RHBx7ygYBwCCasJ5yEJegoYV5JS6x5lsxOb8QKtvS9k=;
	b=wAaTXQV8M7z8ZvCUpwxyBG1sZYiy/Fp8yE5JrNjtLROYsLf5akQJz8/f4pFYcZrwazFv
	 bSFu6bWj3ontnA1+PwugqFBDxrX3SiTiQpoLg8D4QwwUVI0afdzOvxSVx/Vt5YYZmZMX2
	 of0JunuurLYKe93YSU67KOWMBIYIUqpHxq7T5N/NsPiwAbehNHSj14sTmgZfISV5WuaOa
	 s3TMpVbxWM1WHnIDoyocqlGSXc6yUErEgNIM2QyGXsTL2UNakOeamOV7NDTOR4PJ2Zdo9
	 /oZGYblIMQFjOltNpROIOMb/RaBT5i7X8FWAPyv0EbGhuQzX5c0FiFjyTGFhMJx1SFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJLcQr8I;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A369606A33F
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 19:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A369606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jJLcQr8I
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-862b76e3c8cso2262355a34.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795546851; x=1796151651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RHBx7ygYBwCCasJ5yEJegoYV5JS6x5lsxOb8QKtvS9k=;
        b=jJLcQr8ImXw64vcfyKHysAvmhH04E8XpGsxubPMVDRF+m+paCKtYuLwZaO1ucPPz8Y
         e7msC8PSzO/eMTlzDsNLyLkSHMD5krRY6YVyW+KTpJBefmCRTv63M3am4cLb+ky8pzHu
         esF+xHHYgibAk8kylahRJlIqOWxpfg/rCuSAzNhxxakCRsRnmQJ73Q856bOgVwVL4KYk
         GAOInZQaQBDcKE9qQPe9LKvidUKkJ2KhkY0BRxAeGkO7Q9CToBGuuDeKQtAiYyi//ZgG
         6lJA0oiAoka5CgKuA8UKAVVAUFJFogfMkSBpKJ2VzaGyU+hLKfOiuHCob4539tuj2siB
         5P7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795546851; x=1796151651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RHBx7ygYBwCCasJ5yEJegoYV5JS6x5lsxOb8QKtvS9k=;
        b=Z69rI5fM6iq99ItwL5Gpb+qJ9X8NXstSWU9nllesdZt+mrAoFafu1I2w+G3iNs3Nk2
         cYz+L2358o/9HO4KpazLarkhSFBPrXSN34equAnJjTCK5qStAT4+v8/9tVoMhk0brPI2
         da1S9ITlhNmd9XP3Y6ZJ9q/ZuuIZQvk3D11qA0MQlpugITp7Jmo6jCqycQVSAq6SKjRe
         RvRHBdxFs5zkYoDQBLwbZI4n14OyCoiRFVaZFux7/VpdyBS777pY6GFSkPXaDU99/jtj
         SPJj5gcvirWDQ0m0SSBWT02lsCrK5APKXcIkxO8tLZ5V17DkymFtuj2HoAHOly1ztyhf
         1NTQ==
X-Forwarded-Encrypted: i=1; AL+hErHbHiu2RYLNReKxceT81UpcKFQW9Bjx7iZ6E31z/z+/9QC7pqca1xnIIf3iUnmETYqeQQd/H9k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TrjlIXSsz47OrBSAXovSR8vJGyeusCrgdXQdtn1Nh4WiTNRjy
	Kcx2DjHtTeR8esUEYfcW23/fJpabvsCqpappy77lyxJsyrjDwgWAXF8n4FmWWw==
X-Gm-Gg: AZFdTZdGOMQ5CWgFO1XkABSWgHnpYYFcCm5hVVjKqUuuXcK5OW2Z7RkjMKsnTWBFEXC
	F3W+gCvcrdedMhINPQcfqgm7BMuttkZG51hW8HhYXrgZ7+GzJy3e0RJiLddkPL0EYUPqPoeTkBX
	bOIh3q9wWHBJStYkXc5e/qVcRoAXS/3JMpkb+EO8FVaIW6Ett9HjfDHq1Qmw/6KKG3jmziXcEbG
	ciOQkDQSeuGhVmMqi/LCERFYnICRkTX6N6ot96OMfSMzD/io+arRG8/Bgj1eam6mgRWzs/L8PNW
	PLbrBtOYfhcUxvsYTQ6BX3UodKx82HnsP7fj0tprVyFxgWJaSy6KBAWH+YVsLAqIn9zfofuNoPI
	nJX9V21AkXbYdipzwNUXdzJuW4ftQMxqiHib44+1gxvSMhPsXWCX0wrhYLIA/wM6pHBf5tW5QRh
	NbiL3P26yay+IPtMGc9TzuVzhc7TsvAlj/+TIxDbiWwhSORrQa+Esb/FeMv/j53QGkO2paet1z6
	1ZHz+zuyVUjxAeqgjFPAongSBNlwWH4s0ARMW+OLDUlp3RPnxwmpRCwxHgLHJYTzRlOsgGcEsK4
	KsN/tKkIMHPLDa3v7FFC1vJkL7CLun1PnBAEVkD8dWxNu2QcrBcLUzf7pqOIISN61eRY+LE0ySX
	CFUdBn0/FPhwSlPHWAAJF9nd5qdSE247zOWPu7SJ5jcfSc0RTQ7JrfHqp4wM7At29YxU=
X-Received: by 2002:a05:6830:3150:b0:862:a5bf:38d4 with SMTP id 46e09a7af769-8631566a485mr19652167a34.18.1795546849762;
        Tue, 24 Nov 2026 11:00:49 -0800 (PST)
Received: from tempest-testimage-cc-centos9-stream-server-1191361818 (chi-dyn-129-114-108-164.tacc.chameleoncloud.org. [129.114.108.164])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm11049218a34.3.2026.11.24.11.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:00:49 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Hariprasad Kelam <hkelam@marvell.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	netdev@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH net] octeontx2-pf: QOS: Don't free SQ memory if disabling the SQ fails
Date: Tue, 24 Nov 2026 19:00:24 +0000
Message-ID: <20261124190046.415260-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.56.1
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

otx2_qos_disable_sq() asks the AF to disable the QoS send queue, its
aura and its pool, but ignores the result of otx2_qos_ctx_disable().
If the mailbox request fails, for example on a timeout or an AQ error,
the driver cannot confirm that all three contexts have been disabled.
It frees the SQBs, the pool stack, and the aura flow-control buffer
anyway, which the hardware may continue to reference.

If the disable fails, log an error and keep the memory: leaking it is
safer than freeing memory the hardware may still access. If the queue
is not set up again, otx2_free_hw_resources() frees it later with the
other queues when the interface goes down, after the SQ and NPA
contexts of the whole LF have been disabled.

Fixes: ab6dddd2a669 ("octeontx2-pf: qos send queues management")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Compile-tested only (x86_64 with COMPILE_TEST, OCTEONTX2_PF=m, W=1). I
don't have OcteonTX2/CN10K hardware, and the disable only fails when
the mailbox request to the AF fails, so I could not trigger this path.

 drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
index 683efce519af..e9ca884cfb4d 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/qos_sq.c
@@ -283,7 +283,7 @@ void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx)
 	struct otx2_hw *hw = &pfvf->hw;
 	struct otx2_snd_queue *sq;
 	struct otx2_cq_queue *cq;
-	int pool_id, sq_idx;
+	int pool_id, sq_idx, err;
 
 	sq_idx = hw->non_qos_queues + qidx;
 
@@ -311,8 +311,16 @@ void otx2_qos_disable_sq(struct otx2_nic *pfvf, int qidx)
 	otx2_cleanup_tx_cqes(pfvf, cq);
 
 	mutex_lock(&pfvf->mbox.lock);
-	otx2_qos_ctx_disable(pfvf, sq_idx, pool_id);
+	err = otx2_qos_ctx_disable(pfvf, sq_idx, pool_id);
 	mutex_unlock(&pfvf->mbox.lock);
+	if (err) {
+		/* The SQ, aura and pool may still be enabled, so don't free
+		 * the memory they point to.
+		 */
+		netdev_err(pfvf->netdev,
+			   "Failed to disable QoS SQ %d (%d)\n", sq_idx, err);
+		return;
+	}
 
 	otx2_qos_sq_free_sqbs(pfvf, sq_idx);
 	otx2_qos_aura_pool_free(pfvf, pool_id);

base-commit: 37fa509e43ba59d7c329025436e8ea64bdf089d7
-- 
2.56.1

