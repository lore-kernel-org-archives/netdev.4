Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139797;
	b=eUprznRblrI6m2S5qn/AKO5J9DrKhWzcdqGpnFBiU8mqggI4EjqacucQkX1caH5cDk9g
	 PMSskJGBjHHWME/Iu9b4KG3HKf7dlxLcXYrMKIkseExxcJj0YKdoPU+kamA87TxTcsuy1
	 4oGXm8lQkOGaSOoBu7xzg13dGHklfVjSJyrTEvb9H4G7IaIFnIXoCZIhESyJ9iey81+hq
	 Fz+ULwfrNc6+mcylDpfv8y6iO89WkPBELjT8eglTzfRs8iMY8wO0WCP5YUTXgnEiEoMGd
	 /nVCNuWFKRAd7mr3Aj+WsJ1lBHumKtu4cFeSOUxC5fDl/THl8yjIKTbStfhtlgerXWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0nJf8L3tIJBmX+R7S/jUXKB76L6mBngZYfpLb90wRRE=;
	b=GUXKa5SnJrg9glQN4rnjyrbHxfvKnQ4JsBJpHoEa5RQ3wIWISni5unpj5e1Dpey2+GR8
	 XjhcnfrbynshfTiKdQi81eRNiV2FcB1ty4uLLsvBqTYggFSnffnyGdHdMCjTeHq+1hgEe
	 rPJcIuix/JHhNxWkteULSPOmzaNV4jlF4JDhl7Q5LEw4Fdz8SAktu7dgjAcLyOMwhfk5Y
	 4g3Q3jDylqVtwIKyOfdbQXW2HMJRCCszUG0ujfL7ddqxFe67bqkLGLRK+yqYXbSfsFiQ8
	 2DttkgDCQO1uk+E5lhUvAapQVitHBRmmQvCkV9OMh14CxZRcQ/ZzZB025TfFrdoelng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rb9kfD6Y;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE37606A325
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE37606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rb9kfD6Y
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso378018a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139797; x=1795744597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nJf8L3tIJBmX+R7S/jUXKB76L6mBngZYfpLb90wRRE=;
        b=Rb9kfD6YIfUAjjigDfbnqPUIKwU28FWkocDOdKnz97ISOHW9jZus+Er5Li8j/v0iod
         V1Q1c6RII03/85lPwZYQ3FdKaMb8luL8vV7P6AtV4KjmekEokXQLVRi67gTtVRxs686W
         KYYjoQgvYVio9vBd/XryY9GCIDil4Ph5V1EYW30Z6l9819TGD68PPN734nU4c6w6c/Xv
         zXyhwHIGsraMnrAb7Zpjl0ApaYA+AHL2TKJwqVPJC+PdrHV3JR5km0KaDmu+rx1oJrr/
         XgUXSC2jtrwrAufRhYlXGilAjgQE5lDb+qQM/e7LyJ/00ddRO5p8+uAOagCQp0MOIiu2
         2nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139797; x=1795744597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nJf8L3tIJBmX+R7S/jUXKB76L6mBngZYfpLb90wRRE=;
        b=hna5+dVej/TjkJUziueFa7CtBAb41tw58QwUfmFR1UrtsT5LLXo9UiIQAC6jflThtb
         2g8sDesZdU+yrT+dZWtSBi2kNUzk1ELP8ZcrdyvudLNY79QOuUD7nvj557QcpojdI/nM
         S4NL3duB1oeY0G8HhjG5TzjXeiCAefkCmgakc+TkjH5vsSNEb1BE/1lAIwXSmWL74JLc
         DlC065QXt9StjHq2JNbDt47rZgsl/7v0YTTasdkxERNHToIR8KbcdX175jH20qXxlyv8
         +HnB81oUPBgAfERAbw+6DDu3GgVo9FzvVjSWwNXrNcVl2KNUdtiMBGg3O3yomYs9P2gu
         wWqg==
X-Gm-Message-State: APuU4Z8fnFwR7ikCqio2qmRrVrD1IjTwz5cfXgwxUKcpQySnk7IooYiO
	oXEsgTpTOVtu+UvWtWKA5VC4nbNsfg5HDqpnL/mmxJRr7P/rnD3utZ+EzwS7QGyq
X-Gm-Gg: AZFdTZdKYCb3K0FOLElzsaOi7Y+U0sm0cPvSvF83GKjHTmeQZwjVPVrizKSnWhK2MV0
	BBdLcN/MkEe0X4WtxBvx+TVg5cU2ZXEd3usGNPAhTsAXZ6+xxGmjcPA3d060qncHAPhbKTFn8aP
	8kpDKvu0NTYPHZyVD1LZlUTWk23wDPR15YL5MxAdFyfdXuSY89wEtAJB/063LDSydtym3LyVMDA
	RrDQw233VBe1k6EKswl67QUcbMQFOlU6yROBa0hedEza5thx8ovQOaTumz1tGNwiaPjEsl+PXv7
	Wh60Yfv09FItRrPkjj3HZjqSCA0iLXDKggTx3CUxz0uxfNw3QYtrG+ytCSzix0XUIXPzCuwgc+k
	givptRay421e3dDJDhexuRJviIAmoSvei2Iszrm4PdwXts/MzJJhSdf3opWW1r5RlaW6gz6L0R6
	Gx+dOq7lY8BqIgWnJeZrJXUKwsb/aOXSzNVO5d1xGeif1JhMsZky7dpE8Vk3JB+d60uRGrDn6eg
	O1etL7Ouk1VjLL5qFjghXLQ7LRQQ1+B6mh9fTaTSXFcRN+gpSGxru/ld/TqNbnMdcxKbfTeK4xy
	oJB8nB8OqXmmODPUtsIDcwDhGfBneBurNrA32Bv2u/1XmoTh3t4=
X-Received: by 2002:a17:90b:3f43:b0:3b4:1621:ba74 with SMTP id 98e67ed59e1d1-3b41c8fe3a5mr1269349a91.17.1795139796615;
        Thu, 19 Nov 2026 17:56:36 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:36 -0800 (PST)
From: Tim JH Chen <tim770802@gmail.com>
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	haijun.liu@mediatek.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sreehari.kancharla@linux.intel.com,
	m.chetan.kumar@linux.intel.com,
	horms@kernel.org,
	linux-kernel@vger.kernel.org,
	tim.jh.chen@wnc.com.tw,
	Chih.Hung.Huang@wnc.com.tw,
	Tim JH Chen <tim770802@gmail.com>
Subject: [PATCH net v7 5/6] net: wwan: t7xx: complete NAPI on the not-started RX poll early return
Date: Fri, 20 Nov 2026 09:55:55 +0800
Message-ID: <20261120015556.131547-6-tim770802@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120015556.131547-1-tim770802@gmail.com>
References: <20261120015556.131547-1-tim770802@gmail.com>
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

When the RX queue is not started, t7xx_dpmaif_napi_rx_poll() returns 0
without calling napi_complete_done(). A poll that returns less than the
budget must complete the NAPI itself, so NAPI_STATE_SCHED stays set:
every later napi_schedule() from t7xx_dpmaif_irq_rx_done() is a no-op
and leaks the runtime PM reference it just took, no further RX poll
runs on that queue, and a later napi_synchronize() in
t7xx_ccmni_disable_napi() does not return.

This early return is taken after t7xx_dpmaif_rx_stop() clears
que_started, for example on the modem exception path.

Call napi_complete_done() before returning.

Fixes: 5545b7b9f294 ("net: wwan: t7xx: Add NAPI support")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index 77770869d575..a7d6289415b1 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -848,6 +848,7 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 		atomic_set(&rxq->rx_processing, 0);
 		pm_runtime_put_autosuspend(rxq->dpmaif_ctrl->dev);
 		dev_err(rxq->dpmaif_ctrl->dev, "Work RXQ: %d has not been started\n", rxq->index);
+		napi_complete_done(napi, work_done);
 		return work_done;
 	}
 
-- 
2.43.0

