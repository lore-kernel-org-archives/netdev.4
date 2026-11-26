Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711339;
	b=hdXeJ0dZmyzOtYGYKwmAQNwINT+rr2nwJHAzVKRmkR20OXuAuCwDFuLttSoGKKcBls6J
	 MQjqz6rw6L3OTlCrPBU9iPeDAv4IBaXso6QXv9W3b2NzN/9qYMLc48ZvBAm+Yl36WcgTp
	 v5dbQy9nEtElMYldJr4Xe7JgTjZrXtfC2SYgfyHESON10ZlWC5bg7Ee3wbSyc68YT83yu
	 s8mRvF2LRIn0F/hhCwuR05evzey1auTRhATksOEx9apH7gTvwB+VYpWNnr9O2YRgwRTIK
	 dqLkGdTmlbaN4ZqloYBVxesstpTChAXVN6LwRavulf3gVRk2+1rrcefxW4r60A8ySeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yCpwmuq/d8uSHEUa04HTrUhqYayQ1lKiYDKTWrQZ+DU=;
	b=JAT1acEo05h9YomKf2usO50xnVscEYedwPayu6Fc8ZoS3xG90P5yTCDuqOYWVz1dYck5
	 okTMt6GZLs/GsotVMcrHZRdWN3zcIbBjNccFyBlAtyWukPpj/Vb/Kq6rVtquSo7o9id0P
	 uzo2QtFurnjSxVsayDg5jrWwVLfN/X6V7zJ5WIOM3yCWBHDeAwRyTpO5tb5yqebIxh177
	 0SVslWtyNUlKynEWAUFfteBI74mYG6ZKOKIHIAzDEYgrV4t4/1vXtvc6qs1FjW/awac+g
	 +jsU2kema0TYe9s6U3D+afnAZ9NshsMtVGYHMRVuoErX8DRcvkJjSaX7OtOnEl+JaDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTj1dNCz;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B2560A2606
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B2560A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bTj1dNCz
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-380c28f9e35so8173606eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711338; x=1796316138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCpwmuq/d8uSHEUa04HTrUhqYayQ1lKiYDKTWrQZ+DU=;
        b=bTj1dNCz0ssGhTkAVAaWGqjNZ/GKyMU52xi2PeTUb5Z1ipMIL1oYZN3rh4hQ2YFwhs
         La10I30Ymj2a5D4MyiQnZ2Nen5Y10L31eWI0sKaQ7d9nXPlgfqUNhUfilrRXi/y2H0oa
         NQRvG+P98elWBH7eZ9EIBkCN2K7YG9Y+A4BQV4cR1C1oL1XiCwu4gYiD0o0nuHLzHLPN
         3Jo5fBQXCRFG7CFou60QtSxlC1jF89FiCthDHMGnuBnBzqw+AvrZGVuI9l62SYElUlta
         57YL/Xbw7ByY4Cx5Q7h+UmxNxyLhw8NXZAJiIoENvlHEddj0DYKyoR/aVST6MQjagGey
         +Okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711338; x=1796316138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCpwmuq/d8uSHEUa04HTrUhqYayQ1lKiYDKTWrQZ+DU=;
        b=vH3Y+I6oPfimxIxorJ+vGenzKuhNseqn8m/txjCc6c99R8gkOizJYdw796dGJJoOAL
         WveDlvEhXEUnxtptD8mP4lgCjxfhTFAnVdLELtDR7nbsvOi5WP7LdJEud+rSBCWzLKbO
         H5MIs9H0UHHtG4nUwXrdaadHpWVFhK3DsSBEQGcfNOYWNqPkx1ubqWcLZ+pPchlA348s
         IpUoIjNnflJ8vdfTsIIQS8DUiGgdLm6UptmW12sF5Eslc0pplZKEbx5udx2V6cr8xORU
         4J7dQP3VOalxT6qtFv68ANx+14z5GAbUTP+u89L5Mt9ndWKozp9VwEc5UaQBcqxqiIFr
         FPFw==
X-Gm-Message-State: APuU4Z9dsLbaphCrQ8gW3OLr2/qE2TOiXoCCxUwBsZEAgthYYS1FNnkM
	dTo8RjCHXSqhy+wzkLPZw1Lzi7bBkNpJHnz2GTnhLlz5IxoSZBSLpc/55HllG+Bx
X-Gm-Gg: AZFdTZec9FSAvJI5FcRpT4xaolTuF+YJ3AAf+jC/G/6lGOlc62AKrD0gWatA+VC8UA0
	djHhHRKmyPQhKa7s+bMY5HHZgWdq6ROAA2NRG6VB8vLC1r/8DsupOXsxo/5LYxlOv91DvR2gAh7
	UibyuV/Ecxj0Ish/l9r2i/5y5uwvYczNl/g3cmXdHDOb7FY4TM72gNSzpTroQ7wvc1mPhMNbGlS
	jKuslDq2+ehjPPM9AtBOKHqRMV6IncEHXrZIzzS3ajlk/P0nNnVrgYIMAKPXRlmUXu9ZVR87wWv
	umlJXRCejCx01MzZJRO+HE8f4+CIZ9xS+H49CxSdywzfi6DwPPPJrAGK9bD1CAdGMs+WHtacwsH
	e1cmVc0lyDo7CtwPin3iIeY3O1CmHffiKy2yz+QR02AFIgZkwqiF+jzgNntHfIqJGzg0SrEAglf
	Mh4wWTcom8ZW4CGUyBTnNtmGZojd2dIGYorRG4E3LKlmOZGvMQUPnSdw/Znln3kXuOdnb4Ew990
	1PO6aCnpDwlC1EgEFAyLodSwG38Rf+NToZNwSLRdPPJJ0iOqA1sKizH5mGQEJOC0eyabjoK1uuP
	aVN6yTbx1Hjuy84smwq/GymSL5S+y2arjQhopQcwP0bolnI2iS9FZnzYf/JMLQOd26F0a5kvjUa
	Vftgfqi+gIcDMniJZ6c7JfQ+L5RFuQ9GD9/VUHF/Y8stpkytm2XUp+XrTbWOXd5kKsmVvaWUl
X-Received: by 2002:a05:693c:88d5:10b0:386:9e9c:867 with SMTP id 5a478bee46e88-3869e9c2df2mr16951672eec.10.1795711337996;
        Thu, 26 Nov 2026 08:42:17 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:17 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 5/8] ptp: ocp: report disabled SMA inputs as zero Hz
Date: Thu, 26 Nov 2026 08:42:06 -0800
Message-ID: <20261126-timecard-driver-v6-5-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

A disabled SMA input has no active signal and should report zero frequency through DPLL. The DPLL core reads the current frequency before applying a new value, so reporting the stale selector frequency can prevent a disabled input from being re-enabled.

Report zero for disabled input pins while leaving output and enabled-input reporting unchanged. This complements the separate initialization fix for preserving disabled state across rebind.

A coding assistant helped check the DPLL get-before-set behavior, develop the regression test and prepare this changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index aa18c5e5eba4..3457c351958d 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5924,6 +5924,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
-- 
2.54.0 (Apple Git-157)

