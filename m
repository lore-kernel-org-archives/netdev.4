Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123194;
	b=IQyRbhFqNvoWUdKNLznfzsChxsbvHGMWL2uUzpvY5rDd3maFn0DqFlHO1umNf2uPEYgG
	 SLjRGg6esA5Qhil37eoy1EBFOGmxfUEhy2FBUAfIyAVJdIEjy/m1NjfhmFuK3Ztgd7Cqg
	 cGR/xZphRmvGO7ngZ0TzMewPihc3M9aYVI3mScaCbQCvjzfe9sDkbf674i2AARA/Jy4ub
	 gJcgQdd+bmU71M4zuCDvlsBa6Q4BSXIb7Xst8tNYGBDxKsbI8cfL/Q1IUI3JrP6Og9XOI
	 MA23fkOBAOgqEEenxa2OCOudFTnBYISl+/TRiC5M7lqKOYuISUGS1FWfsffv1B1aUrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lDt8R/fL9/b2BKYlgJuHImg5pzcUatfwwpYByRaaI+A=;
	b=1tAbOVzz/ERDig3pdv5uBn5dqJg+CCo+YogR3YIubGu4w7766cA7ETOnsNoUjIZEzytk
	 c4UbjDJQzVPDtV9WSpZLEOoz001WpKaBQS9X6xbLViokxA8igfY+jB0DkkCBE1F1vt9MB
	 oGkYbkCygVnFT/zdnXSbHr71DlbZHBlpG1lpeSBsHW/l4YvhbvgRYz4O9EcJ8MGbSqQ0e
	 SR04gwaq1Fds18tQK1FXkj9DroyVIQmfIAiKxwDDM+uLvDE8QyiCdv0OqpLdy+fKayYOt
	 gQtBj8gC9FciGpkjPbLWHTMIEObwroFlibOM9EEjfGFqfBFqN29+tvcjWz4w0kgPmiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZ5BbNsd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48EF606A33C
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B48EF606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZ5BbNsd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so364417eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123193; x=1795727993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDt8R/fL9/b2BKYlgJuHImg5pzcUatfwwpYByRaaI+A=;
        b=YZ5BbNsdryzciFagOspWEc71oEEQAJLB3n0IVxyH9fAGZEgGpy0byBtKNmJwqLymNe
         abp7o5Ec0/DHEhVtoun2H167ENuLDoqDT2Q9KfT9tRna6oqIEw5F/iIMYd5ziVJiwiLk
         q62kcRxqHKg/aVUWrqb3OomJyS7JmU1UF2M0fQuUTx80A7Q53YrsHSVzZb3u9mcKL5Qb
         eIGCb4Xz9uAplR5zzGK2ng5juTIigPytMgf1UjDpHQF43ETRj7qauwm1nR6Aa4NkPmrC
         NxU8p/a+PhGe2vuugS3Hqz5iXyw45E+DtQFEtGoVfSeOiZsmF89JzRkPMxJlTa+KwKbL
         zLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123193; x=1795727993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDt8R/fL9/b2BKYlgJuHImg5pzcUatfwwpYByRaaI+A=;
        b=WYHivAaX82Q/HTXf9DtEP8Z5ncmdGEhVPToJdvdhGDaPugIc+VWkW4OCSTp/fOUkbp
         f/l6zSJQ2RLNUmAphRuEWqD3IfT7jMx/siuam3ULIU3Z6huE/RAOjWA3gSx3xbgt5pOO
         VgntryRZYe1dtEusN0v7o2Lzy+Np/5S1Oxbs+CuamSUrllhCjMl1waLH8sAp9vaZOrdw
         q8fPxjNdha7prIXVzQy1Mibhv/B5e74Qa5jhD/aYT1TmMgiR7SRY1sFZHIYpRoLpX1Xe
         dwL7icXTiIYGXixCxVKMtjYmVe0NNxsyOFxKckywChTt5xG9Ab9nTUiki+tFXfp3UtGI
         5WPQ==
X-Gm-Message-State: APuU4Z/qZE5XCtbdJtQYzaDDUfyfyld4EMDT+hBQ85IgdjoCF7DDsnHa
	RhTwfQCv4muIddD+hUtfwCMYS3C6xJatzJ+ZPCwntZ8Y8Z92wns2JIXKQzdl7t4m
X-Gm-Gg: AZFdTZeBcdgh4qn6gvsMo2il6YumuIfeWQGG9nkFPg23xyUdxnWW3JZ1/TlgNRheNa9
	HGKMBSUjlneEtEXkjTvSgBISp855rR1cafAikR+hQ0YcAODwzJDYwgoRTCbQcQ1iaKhqaHNyadR
	bucNgUPJFdMhdP3vS6QvU65r+uajsyJ7FM3vSLdThYkU2YWC6dllp+fWw3aPqn4bk0GZbDjqku7
	P1DU445Hbsgb1IBURHyaAz1KiRdS5se7eudDjQ6yFfLTW0+hyY1CBkg5uIpQVntS6cL6NhRoMNB
	vWqRJQPReaBJlwzGdGL2GeIez4qp68NQgNmmhclTrjbBN9jt11JTcdrbYAAetHuv8D8+hk7Zo+F
	gnFHBUnAsGCdRgCyRU2uJhz83JrigjTks8HnsVsFSnlQ9AHpygnXbad9bYKSewgTC+/RlUJw2kD
	LtMYXST+4tu3WJkMhEVJWV8ZV3bdD0EBcFH6boWNAPzZcEnq4yL+YzfQYmMXR0QC5Okmu8DdwJx
	ve6PUh8eeyxQpvCMpEeWGSuGYBmrXzFdU3sPe1UDX3WHheI38Fi1i0DQ1QHOiK1O0AxvCEg3Fl+
	1EL+f0l5td2541t7ysfbfU+pn8jVefI3QQD8M+08YBscbo6GJLfICQjkyv3UdwwmXgvsn50j9ZU
	KrdXurlaBwFl/F/GajFrrOPTpgnISmJy9DLr4g1n4a6HpxrWqMGbzsTkRFmg7zVJhheImHxVW
X-Received: by 2002:a05:7301:6582:b0:374:e25e:a533 with SMTP id 5a478bee46e88-38570154017mr968431eec.35.1795123192877;
        Thu, 19 Nov 2026 13:19:52 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385616f0a3fsm1373147eec.0.2026.11.19.13.19.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:19:52 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH net v2 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Thu, 19 Nov 2026 13:19:51 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
References: <20261119-timecard-common-v2-078fe69f33-0-ahmadexp@gmail.com>
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

The selector table index is not the hardware selector value. Passing the
index to the SMA setter can select unrelated signals, or fail on ART.
Use the table value, as the sysfs path already does.

Mask the direction enable bit before the frequency lookup. Otherwise an
enabled, direction-configurable pin has no matching table entry and its
DPLL get or dump fails. Apply both corrections to all board variants.

Reported by the netdev Sashiko AI review and confirmed by code
inspection. Source-derived C regression tests pass with ASan/UBSan;
restoring the faulty selector, mask, disabled-state or DCF value makes
the corresponding regression fail. Tests use stubbed MMIO, not hardware.
The driver object builds on current net with W=1 and KCFLAGS=-Werror. No
physical card was tested.

Codex prepared the fix, tests and changelog from the review and upstream
source, at the request to separate common-driver fixes from WiWi support
and validate removal ordering.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 4c98558e96..f1f97c1fa0 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5903,7 +5903,8 @@ static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (tbl[i].frequency == frequency)
-			return ptp_ocp_sma_store_val(bp, i, sma->mode, sma_nr + 1);
+			return ptp_ocp_sma_store_val(bp, tbl[i].value,
+						     sma->mode, sma_nr + 1);
 	return -EINVAL;
 }
 
@@ -5921,6 +5922,7 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	int i;
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
+	val &= SMA_SELECT_MASK;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
