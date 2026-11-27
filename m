Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807393;
	b=xn9rPHMYgxN8v8bUvvEiyF+F//2hNZ7sVsQ3MpYqCSxiKZaURxWENfKG8T8hQHsE7GKA
	 4bD5R6vQ9UMcc0AQhn2z+1b0x5VqAyGgX0jyyywuiXtm9Pef33z4UXzoOYPtLEC5G3EHN
	 gp7+HRQl6nyNxK7pEJjGP2/AVL31zVMwML1mPT0Vf9RV+9+Qn21zF3u24Jce4w2pfgsZN
	 2d6EjBFrXtdefz78LiBf/eoN6GuWuVICvakbAckPoOI0YoE9tYhAIK4TtMB4Ti3Nd+w4X
	 89EtU4i8QUxYqEDlHiVf2XMMUHGxiss2aoiw8uksIvTWMPkbRiYO6haynVQLOHIA/+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FvDZsPZIMldoIHRfHKe1+LHmIGavYopNLG72UQarEiA=;
	b=zZ8jFUEhz2IfUZ0aA0vyvBzkev2kFZHMjzezBp8rdT89MESAGEOsw3JdAlLTXuGkByEY
	 UOHyXcsuc1W+rEXmUkoC4VW3z/f7cKKAqr4mAbRFPtkuJwnPnOHYHTT0zwJclYbjcTBiy
	 b3iIZoKagx/i2qj9ZGjuc8H3rjmkjpvoQYaX3vLhJo5RaYA+hTzxE2x6w6X7F73w/huc7
	 z3ieSOOSSmmGmlZHDv1lcZtvR0nvZnFXopDzI7b19DhT+FOfUT1+hkNJgHqCMdQM96IbT
	 QxNSX7oG9bdA5Gu2PiAu8ZaxeygExoNo5AJANqauU2QgGYXrmOk+w+3t/zRpQ5UfE0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BDqS6RFJ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FDA606A32A
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14FDA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BDqS6RFJ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-385d8a00598so13034583eec.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807392; x=1796412192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FvDZsPZIMldoIHRfHKe1+LHmIGavYopNLG72UQarEiA=;
        b=BDqS6RFJGM4NhUstZ7Gem94i5ca6da8Zi2t9OHSPPzeafcYz0o4F8K099ikAuz7Ivc
         Fr1ZL4deWN05QrUusmedCFJs4CJAKnpLbnF3qYdcLgD9cXNvLtkJdcfUSxs9umuDQOLC
         VHEOXGAjhGVZcgjGo4OSwn8F2J3dElixVpcJpz6k/IHlYIUoO+hMrhV0eR9k0KG/lwaw
         T+dLr0JwK1KxYcXuMPZqghfL5JsYobbD/CzhNz7/B9MTp0OVSy0iynWZugtLtYg23jG8
         tOLtU3NxmwSxOu7yn7LCor/nSMeGSW/h+mg/RAG9YRLCwbEv9j2q6mSzLFqyfEzvYanU
         zSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807392; x=1796412192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FvDZsPZIMldoIHRfHKe1+LHmIGavYopNLG72UQarEiA=;
        b=OmdfLn1WHI0JC2I1ZZuc8AZyYDnjsBEPdFkOoHDG9KnKs0AFMM0IhhlAjmgbgOQ+mU
         MXFTTd1aC++KzC8YlRuOgYIS7K+cMVsgrBFrIV7MHqbNnU1jaaLtAHHAcP0R1n2XdoVk
         lp1ZHZG2zfuF3r6miMv30kiwcn4AOYCxT8bI5F996yS/mLGVQG1gjJ46m6/T8BYk6ui4
         Q+ZViFR4BxAk8i+HY2vW9Kx9vj/IhO9j68UecGeRuAsT92OmwggGudJo8yrQymmdGITV
         V1vNfAbZUrLw5RICkhh5N4JaBdQ25Qz7c7cMkQp5nMOnWu7KBSDphkPbjYj9aQWR6KjW
         aeNw==
X-Gm-Message-State: APuU4Z/YFhT2r91gHbCuu8uHGUI+XJ1xKTpGTm3v5LlTrDp7LYact2Iq
	vh9VZZehQw54igmRCqXE6WKCEHjr/2jPVCMztVO80BM3nP1pUz/WbnBC11m3jVENrVw=
X-Gm-Gg: AZFdTZf/eiWc3UsqxBO91FjRFQ0QIb/oCXm/V0DxAu0KAxhgea9puMMUtw5wNwdYVrx
	8Ep2cYLA2QWWzt7lk/hMXIMDBj8qvKY0m/eQOPrpxe8N/nRMHC4fLazSVBgkC+4MVxk+Fw9PGVj
	735n0V6W5inQZKiFkU7Spld2228gQXi/rfBpObwODZnF1kV7tPILXgfDTZO7bROkEoCCcMBtMJ4
	SsK72AuV3ExxCWlIzaMSp6wejwnvZ14YMVTkF1dhk+9Ym7ehGTrVGHEV9S+a98rdZTz5WaJza+r
	ofRr7b3jBUacU2OQMNu4RKgaw9rFKR9a8CxodPIs2x+VKzm4RzvUU0368NmIvIB2wtXUG2/NoVO
	/UwvmvQTHrezTS80S1eefsg1WFnjvzORCG2+MXinQXrnQO12Mgx2XPJnRmnjhel9FgWnbW/FIpy
	ntmbn6X4Hy3gOSTeFhsky+Gs1xo6cM2mTUhjLPt8dYnd0B1EnJwIPg1hy3OPqImC3oVHrKzJPRN
	pmsEl/IKMx8umnpaXwLHh++dF48dVFSs6csk7TGyq4Etx+dO8vERKUtew8LGBuzKRehEQk+0hGg
	svDSg/36A5mVeRPRxRCbIuxgxncS8Amm/Aq16UAdIGRAB5Qmmd4pCH7Jnj+wjpQtv4V6ksE2TFV
	hbSRMm2ysCfiEdSCFwLll7gknR/qNFv9vMORV6GZnADruB4nQrzj5JDTJ9/CsUkI=
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr24510690c88.20.1795807392202;
        Fri, 27 Nov 2026 11:23:12 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm97005883c88.9.2026.11.27.11.23.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:23:11 -0800 (PST)
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
Subject: [PATCH net v7 6/7] ptp: ocp: correct the DCF output frequency
Date: Fri, 27 Nov 2026 11:23:01 -0800
Message-ID: <20261127-timecard-driver-v7-6-ahmadexp@gmail.com>
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

The output table uses 77000 Hz for DCF, while the input table and DPLL
capability list use 77500 Hz. An output request for the advertised
frequency fails and reads report an unsupported nominal frequency.

Use 77500 Hz for the DCF output selector.

Developed with coding-assistant support during review and validation.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 9500fb2635a9..8e898d929105 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1374,7 +1374,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
-- 
2.54.0 (Apple Git-157)

