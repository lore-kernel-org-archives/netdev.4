Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795139785;
	b=RvxVzLkn8TAsXC9eVZD4wZIxBZdkQvR+kNSsyEbOc4oU8SD9spDGp00LbAEPnawaG2hT
	 ySx3kr/COR4FrDf5fM/eLGoO2lyNe7zxjj0glxF3RVmikeqkB5HupkqnF+YF0W1hGNPPK
	 h40dR08HGfgaoinH/MRqRbkiHnOzDfqsspZWFxdO6a0klvn0ZxhPv5ytx9N4SmXUn8uSQ
	 OmPs1GtS0Bw3KU80taFjD3Zm+zFuW7EpOW+OVhmolfpQr87/zGqUaE/dZz6bQ2GI73aFN
	 RArxgFt7A2hk7Wb9hAEa5AmNJvSe/Ckmd6D57aFDlrxZuwdB3UPGVZGCWyyhGr0MXPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795139785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5nSvuBMZUL/DDBFGPHl37DizpUxFocDVUqNIe4EIGrA=;
	b=AsKWXB6qUWhzCezjjYfm6cyTKVpZR0DtjMafWm/7stK36qqLjOghuyE2xQ6D3YgtTXdQ
	 EjB7P3kQ4wxPISFBXewIrfjbzgL4macfbedbpCgOMOkN9ddcJ64ALqHqtVLc7vZDrVF8u
	 ygEuql+wRIb8NnfFcQE9VCvw0HTYK7kLLyMYtcp6lS6JcJum3MJLjr2Cv4seNkvExbPP+
	 xMlvvH23ZZb2wG6Y/tlSeNM72mZaUUUZ9OC2e0gmqoZD9CWN8gQ1Ae8xg5RoapW24Ipvf
	 hkt1OC8BgVdnkhOkY8LJHVoGgtZZZxAZ6alsM3VxCNFY2HopFkOUldt6T50bGFJYEqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rex5gL+z;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF16606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 01:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDF16606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rex5gL+z
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so220257a91.2
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795139784; x=1795744584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nSvuBMZUL/DDBFGPHl37DizpUxFocDVUqNIe4EIGrA=;
        b=Rex5gL+zVauqAIqVUMbRUb9LymDxrWeDdPsPkcuoAYuM+XH2bTO5vHvl93VquU9e4q
         S8xBZ7wGJMjFF1CT7pq9VtNaIUaICT+425Dx5e3Rbm4YAGeZl5wQb35unmMH46MsEd/c
         QOZ3x/GJtJVNO0db9GdfLTNSslZonoewARgjSpBue/fAbVO9BIo9CNwC3vSy3sloTLY8
         utAtFqYC/CeRTy3n/kS4rUXSDdm9wb62q7nXb3JvcGs4rftQKY8Koft4+iK4PyQRCv34
         MY816KI7NuU8TzpH1yRsv5hEwm9OYESoBJonaCECUEYbt/Iwh9TdzC7hyVW7rYO1SoaF
         2I7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795139784; x=1795744584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5nSvuBMZUL/DDBFGPHl37DizpUxFocDVUqNIe4EIGrA=;
        b=mbPa7L/1GLFCN0UOdS7lDxTeu/lDCimW1+V4/J3PvAbvEqGzmasb2r5FwB/sJHolcb
         ZwVSoFhy9Rn23GGRbcWpEpz+bMChBPb76oe/yOXU+lU6ajdtvL43yYase8yiMZebdiT9
         pEXahhpXAIp8n/fdzCUWXrY751DWenDpkCPRc6+hSxEYzK8zqVX8XM85pme8HklQ/tiu
         ft3mpmD4EGLgCfrpGWiRSSu7DIyfACs+PfpCG8h3Zt6brXieIptVkIda2OlCWU9z1CUc
         0UTVfobSog5VxjIeF3YWvvOT5KhYSTfhKWwJkuJlaOjKi+SBjZPMFJsRkaGl37nGUkDb
         j8AA==
X-Gm-Message-State: APuU4Z+oEZOycHVz8WjiYfF7W61Vs3zCdaD0HUxk/XTsI4+gIE5Gbrch
	ibuUOWzem32sYNpGxj8h3dk/7EMHwebPeZVZV6dQr2supAsS+GiccrUvnT445Ewp
X-Gm-Gg: AZFdTZdTxejVGBvofwlYpzkdpGtp9QknLm7qJaTBfeuNrBSo2GbpCPRgMp8VfD/5oUM
	IjFbkozpuNyk1IYba5RxDU2fpF2LaR9WA2/MXVoZCCsrFmxM0LizYrDS1jD2D+QPW6/gTzwLb3I
	M7gSqtgb6sff63+RyWuiTW8BSL3xpui3Il9HCttaxy6xZ+FKnp/tMYcp1F7jYJVUNyM/Qn7lTQn
	dRkGHTnXUCLS8qH3P7PZ9sKOkGTHZwTj/UeXz91IrZyBukMwHBGSbKtpLHa5Cn1PLNhvwPs+5hh
	Ff/30iNt2ZUzLSrHRLciGx1jr9sUau7n6w+OvWyjNbUuyRnHffc/R0Oil5sV1ZJwgn0gX4XVALI
	m4Ym04OdPOu8rOps3L+eZhc+dGTTgaC+KykW/7xZUZA/vU/09hgTfP3PaGrpQ2Tq1f/GJza7TTM
	4rpUpJ1SyP7zn0jNiu1LMniU7wLcLoEt/u9n8TkXKpOe+BXzW5SCA+yzrBRnyBeuEOy3K8k5yQ/
	7r868tZSdohEYyMu3ATK5u6rNUxkoQd4HVOTuCqTEiyp5Dot/IQan0YGZidRxHn1WpBxrKI1zg0
	CIdHRGH8HZqHCRXyy7JGbbcTQsR+DmlKfOv7Chq5XuXxRcWk66s=
X-Received: by 2002:a17:90a:d650:b0:3b3:b71b:b01e with SMTP id 98e67ed59e1d1-3b41cb533d8mr1019892a91.64.1795139784159;
        Thu, 19 Nov 2026 17:56:24 -0800 (PST)
Received: from u.. (61-222-64-201.hinet-ip.hinet.net. [61.222.64.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm5355957a91.8.2026.11.19.17.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 17:56:23 -0800 (PST)
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
Subject: [PATCH net v7 3/6] net: wwan: t7xx: fix skb double free when CLDMA send sees -EACCES
Date: Fri, 20 Nov 2026 09:55:53 +0800
Message-ID: <20261120015556.131547-4-tim770802@gmail.com>
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

t7xx_cldma_send_skb() tolerates -EACCES from
pm_runtime_resume_and_get() and goes on to queue the skb on the GPD
ring, but it keeps that -EACCES in ret across a successful send and
returns it. The callers treat a non-zero return as "not sent" and free
the skb (t7xx_port_fastboot_write(), t7xx_port_wwan_write()), while
t7xx_cldma_gpd_tx_collect() frees it again once the hardware is done
with it: a double free.

The same path also drops a runtime PM reference that was never taken,
since pm_runtime_resume_and_get() releases its reference before
returning -EACCES.

Take the reference with pm_runtime_get_noresume() and resume with
pm_runtime_resume(), so that one reference is always held across the
send, and clear ret after the resume so that only a failure of the send
itself is reported.

-EACCES is only returned while runtime PM is disabled and the device is
not active. Not observed; found by review.

Fixes: 46e8f49ed7b3 ("net: wwan: t7xx: Introduce power management")
Signed-off-by: Tim JH Chen <tim770802@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_hif_cldma.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
index e1b37deb6d9b..5b4b9ed4a95b 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
@@ -926,9 +926,17 @@ int t7xx_cldma_send_skb(struct cldma_ctrl *md_ctrl, int qno, struct sk_buff *skb
 	if (qno >= CLDMA_TXQ_NUM)
 		return -EINVAL;
 
-	ret = pm_runtime_resume_and_get(md_ctrl->dev);
-	if (ret < 0 && ret != -EACCES)
+	pm_runtime_get_noresume(md_ctrl->dev);
+	ret = pm_runtime_resume(md_ctrl->dev);
+	if (ret < 0 && ret != -EACCES) {
+		pm_runtime_put_noidle(md_ctrl->dev);
 		return ret;
+	}
+
+	/* ret holds the resume status (1 for an active device, -EACCES with
+	 * runtime PM disabled), not the result of the send below.
+	 */
+	ret = 0;
 
 	t7xx_pci_disable_sleep(md_ctrl->t7xx_dev);
 	queue = &md_ctrl->txq[qno];
-- 
2.43.0

