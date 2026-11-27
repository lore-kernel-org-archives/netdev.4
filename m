Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807391;
	b=QFKzzFV1hM8/8fn4sPOsBgVisunB7Nu/kh5vkChkykjtXHNZNQZNvVb///c9RE+92saL
	 Su1F0/HISS5Myee66PUBxS1fckdNEv4KKeYT3EAkqNfJy163i7ADGEzuKUFwk2mulfOOO
	 I58U3PtNfK9a0gVQZSsxOZgOuLeRnwqFSeSXNvj8fPzaI8Uup+lbyZqoonrxDpEv7NOEE
	 GT/2gDzL9kc/6YGQgyvu93GXh/aCfC4Gpo8Yhx82ICq+r1gjiX33rsx7P6yzA7Aa7FGij
	 Y/vJ4IveFp6ZvweFuZff6MOyPt26R48YFKpwuvchUmgeIko267hc/H6+XTh1X11apXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hAfjzrAnWOvVhSH7jNkmz4JMPLTz15NAUJ6Sxn4cWNA=;
	b=tG8ORvedkbcD9ifTDDCnTnaLg/eDkkNMCbzPXh+6QwTwAjlD30RQ1cOtrhB3hpx17jiI
	 +jnZVq84sfv+MDgSumFrNK71JApp9s5E+34wynCjxcKk/iVnMG+sUrUIu4vfsO3YFNqmr
	 ftFcC0zhriIC7tfuq3BqrObP9rmmASnra5J6agMddJkJCCLOieW256PTsDzXxG+2meieP
	 rIbKaYIoreGqgqDWzULpsrk3p5eQYScs4peeiD+GfQJOGNpCWOLg2wSahy7ygl8oXx4MY
	 rIhshRv6LEOi3vIaXw4e0tIZeQ/Utx8RzX5sQYUHZf1IBFoP+UyrUYGH4LK4ziMetog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQjU8dlt;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB47C606A6BB
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB47C606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQjU8dlt
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-14394530ec6so2576916c88.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807390; x=1796412190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAfjzrAnWOvVhSH7jNkmz4JMPLTz15NAUJ6Sxn4cWNA=;
        b=OQjU8dlt0JxjaPDMoT3DI9wTP3dsJC5PX2aV8qMk9fORyqvle1Uxc06rUB0aty96EZ
         kRLYdGeqX+xT9oeNSzPMp19Z5BVZNq3jZiBGT+zc3VMLDMua6vIzilxmHHMT5kB6iPVY
         aI2lw3UeklvuGd1enWo1wyaK6vfOMTEJtvzBJWOR8KoNAMr8zcDCzwq/7CcgW9iDn0Dz
         QxaGP1pIqLEXPUwzy29V3fekLpJ/jX8hxNYR5+1/YFEJFb1hHR093D4/IPTJKXzO5wvq
         sORdstKrvaVdiD4B4mqR0TPbjJnzPd7a+3NH+240E/1i1mbsYKehiDzx1FlXZAhUfK0T
         UNgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807390; x=1796412190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hAfjzrAnWOvVhSH7jNkmz4JMPLTz15NAUJ6Sxn4cWNA=;
        b=CW+kgkocAMvv+hhO+OCsEF8Xm1zgNdvg0vu2a00XsMWuX1SNxZgIM2P9NbD7OiwqH8
         15mkbEvPt7bSjOV6QGf7TKZ9zD0I1XkeasRaKmLwKe1WXJZyND2abFS3TsALHbeXYAJl
         dphXCk6kOPkoVPof4QAis7dhzf1ZBg1vQfhSjqm1WFsRNy1ZGjSlDGAfUz95o+qI+gIj
         2PZ2a8PKyywxKy6MgRKRgEd5zM5eVXheuEcI1x4RVNnvEZmkl4xQjtTpizuqOaotoi7S
         t+VR4SRClwPvb5dUeUoRLWWhJjhEbDWaUCctCnAVLOqbFnAXgMl6lmil7Mn+HiTjIhqv
         yUyw==
X-Gm-Message-State: APuU4Z+TCt3zrrrD/PKcpfruUEgwoDvPVgTo95zb2BmSuQ/1HCGyOpSt
	WjDdBaBKaW66I2bImJq0ViX8+6SXnAG3AoA0+2otTnc5k7XVxUapa/sQPgUUng2uhug=
X-Gm-Gg: AZFdTZdteztaCiReeP3qZLX2PGJQEQMQrZOPM1eb7HzLqVU8AubEKtKkocvAv9eprCD
	qiFuPn44lJ5KBYjsCwMEPgPvNgiM5ssXyuCmojbS/tILwx2AOdVEK7HmhqObAGEx4f/8pdRU8W3
	d9+jFW4OjIrGcBRvs6Dojj79L/VK/1IGeF1bLNa/oxe102eb8w5mrkiOb3yrY79oZdIWwPXP5Pn
	RbrNz5+86BaMhQI32OEKhl6f5JUoEgXyXAEYzx+j82Vk3zBzck5KpFY2wxhxf3X2N17rg+neJ+V
	mo3qLDYlrmtjA7XG4Mirb0/cxTkDFVGYcZ2qvwXVvHdc5ZCPEVTRXMi35ZPV9Lj3Icf6pvWMlSl
	7mYadvbZ0poLIT9SQQGqWZcI0Gnk6qcQTFZ3gcGWfrKPNlKSAD6tVURNmjYpv/dH6rtPuOEuhVH
	uyu8zOmTtQWf80Ntm7q5+CQQrjpRlrvcDhqTEqqs8UIakv0T+HgYcLBsVA0/vRNiappckZLM7vW
	6J0cw+2WMqk1KImWy3u/Fs4fGvm9GCm0vwk88L8F+TPXJMDOMU2SNwxEs8l0eueohxu+2DSUIV0
	sj9LbC7vT8hP2Irn9uefxGZEjC2hhlo73aJhMTeOSVoXgO4XUxhtFph/z+hDqvQzCvmPkc6KIqf
	OYu/FcitC6nGzvMSQI5wU8LousYuNTB1uMDvNjDDqOA+PB+RakTUbZqQWfIaH+BbyyMcTC7PylP
	1b6FgSB+8=
X-Received: by 2002:a05:7022:e886:b0:1ac:2f6d:e1c6 with SMTP id a92af1059eb24-1b5568a4f42mr32400786c88.6.1795807389923;
        Fri, 27 Nov 2026 11:23:09 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:09 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v7 4/7] ptp: ocp: recover SMA direction from both enable bits on bind
Date: Fri, 27 Nov 2026 11:22:59 -0800
Message-ID: <20261127-timecard-driver-v7-4-ahmadexp@gmail.com>
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

An IN: None request clears the input register. On bind, interpreting
a clear input enable bit as an enabled output (SMA1/SMA2) loses the
disabled state that is already represented by the register pair.

For configurable FB and ADVA connectors, use both enable bits. An
enabled input or output selects the corresponding direction. If
both are clear, report the disabled connector as IN: None. Keep
the existing per-connector default if both bits are set, and leave
fixed-direction hardware unchanged. Probe does not rewrite the mux.

Developed with coding-assistant support using v6 review feedback.

Fixes: b2c4f0ac53f3 ("ptp: ocp: Add ability to disable input selectors.")
Link: https://lore.kernel.org/r/179579808276.3135.5382400825629748441@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3781f6582b7b..6cf060d3b1a1 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2926,13 +2926,22 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
 		for (i = 0; i < OCP_SMA_NUM; i++)
 			bp->sma[i].fixed_dir = true;
 	} else {
-		reg = ioread32(&bp->sma_map1->gpio1);
-		bp->sma[0].mode = reg & BIT(15) ? SMA_MODE_IN : SMA_MODE_OUT;
-		bp->sma[1].mode = reg & BIT(31) ? SMA_MODE_IN : SMA_MODE_OUT;
+		u32 inputs[] = { ioread32(&bp->sma_map1->gpio1),
+				 ioread32(&bp->sma_map2->gpio1) };
+		u32 outputs[] = { reg, ioread32(&bp->sma_map1->gpio2) };
 
-		reg = ioread32(&bp->sma_map1->gpio2);
-		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
-		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
+		for (i = 0; i < OCP_SMA_NUM; i++) {
+			u32 mask = SMA_ENABLE << (16 * (i & 1));
+			bool input = inputs[i / 2] & mask;
+			bool output = outputs[i / 2] & mask;
+
+			bp->sma[i].disabled = !input && !output;
+			/* If both are active, retain this connector's default. */
+			if (!output)
+				bp->sma[i].mode = SMA_MODE_IN;
+			else if (!input)
+				bp->sma[i].mode = SMA_MODE_OUT;
+		}
 	}
 }
 
-- 
2.54.0 (Apple Git-157)

