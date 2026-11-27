Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807388;
	b=OOgrjWf0e+b4nOarbd/twRytHNaWHPoulTfX+J20ddE2yjTbNxqnmaNPc/i0YatTImnp
	 sY2O19moW9yqgb/yr37ATuVaD/ocN73d1+BJREUA4yxjUI0dCt8HJ1C9vfvKDtxUgnjJj
	 b5vuRkdm4SakuTlYkJj79RRrBsE3uJmPTpUCC2Q5PYGpXOjND2mCt7SnrsrcZ640KnBm7
	 yofwuagiVn1+eoBaG5iDFj7fqm1amGxTLwft5/L0H6yr0Vf8hki2ACdp5dbsS4imCVL3n
	 3GXQ3aBTKyFF2650oZoxSw5rCU9stK+A16nTGoT3xV781HEGHHI4EYKuaLkTEh5kCZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qN2WiFFf7GKstQhbELLdKxcR32e0/q6k6IEIDbJabnE=;
	b=Rg5YpPFfdu8hqhW1wAfwRK5+5ylSO8vc7x4W3Af2YX6buTe4YTQCeEVYyxrgbJXiJH8n
	 Mg9R3kk9GerDbVbPQAktZJHRBzhRXlfIL+EOeh82Z1PpVHIK3FPQmm90xvNy4dDyRIZmg
	 Umh9kpZJB8DF8oife1k59Vxv3J5LZ98L7hiph5uwY89HxT4H+lGwubbCsXsCQPNRPWPSn
	 L5q1Hsu9/HJU7nRB0uALdksvLp7LJF/M8UiCo0fTl1+DPnAO05fJ1k19/hCJC8khq2HtO
	 3sr/0lsTw6rtaKlYx3l8EjHkeXLMDz008YNbbmei0MR4JkdBEKb4iT+luIdZKljSewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmyqymzS;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3CC606A692
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B3CC606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmyqymzS
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae58d17cd9so9701954c88.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807387; x=1796412187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qN2WiFFf7GKstQhbELLdKxcR32e0/q6k6IEIDbJabnE=;
        b=zmyqymzSuEPL5vkjcy6GkIFAr21035AhgdCEd84SuwY7m9ddz5WXNtoGHOsb67iX8Y
         Mpl7BNQwV6j462S8bPqHjje5N/IfhJziwUTHIH0en4NKeONj2MtNvtuOBy/HtJEnqLuJ
         BYuc92m1w2nnC9pFE33p0/zhHd+Pfpy2vDv/Dyu0T2ozF6pGO6bwUr8NbY1CSvSHL2TR
         CWfnfWU8M+eVICcUb3EL2E8I3SZrlgpwOTiTzZJyutTvW9aHMq8q6+9pFcINgUjKJg2o
         QDHQYW1JH9k6XtNpJAJFpnQ3ixV0VOuXaaU3r4PEAiExFSK6MsJqWxN41yDNQ/XMS//0
         sraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807387; x=1796412187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qN2WiFFf7GKstQhbELLdKxcR32e0/q6k6IEIDbJabnE=;
        b=wGx8+HeRjPibwkVg98LYh0Hf40IixOoyvZC0/i4ZcL98TyLcgXwED6IfdMWI0b7F/n
         9CV8zjNWyCov1Hdh2a2tcoWZawOJ7GnwFt0z+DJKTlbv9p02eA1AnwngTgIvCV99b7r4
         Xz1Je+HDedWL4cwHL6Kq9bBNdwTlziq5kFZdRdEWQQ3b0Gr8Kw6B9Ob3/wv9GQfbS4o4
         iKjdHxpXmb2ln/agPkkxArERQsZUF3QxaGBwvczrbeQbPi10nVbvRLeemw0AdVlr62U5
         9o1bROvLupRbRKSbYFzBJwDqr9ulOBAa1bGoqtt5ZejLR7LE8lVwubTONObVO1zFtRAb
         oN9g==
X-Gm-Message-State: APuU4Z8AUJY1COxqp5BR9BlxlcSa0UmLNYMZP03TjPoyui7g4zNrIYs1
	MxfAoJ6Rw1ZLaYfsUuCYEBqGhRrPLJ+XuzGeVJye5tF6Ahs5Lke7pfOjjvqvJGm+Ccg=
X-Gm-Gg: AZFdTZdkHkE58+H6r8oiSWRYeUhDCX0kfS1BDOzDOMbD6DfusThvliRfVxD3tEEpco9
	PLTHPmEyEyCSYk2lSQRhv3mAr9dyXG4lYZ801/BxcH2HugNlRIyY4A4rm5tjxTD9CkV4jspgdhc
	3yfHAE098LAxG8LPVuZLhscazm6eAj3lr9fvrCx/rXAnqHEoWAKOQpUXhlXQDedHdCs59GC1mKi
	7z2F0sbvj26ZvC5BhxaZuqt0Bs9ECoC0Z0MuLzkXOc9dyZOwEOAvrw3quJqqbhPYW0IVxL6t/jK
	HIar/GSXSYG+H2tPrzXvRfLFE70CBNmddRVKe1oa49IYOWlYXXHj2NaTh46IUlWxqWnfQ8V9OVv
	0xC3HPo1gMCT+BvbASHVFnEtqoG6FidrkCW2uUmKhSbFWKYirck5yGlDab2SSegUKGGFrJgDg8I
	2QFaP33sFpqi95WVKcfFbqjdLSdPKa3SBIxX9pKRm0GlQE+9mBtwM8KTFlxAliNLNV3gvvsmpym
	wHeK6QFVmWAJtjuhR13cdIp+M9LqkwrZ2chQx0ShfZNKsRFddMILQCZeM+S8uoRyR69nABleE9f
	9d6mXvn8Skr+eosFSHxOafwdIwjhm9LF/bDiWEudBPbHj4C2C2YtyKUK9kFDqTUUB6/af0GT7qj
	rT7yq2s/hH9oEs8qdkZ9lomcW94tDRLU1WlDAvlzzE78IJ5t63wHLSVUvo0Y36Q==
X-Received: by 2002:a05:7023:a8b:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b5568ef837mr26223679c88.41.1795807387105;
        Fri, 27 Nov 2026 11:23:07 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:06 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com
Subject: [PATCH net v7 2/7] net: dsa: sja1105: keep pin function on PEROUT disable
Date: Fri, 27 Nov 2026 11:22:57 -0800
Message-ID: <20261127-timecard-driver-v7-2-ahmadexp@gmail.com>
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

Stopping periodic output currently switches the shared PTP_CLK pin
to output even if it is configured for EXTTS. Only select output
mode when starting the generator. Keep the existing stop command.

Developed with coding-assistant support during review and validation.

Fixes: 747e5eb31d59 ("net: dsa: sja1105: configure the PTP_CLK pin as EXT_TS or PER_OUT")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/net/dsa/sja1105/sja1105_ptp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_ptp.c b/drivers/net/dsa/sja1105/sja1105_ptp.c
index da35805152e0..5d69d083f5ec 100644
--- a/drivers/net/dsa/sja1105/sja1105_ptp.c
+++ b/drivers/net/dsa/sja1105/sja1105_ptp.c
@@ -733,10 +733,6 @@ static int sja1105_per_out_enable(struct sja1105_private *priv,
 
 	mutex_lock(&ptp_data->lock);
 
-	rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
-	if (rc)
-		goto out;
-
 	if (on) {
 		struct timespec64 pin_duration_ts = {
 			.tv_sec = perout->period.sec,
@@ -751,6 +747,10 @@ static int sja1105_per_out_enable(struct sja1105_private *priv,
 		u32 pin_duration32;
 		u64 now;
 
+		rc = sja1105_change_ptp_clk_pin_func(priv, PTP_PF_PEROUT);
+		if (rc)
+			goto out;
+
 		/* ptppindur: 32 bit register which holds the interval between
 		 * 2 edges on PTP_CLK. So check for truncation which happens
 		 * at periods larger than around 68.7 seconds.
-- 
2.54.0 (Apple Git-157)

