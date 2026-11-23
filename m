Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399072;
	b=sYhWsvTePfEYzuJslp60nvV+telxq5GMvheKRJXIYpRO9SbGLlAUnd1N+UzrgJ7yHdAt
	 gWtfcAXsZrQioiwBOnQKE9vkFup3sbAYIVSq+SnVbiwNOnny7sFIkJkBDklZeQE5xTXiy
	 HpP2c2mNrMZZ4CzozVXOrUmCQGO5lt2N+fZgq1HXBST8/mrIzs8UtNC//c6eBz9FrHvEZ
	 CGY5VAdpDiVr6W6vXugvALB2kg171HBLjY7RcyPWAADcw6ncZsxX1wXUP4pSsC80Wn+dK
	 v3EpCVm0CeKLCqtZ83n7VmrYUVjHnTNv5MWL+cYFB4D7iFnBJafPpZ00Si0Yt5F2/cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wM7T3AJod4EBmTcKF7LzaZRbntzoK6ZSjCdw0P7V9/8=;
	b=uFFblBiSIMAULmt4tdtgFDEu18i4hHRLj3OB0/SQk1j+rsTTxedXhaVdNNOO12Y4NZf4
	 MFmyVjeHtYtmqLDSsqdRfUtTRPlCJnAFqUI/XttdJ7fXl10uPmg03zddy4AGz/4Cx+ZqO
	 15+JAmIBQBoCE0eFZArrIcWlaPb+vuRvFjF9zH6RPY6KnmwuzKh14VaFUO09fYlmESkgx
	 BkFaYnBKcHMq4MKcO/ZhiW9TOKJPLNs3zeSJdsQ1sQwWJwZg2EmwcO8qe6JEouP7HoBCQ
	 gQG+zEcslKts56CwAx8/Zt24V5kP9XCQk0/w4CWLjNzKFVMZeF37WOtP5vKAOKheFOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAIBn9Nf;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335B0606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 335B0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XAIBn9Nf
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36a315ed211so3574542eec.0
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399071; x=1796003871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wM7T3AJod4EBmTcKF7LzaZRbntzoK6ZSjCdw0P7V9/8=;
        b=XAIBn9NfPG5z1dR4weIWq+BXD0KqpxWIbswxq/foRuS+Enfu+1cNzuILKGZMpLcJAo
         kvme9Jgq1/1Yd6exe0rRKh5JR+zkn3Ehc1+TOPhVUEXKz3V8OLKch71AH0T43H1Wf1tT
         BT0eaDCfYnZky1pvSBnyUaC7ETuyUf0dplWICHIJZ31Kjp5ev76zbdrfMPnsCHGUueaC
         nsEoC5AvKThV9gcnMeKMzcoXD2jKQTy6Gvn4M0uX24Xup0BUiN/QQX6n6EY+P5Wlm092
         BeQAvIYOHEGOCWKLak2znSkHNl5MMUCMZ0Yhb5Y8+IQJ1IbL9kCuDlWkk3siiwoMSLa+
         Otmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399071; x=1796003871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wM7T3AJod4EBmTcKF7LzaZRbntzoK6ZSjCdw0P7V9/8=;
        b=a+QwX6coW/frWQotkVIPT+ik284WEajiwwQbPLOFJ84H6O92zcU37eLkHXJIrNiLpG
         tKvN0ld1TfHPqoYrBIEeTMyAHZGHk+3UuFcspbtPjSBbDg3yq827PFhj+OlZ1qJswXf0
         g02vbivS/g5oWqLlLSCxEEO4dqHjjfKWrf5qWcytGvCzLefZX5rO296yjVI8tvR2OYu/
         XeGiosbpY9gt3hD/ZHuwNmQT777KGKVvGCI5JXsQXf83Tqwlz6o8DkEZqHjp2gCxot5y
         dWHVOSoQkKekSJaXilaC+KyG9w4LbOAdJm1P8i4HhjPbS9f3BW1QAHba/zxRArOk8rbQ
         YRtA==
X-Gm-Message-State: APuU4Z9Dw5emeIF9nYx8WP51TvWUWaV2up6k9GqAuAXMIKcUPs299tfG
	31ecU4rgHK+CDTqCMfwG+U3HwaZJY9rKte/TCTV6/DjUHZ0uHyqQw1YskiMgj2UY
X-Gm-Gg: AZFdTZeldNutq2LkSiiyHys1/l2QDM3/aAi+dUbc0J3RO/+iEWwkp7Ud4UA26JF+nly
	71ki6dbSX7TNQyYg+GH25spCd6BUaSvwrnQ8vIE4RA/b3pzN6YJFq2i3XOqkPtRSDKzVSBE9hlP
	78WTNyeSgiAQQchzQyc/Fmyx7UaW5h9Hg76XC/PbLbOLkTLbNX1V3Nt/NmT3shZ7Q2IRVrcS6pc
	mFZA4EEtxowePnTmBi6i9r3DSpoqYDJ3XHMygMunqmqXWUzDfbDCUdSvUSwGqXrRjk0FfHGpEDF
	2oEgv3EAJ4rxoYCRw1chbq/uACWjrUJsNilCRCk6ItK/GdHiogt1C4/bsmhqFoxn9JDhzxKb3Wj
	pDf8uB8sqX4Hbci7+ZUC3nQ2eab3qrrrARimXiS4a1o61WtkLWL9tmgTC34uEjygsaClPsIM/KE
	lZFMClTLO7Ge9GRXcbyfoY/LDjBWJRvCEakLYIpNL4HGuuiv2N9fO8wGotRmA8xSldSj06WwC3l
	Wznel4dmayNlZEr5ui8/FEKbVZTeNSct76wVIai8Q11e8dPFmhhdqhNlTq9kVaaNenq5cvzoU6G
	rooFTnlEdBH1ssjkjxzs6QyqcwJoo/5X5nolrzwMk/ujwnwKCccCm2hjt9V5sNyCjNdpDBwLN/Q
	qxs64vOlErfhPfH/sqWP54jVBQupuVKkVqa1fg8HdndIQnSZKSORplHF2k6cfUKCeetOYdcKy
X-Received: by 2002:a05:7301:b8c:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-384b3986ef2mr12977042eec.6.1795399071276;
        Sun, 22 Nov 2026 17:57:51 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672ce402sm28493736eec.16.2026.11.22.17.57.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:50 -0800 (PST)
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
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v4 5/5] ptp: ocp: correct the ART 10 MHz input frequency
Date: Sun, 22 Nov 2026 17:57:48 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-5-ahmadexp@gmail.com>
In-Reply-To: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
References: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
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

The ART input selector named 10Mhz has a frequency of 1000000 Hz instead
of 10000000 Hz. ART pins advertise 10 MHz, not 1 MHz. A request for the
advertised value passes the DPLL core's supported-frequency check but
matches no input selector, so frequency_set returns -EINVAL. Reading
the default ART input selector 0x08 reports the unadvertised 1 MHz value.

Use 10000000 Hz for the ART input selector, matching the advertised
frequency and the corresponding ART output entry.

Tests using the actual ART accessors, stubbed registers and DPLL core
frequency validation reproduce both failures and pass with the fix
under ASan/UBSan. No physical ART card was tested.

The issue was reported by the Sashiko review. Codex assisted with the
table correction, actual-accessor regression tests and the changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179538006772.3135.15875996486888374193@kernel.org
Link: https://lore.kernel.org/r/179538007070.3135.8275620503580456948@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
New in v4, kept separate from the unchanged DCF correction.

Testing: actual ART init/set/get functions plus the actual DPLL core
frequency validation and get-before-set functions. A literal 10000000 Hz
request succeeds; 1000000 is rejected; the fixed 0x08 default reports
10000000. The old source and the one-MHz mutation fail runtime assertions.
The test uses stubbed registers, not an ART card.

 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 821ecd1a13c8..93923d5a2992 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1385,7 +1385,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 
 static const struct ocp_selector ptp_ocp_art_sma_in[] = {
 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
-	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
+	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 10000000 },
 	{ }
 };
 
