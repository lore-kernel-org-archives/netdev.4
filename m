Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807392;
	b=jTnz6RD3Pv2KJrKxU1TuYtqdnPWqXHCk9CgsxtnOgygjEachTpd7jfDx25ukF3tgyxU3
	 I1Ksf2zxKOsWPkfiAHElmsrMRcn0YrPMsmjjlxrhrKalxa+KR4Gh00VstWbR5JHSLI287
	 jEhlfCSzwbrBW2DZqdU/7dD4KKvqWMUyY896EpYjRlpmgGC8PXJI4wTyoMAxgJv49DheG
	 38mI19U1mtK+XRa276zWrIOKTMw/uVHDNSXFEUbXF/p6yJOWOacDyH/cwISkUInh18Df6
	 gGjWEiKMxLEjrgZVVrQkgxQ62e75zRLwUu5rS6aJ1D0eCnxx7viGiIDndPrOy8ZjBDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A4hZZP69a2mG/B96CPqpSoZpjIm5ZpYqEQJvtKTyt7o=;
	b=O71jBW0fEV/Mctv8E05Rtdrnwk+yj+OuGFrLBHuuVMFFxeKceE9+QSsQKVhkEtfrte0n
	 XtD0sk0yPttSW+P1T774xu6iQgcsHGnA6iCPkz+4NxHPmIaBoe6Ahm5bfjpZ+w8QYUojY
	 J5rkuTwhVc0bCZ0ZLM0/Y2S2nVvHA68y5vk9Dyy6dg6LXSjplhxexqElfRUyVQo/Ptg4O
	 BSjEQZH8dlnFYy+DzocMFJAhjKMbpJsdT5fpOqySubJqLvuJTZ3eNlxZ0fGgfOVpMCyvb
	 XTkEmsDUhOH6yYSqzS+tB6vLhKpO/frxondkDorsBqjiEhpcljJWA/U93fIX+L7/ltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBdIipQ1;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F965606A33D
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F965606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBdIipQ1
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so12569651c88.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807391; x=1796412191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A4hZZP69a2mG/B96CPqpSoZpjIm5ZpYqEQJvtKTyt7o=;
        b=oBdIipQ1IKgszwg2+P40lacqzAeZlQ8WihfbZUIC0RypBN1iXk5fkIXkL89MZ8v7ve
         aA04RU7F8wyyakrdL2AjFVHnxnTKccFcMTVEmNNR25Cm3wNumnbltHM492c/TioGx79+
         zubbUmvpYQ5yG6XIKzdp0TORT/suQP1yUJgm7jYCNv9LH8y9RROwM9ehLUFbsTDROUSq
         hXsqzRPNkXPj0DQnqWLPxxl9MZ8AVnDBhMGDG5MBPjirwPKtaIKbFPqM+R0R5xUeAaGG
         YHP9swNPn272GCwCUZi5z7A3Q1DGVP4T7j438LnNwwdg+ajnDBv1AhlmWfp7PLlzyF8A
         dcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807391; x=1796412191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A4hZZP69a2mG/B96CPqpSoZpjIm5ZpYqEQJvtKTyt7o=;
        b=Gp3lC1TyhWzsDht949ZrsdNIxLEwuyRQoLxKCdebn+RKoL0I7e5TgqsYRBvQjQKv9q
         MZBbFuvMvp1NG1vIfFwsBylQ8LWvlRAWZeC5IRsQmpavNbXznlQ3aUMbbE8F6TzpyZg8
         vHbjnw+c9EEuU9uj53zzznvVh9enVwpq2iwMyJYxTvWeGnTgwYmgt+XxIe8utan/JcYi
         9AeSVphQtBOVcmiCyeep5OjzN1kU+2yM8KNPbfkl+NPD1Hahn6FS6+KFgjaPAbLE6hmZ
         +y7vQ7VQYp2uTdBBoGiFd3fkwrjDJ3HDEBofV4rxfmFlR8mvyCHhl+UINHIenLERc66M
         vViw==
X-Gm-Message-State: APuU4Z/EqikYADSbeTR1odzt6A3uiqVW93MBsTfH7biz3H48L/LS1rAv
	5ZUvi898IhgSgnr+lXQFM2PE9pd1tTdEcBky8FTvWOpfN3G7mbNJ+MLSXUDfgRieft4=
X-Gm-Gg: AZFdTZebD6S7RNdFGsFLENOm6/coswl6XCcFdjjtPq2UB/bsBsaP7Ao50XirENCAv5D
	RlAvWwrt1mMeuP5BHDPQLhSfFMtjiWfIGGsHP77FQ9h+rG9JBd3x/RTe153RycljKc8k+sz19hU
	Xavn+UsTgt9dm0TKk302PtPCnki9TmI2qe/GojcASNyoBJN9SZUZkQ5h3L63wRhbCs/HWZZ4GHv
	kfz+XKK79swbxiA+FuciTYGDDBINN/p7U5jSVEel8YQJELiVxBKnafdXq9AgGbLyY8FjAnNAZDX
	PGXEhES7CKTrQzn4VJE2yVCa+rItzNa+w3VHeFvHyry64/L/7PUN4NcXaJny6VLZ1sfY7gDWRS+
	EmiFb/M9tffFfFcjlAD/UACcbNWA2bp1mjNltDZjRo36icnkmraUKoPgdFMr6GaunkwpReCUFjv
	No694DcbAEgy5yR7ykNwKg66pqaK+9yYfGkNxw/2zR12IEOQlwBRpLVny1snepFkB4f+YH1XQPv
	yfENnEzgseLGl+n7CtVchsAjVdxhherxch+XaRhyP32y83nOuD6+VX1zXTgKkKzgJi7GrygYLEx
	TbKRLH41WNYmJHz/zHmKM646RLwvR/fRYICj/hHC+eAusQkdFjL0eaQ3fG7YUR1YV5piJGP/Bxq
	cYvZ9V82+oB8hq6iLcKYxgofBkdnn2sumqb5rQ8M7/m+sjwuP853AXvyhD9RWrw==
X-Received: by 2002:a05:7022:1583:b0:1b4:fa58:9d3 with SMTP id a92af1059eb24-1b5568ac1e3mr24987638c88.24.1795807391075;
        Fri, 27 Nov 2026 11:23:11 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:10 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v7 5/7] ptp: ocp: report disabled SMA inputs as zero Hz
Date: Fri, 27 Nov 2026 11:23:00 -0800
Message-ID: <20261127-timecard-driver-v7-5-ahmadexp@gmail.com>
In-Reply-To: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-driver-v7-0-ahmadexp@gmail.com>
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

A disabled SMA input has a cleared hardware selector. On FB and ADVA
the cleared selector also encodes enabled 10 MHz when accompanied by
the enable bit. Once that bit is masked in DPLL readback, the disabled
input can be reported as already configured for 10 MHz. DPLL can then
skip the set callback, leaving the input disabled.

Use the connector's disabled state to report a nominal frequency of
zero. Keep enabled input and output reporting unchanged.

Developed with coding-assistant support during review and validation.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 6cf060d3b1a1..9500fb2635a9 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5941,6 +5941,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 	guard(mutex)(&bp->sma_lock);
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
-- 
2.54.0 (Apple Git-157)

