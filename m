Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188531;
	b=CubfZhmqTE26x8+pRdHAfEfO9ScK7OwQXPjuZ6TBL1OEyI3GQS7rF7tuyPKh3IlwDLQX
	 TOGWKg0NoQ4MEFkLqoVIu5ab9T5kVPjk8SEvTMts48HK3cHWxHNxBdEW/aFe+Fifnos9D
	 KulCGvP0APCvRlGDnYgz6nhtv2CoUs6KDJXHZsWTI7GB9glY/SUc9LrB4lVtrS/DPavEo
	 BpImBU1BTcMAxVHYQqU8mLIPHT0fTSDoeZUPBBhTt/A+e/q+Wtj1B7dxFPdQ4Zr8mKCn2
	 CwVxOXH2WeRYZf/y6gx1WFTa50w48YFtiL0hbQFvaCSBmuCDU1ac8g/4WyfG8dBbsAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188531;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kUtDIm0Ij5+oRdqP4qF3qpYzW0b2g/KAzdOQ4qh+iyE=;
	b=uYb0Jl1UmOloHf7czJCMXIQ/To93AnNftNV8wr+8tZTuUMPlsrFeBwfPxmzwblr0u733
	 Rxe4zVniFYXw1heyzgYixgeAiaec+xTK+bY/oLLxIj6WhxyWm5DAs+XEtv9UtjIcJfSor
	 lXk/ximjGhF1AzHlgFe1d/RjjqCYBeFbFboC/jeKXSKW4dpHUzkMGpcD/bTCPjpVAuTuM
	 eTiZMdsKRlLEJR5goVXpfIQ2bl1PfGQZMSV4W+QQ62/JINJN04DzTv5EhffD+cZLSQnnS
	 TPH2wUGv4QuO3UXs0O6D3vc5BB2Fg7pVgquWoPAcOrea6G5wJmHr02n41FUmMbI6AOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aNtxi2VZ;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453E60A261B
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 15:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7453E60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aNtxi2VZ
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a9f9473029so860346b3a.2
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 07:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795188531; x=1795793331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUtDIm0Ij5+oRdqP4qF3qpYzW0b2g/KAzdOQ4qh+iyE=;
        b=aNtxi2VZIn9GFf3yaUr6WsQH7VOkU0qz7ho1puyEJQS9u9HhWQ6R5X8yfJ22yijGl9
         IbCcJ8IgdSaMRbk7TLSJOXy5vKIicAb5TAwupS2qJUlHUR3uQIpTh+FB5pliEP8RGL7f
         EgHy136rXDBJifSQaDbIWfgAJ+3eFEO7uOXPrO6SUA8LOeEnoA7pu1/6nLLwND5V25LL
         zyEocsZoz0YGZRTnel2o0nf5MLV2xj7PinZfz/4GrTvDqeisRyp80zmSLExLmVQ1C7bx
         ncDunPssQRmxtmCs27pG7b8Nn73pNKxMqAFArND6owFgAwPeyXJikHecb/XEB0Sxtfac
         ZWow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188531; x=1795793331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kUtDIm0Ij5+oRdqP4qF3qpYzW0b2g/KAzdOQ4qh+iyE=;
        b=tui4+gGPQbMtnhY4aAW9g69uDx/0Q9duHrx4zDlKnw+huIDWo+PaHQMsuoaV1mD0tC
         GUISxeQce5f4j1FKQ6X2GDfhUzTFyZb3ve2NngBi7/eufwY1IhEYjjLxj87SkEg1pntR
         M08Sn9YD1fqmiYA/vVsEPIji8rEJp4yqtBdEBb7tTuQQLMCktyKTl+yXVCLpX6Lp/BPG
         Bb30EIpo2Rg/uwcrx1PWXa1xrzFC7x4kMXFvLXAabty2S6Ajopg7+3NhdDeXCQi/uzA3
         QLhZbBOO80Fad12Xl296eZ4ZWXaCTf2uYxvkm3+eGWACFlox7ipyyzOJBbDMoyFw8M96
         AL9A==
X-Gm-Message-State: APuU4Z8V6ixDjbqT9gzCC/q5oRPtPuiZ0OCNVJZPfJPNbJHvrjPNi0F8
	Xm044kpQQ5yvdo3l799eFHlnkPZkfI5VaymG7qxbOe7bLzbNtnPuxHhWMCqutRucpStm/D1gqaJ
	cv2AH
X-Gm-Gg: AYBFou2Rk5L7r/PwtayGC4cSMce+9dUdwgsSHBsYfZjGNrRf7Y6LU3njDO7bsrzphez
	9wzaGIAneLGLgWtB4STTFSX1iFhxfzDMmkXydEejgr+ni0la7bjk2mQ5TGSNWb5KF+UGwe2VcCx
	7NpCX7z0Ini7RDdd/0iCe4BWqOl4fbhPAG0/j9+ihB/bOoAjqyhFLDrPB6uA6HX1856FumVvrbe
	zi/FMTHayTZ8gBSJlI4EC8HyWgl6zxTN/ZciWzsOBVUVMbYuNa7QundNwEbU25PkkdaK04CzOFT
	Vi49ndstDUqX4ydExMk17nu1K/ymfd2sxj068sIAC7KLKzWP47O2BqZSgcUBuMSIs+57WRWKNNC
	oP6nj2SqM9sh20DKZD2KbIuYiFi6/aor4ziWGs6Qo3PW3prtXCBrF83Te++Hij5oATBJugOI06B
	Rht9GGYJjt1RiXFuHVLbMhN2SeeFidcJAONg0nSqRk96VGce+RY6hltQNOmSzJZpyMmk6CbZMTk
	5AzQKk9A55LM3RNMQXCyVH6vs/WHqYuDioGdb8qiJk0Viqvg4Y3HVM1IJZDx8hVwaXWXqgHsrop
	or8OQJwY4GlAFMaForOh4vE9D4TdyZg1+wapmTTkFyI=
X-Received: by 2002:a05:6a20:e347:b0:3e2:5d7f:f630 with SMTP id adf61e73a8af0-4014d75b547mr3642378637.54.1795188530800;
        Fri, 20 Nov 2026 07:28:50 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8707792e8sm1704693b3a.7.2026.11.20.07.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:28:49 -0800 (PST)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Prashant Sreedharan <prashant@broadcom.com>
Cc: edumazet@google.com,
	horms@kernel.org,
	selvin.xavier@broadcom.com,
	kalesh-anakkur.purayil@broadcom.com,
	linux-kernel@vger.kernel.org,
	Joe Damato <joe@dama.to>
Subject: [PATCH net v6 5/5] bnxt_en: stop the ULP around the reset task
Date: Fri, 20 Nov 2026 07:28:27 -0800
Message-ID: <20261120152830.699712-6-joe@dama.to>
X-Mailer: git-send-email 2.53.1
In-Reply-To: <20261120152830.699712-1-joe@dama.to>
References: <20261120152830.699712-1-joe@dama.to>
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

The reset task can now stop DMA when the firmware does not free the
rings, but the RDMA driver is not told and keeps using the device.

Stop the ULP before bnxt_reset() takes its locks, as bnxt_fw_reset()
does, and start it again afterwards unless DMA was stopped. The silent
reset for a VF config change is left alone.

Fixes: 74608fc98d28 ("bnxt_en: Ring free response from close path should use completion ring")
Signed-off-by: Joe Damato <joe@dama.to>
---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index 9daf053293a4..2abb721d87de 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -14710,10 +14710,14 @@ static void bnxt_tph_update(struct bnxt *bp)
 /* Only called from bnxt_sp_task() */
 static void bnxt_reset(struct bnxt *bp, bool silent)
 {
+	if (!silent)
+		bnxt_ulp_stop(bp);
 	bnxt_rtnl_lock_sp(bp);
 	if (test_bit(BNXT_STATE_OPEN, &bp->state))
 		bnxt_reset_task(bp, silent);
 	bnxt_rtnl_unlock_sp(bp);
+	if (!silent && !test_bit(BNXT_STATE_DMA_STOPPED, &bp->state))
+		bnxt_ulp_start(bp);
 }
 
 /* Only called from bnxt_sp_task() */
-- 
2.53.1-Meta

