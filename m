Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711342;
	b=iB4jgoyxARvXP7GIXBOP6M+q1YhcQXeS/GQe4pvh6TgdjCY9S8wms0Y3s+ElUEtdgSm0
	 vGugGj9U9g0sRStqIMUr34S2glberSdgz06DxHjjPYIrn/FpsDu7yyokwq0AB4OiI6B6w
	 QjcdaBfumhfbuEMsAMDZTgSWjWIWqH5LzG5LgI/rOxbasg+++cU2uS8R4qw0SGxoHvBa0
	 /8lmHd2W3r5iu54jDNvG4krU4G+jAmHrxedyywwVk/bTsjQscMZ4qLa+WKNNSHG1ns7Gy
	 gYa6RXs/UWAz4MG+ghLf8BFparBmaIvGPytlFPplbu6cpGCbgqJ+T0XjpfHcQvKp1tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711342;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IQdmPyCid0NZnSr6leV+RginXKpXjarbIm4H9OSUfg0=;
	b=1Mj1yaTkIZ36cPVbswgG/JCFKF8H1DSzkthJ1vBBHPpSeBfcbdD5vHE0AAGJHfrGd8aM
	 C6KqfqgQY7V6njM/9Zv9dDcqtieUQsrtiwjdzq3pi3MKZy3e0rous4og4M2OE2zoJ6OyW
	 PL0c5IUryoyc8IKfcD2K+sjVCVafLY9OLcB1PTxI/HOY93Zj46InGdzjW9WLSSg6FO2Rh
	 +W27Fj9X/24Md+15wJRfcQOJG8zSWPapZrIhJZcQJfUuYVVPVp0cuVOZrf83Jh4A83tFv
	 3vri+Po5J68t2ATVya+YdZUV+1I/deavHJpfLCemO7bwp9M7nGM9vyyeVvpuSmO7hyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxIPCSW6;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04CE60A3825
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04CE60A3825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxIPCSW6
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3869f03af6aso6334301eec.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711341; x=1796316141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IQdmPyCid0NZnSr6leV+RginXKpXjarbIm4H9OSUfg0=;
        b=yxIPCSW6quj34kjCiJfIyWJ596L+aOnNRYTXdtCNIFNoh6KQi2+KZLy4uutKn2YjSX
         pz9AqaUdmP5PwbmwbwDqc7n02KRoalhgSCpbTlMvYnI0AxSuK0EM6nzR+k99gmtdtMXn
         Nc+b28POd71wkpFt9FMTGwEG8FVuqRrow8mCl2RMCBkOOGTVnfB0hOL9tkxgRaDiQZr9
         8lFb11+C+48X9CKisCmKDBWlybZadvPoF80GxkwvMERQQ82o570k3KRSthP2Cy2xrcT9
         ehiTUDzy6mRmmiiw3521DinWqpDpfoZqYZs2JRdYUUNX6giGy7G6rr7qQcBHhMfbx81z
         vs8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711341; x=1796316141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IQdmPyCid0NZnSr6leV+RginXKpXjarbIm4H9OSUfg0=;
        b=QewMDvPMB3JI0Oua6XZW0bg9oaWxqizLUDooNOBXRmCB3/oVjAbnq88dh65jE2Ez7l
         AzNUGjjopaADsGYVWCl8OeWve8cFFmQZRDcxvQEY+d04quxKPOLArSRnkMwVnzHwika1
         /nsHkBHjuJoS5NNSS4tCkC8+7xp6k95PZzz8nDh4o00V5UxKdDv4pVS5sY3hy5lS6aWg
         upc/zHUdQatvOyJan7he92BmWMmANaeTBMOms+Soxuqy5xM1N2DVNfTRAoj2x0A6Ev1R
         cwwDTtgS7Bdg6FGD3dNsLnEVTOCKPae8W6pEf+Y3EaALgvvtaqjkdM87UniRQAElBGqf
         ibWA==
X-Gm-Message-State: APuU4Z9+8sYHnyKJ/74CMiruJqlwZljIEBDgSfE1a6+D5rzS5+hVlK+0
	mIV1qhwhFkk8WXe8v+A3cni4LQyKCjJ2nCaeAKvSii4RbNMNGN4JdBK7UCdqbk34
X-Gm-Gg: AZFdTZdA5+H+zzFJU2Yut30YjhZ6wEwTYaV5ekr+LrPB8FbEinISVFNaxFUFqc3nOIj
	MPVbdc7Ew/LHm8r60Lv2Ug1xirHaG65uZbWRVAdlZyVE7lFXyS1HGdef8i9Z9Qk7Zv84CUsKROX
	OehDqPOvmx1rfVhXqnhfAi8WxLalLzpmezKRzEg9s2pWpLNtXdC3NKVGIODtRBioNetNDzjVy5i
	h0f93D53r0pa8UGMY37VAm7G5Y+mqtsvb09okSdw/Rooj4meKgXYF4u3OWqnW8gMlNUacFGG2u/
	ca98/3Qr2JAAvaP9t/xrtUMu2CA9SJaq9as31lcSudTfrZmfJN8+eUYqwreYYZbaeVoijosYaKB
	xrzV8im3195w4igMeuEzN5uzpHHsO/l0sAqrX7h7mlgnIBgE72P3jTWz6YzH4E9/sab7Vmg4Cfr
	YURYrK/dpl/wd+YTwNQtOWjW4Mg4zeIxlvrrrmG+3hhfT2N4QJm1zCFjCFwdB4FkZFFhOo1hBd4
	l71m5/55uVunXh2FO+ydaWG7FN0cdEupH5+O/84IN6vSWrsBchrjgmW08KddL11RWMTrjmmcVD+
	1KI+74ao1tOv9OkII8wZNbSzlURkllfifhLU3l0pOJ4+6ezw38FTb8xXfbxHI48yAP0iLy5Sphz
	GjaezQPi78gYbZTwzJUq17MsfBPdsjEJTElf7dAPxloNXBe14ui9m3mqm/GlaxjNWelCmwBb6
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr14031360eec.27.1795711340923;
        Thu, 26 Nov 2026 08:42:20 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:20 -0800 (PST)
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
Subject: [PATCH net v6 7/8] ptp: ocp: match ART DPLL frequencies to selectors
Date: Thu, 26 Nov 2026 08:42:08 -0800
Message-ID: <20261126-timecard-driver-v6-7-ahmadexp@gmail.com>
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

The ART input selector named 10Mhz is recorded as 1 MHz, although the pin advertises 10 MHz. In addition, ART pins share a generic capability list that advertises IRIG-B and DCF77 frequencies which the ART selector tables cannot select.

Record the ART input as 10 MHz and give ART pins a supported-frequency list containing only 1 PPS and 10 MHz. This makes DPLL capability validation agree with the available selectors.

A coding assistant helped identify both capability mismatches, develop the source-derived regression tests and prepare this changelog. The tests use the actual ART accessors and DPLL validation with stubbed registers; no physical card was used.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 6bfd5792768e..040518895176 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -299,6 +299,11 @@ static struct dpll_pin_frequency ptp_ocp_sma_freq[] = {
 	DPLL_PIN_FREQUENCY_DCF77,
 };
 
+static struct dpll_pin_frequency ptp_ocp_art_sma_freq[] = {
+	DPLL_PIN_FREQUENCY_1PPS,
+	DPLL_PIN_FREQUENCY_10MHZ,
+};
+
 struct ptp_ocp_sma_connector {
 	enum	ptp_ocp_sma_mode mode;
 	bool	fixed_fcn;
@@ -1385,7 +1390,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 
 static const struct ocp_selector ptp_ocp_art_sma_in[] = {
 	{ .name = "PPS1",	.value = 0x0001,  .frequency = 1 },
-	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 1000000 },
+	{ .name = "10Mhz",	.value = 0x0008,  .frequency = 10000000 },
 	{ }
 };
 
@@ -3138,8 +3143,8 @@ ptp_ocp_art_sma_init(struct ptp_ocp *bp)
 		.board_label = NULL,
 		.type = DPLL_PIN_TYPE_EXT,
 		.capabilities = 0,
-		.freq_supported_num = ARRAY_SIZE(ptp_ocp_sma_freq),
-		.freq_supported = ptp_ocp_sma_freq,
+		.freq_supported_num = ARRAY_SIZE(ptp_ocp_art_sma_freq),
+		.freq_supported = ptp_ocp_art_sma_freq,
 
 	};
 	u32 reg;
-- 
2.54.0 (Apple Git-157)

