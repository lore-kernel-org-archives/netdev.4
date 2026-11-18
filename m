Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032326;
	b=16g9UDaEFjFj/+y0iup91Ytqa67Ri9iOG2zUXE+HV4L7ZnpUjeQS+6rfFytS09aklng+
	 Km+VYykZPf6UKQEc2xgN2Y81hJU/aYu2K0Q51x5fNT2/UYqFk0nYHr41aZvcnrKZRUVnC
	 HVsv1TCVY74IgWU4Qb9g/wX+iVFZ7b5NNlTKvNUtZfEurqNzzY5KaVYEpW8NgiN2n/nvu
	 JfC8+YawKWUMg0GcaDuMDJCDT+VWNKg1P75Fy9topH2D26rHOVHSM1gY+QxpFjLiCtNr/
	 C0C1WgUK/7ubY7pXmx+wnLqth21NZVibniP/PucvdXnHM9rAUmbaR/3qmJj3qb8CkAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qVJbETG2LeDXBALin2vR3rFx5RCB9UcDMxdKkRsHFns=;
	b=mjYBwIGHj2sIdn9MQ0Sm4PH030jZ9PuF6WyrpKR5R3zaigJKNxrkr6WLtxuy081Ynoe4
	 /GYp06ReMPDxeIRseNFvX9BeSDZllnPSyBzCB+rZL4lwiSYTH2Ffurb6ULIEJUdgbtBc5
	 1WBb6IhE4gFS4AU6hI3u9rQZOZ7JxVGcohoWldDpjAPTp9SShzrBW6HEvZ6avyqv1l8Ge
	 CWRtW/BGGM50O0W55T1cLCgUWPzqT0BhuE41GBYjp0MnqutHNoe7PDtXeLdFy1u3/fSiB
	 pic3i68vm8qvP8Ow1ISeb74PVnrqSHMYxsKPbNhAgMOlZSXNnP4XT8EaxpK3/EwDzhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR2eYP1i;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E4606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC2E4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wR2eYP1i
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2761c69fbso1554506c88.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032325; x=1795637125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qVJbETG2LeDXBALin2vR3rFx5RCB9UcDMxdKkRsHFns=;
        b=wR2eYP1i8w5H1uJjCa/do4iEmhf5A9F7pE1zsyanMoXrcF+1Oc6z5prtSu8iLpLvjn
         FpbVSW2dFYOdeSX0e5RKC1obHqzTE/VMqmlb33F+GzfJJVpHWq8nPoQSZO/96URaVnZB
         1TqlvaXtfZ5e1FlLF8KKcxlzvvty4kgCHRzh6OVV4GwuINjSYb1i4UoOPwsHakt1ySoE
         MvW6d4dbD1MuTiItsezcETjQ+NuxjcEIyw/bnWFDlbjGkbN3c+ctHSGvibRe11HTjpi6
         LNER+4/PCtceCLT91bySKr8nRr4uRf1+SXOTv4ni99ON20vs/uOEjLKUv9yPHHidW6ZF
         CdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032325; x=1795637125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qVJbETG2LeDXBALin2vR3rFx5RCB9UcDMxdKkRsHFns=;
        b=OuAxA8l17nta79Zmv0ulxf01GxnstHi1bBUVIuuJ08mTDXxmPA2c0V+OA+AdnNxCyC
         rXdelqAkoO55TT691VmfNMM1QzbPyjmTXpO1mLXvq8IKANY/79VZ8wL8WUNmEtHHeucl
         dlg1OvS4Hqzxlx3ibM6xmNb/szpaAbfaI7xwZJqOHf8MFgERREBWeB47pGK5IJNO/r28
         dK0MyoVrx3xij59Xg4QaHK1/es/OWAwkLSCyF9LlrXtB8QYjU0LI8C9I/WnWOMS19ioi
         LaHUtyixG9NyFpSTjafMwvrDQvzolKhum9ztDcslJAWh/3hPog1Sb6ieBoWqoBaySjv1
         PCzg==
X-Gm-Message-State: APuU4Z/QRsbugc5kZMqPbNiZyKuLq4fRDHIdvZq9NRcIdBI0m5izkpRc
	YdTZ6Z3h8j5zjKXqoqgfxz3Z/PnRGWpF9EGjXrS8CAYXTcCEOwhFJxtaOXoP/0HJ
X-Gm-Gg: AYBFou1frAD4kS8EgvcjsXivhUx4YT5ToEnBn4XQsc9gT3YirWK3dcDNuEN2jzzHsiq
	LbXZ9zQ1hnXG7Oe5Ckb20hG9aTZ757xoF2h/hCoyByV6EUUkpGySBHMjNOuCs7t1D1xuJon11vG
	T/bETtR+dWFCE9/r0wvoojXxOmucSs9qI4sgU+PSLGOen81e9hpOitKy7bUk5wdTKkCUdaeRDc7
	3sqJMJQPwjdwYOyxfiIuk7eVKNFXrVwin71oyNRCpPnm9K3sPmrMuvoMM304zuXVt6r+aOh3daq
	9eTM04iXNheo3RpLVSTZUOkzRuYz/V2EAyt7sEtj3C57ub6aeQHSkSmYW78Npi0DlYdAgOU39ol
	yw34ddxPgNXFxWxzYtNeKJ0SMZkcs1Hg1k5k3nH6/uZLk/OqJybImrfqGEN77Rv+PbaNMYKcFJK
	7zo2kWJWSDf63ilxgPDdt5mWu21/Sh3S+NzZIL1Kk1Ql8bnaNr45USsHsBUMlXP7IEmzTHUja/Y
	0bUfzzgQ9YoUTfAMv4SgdeZZIqids6f9vcXcHCDdtxtIDAesglXRB6Tr41/a0KSWowh01AN+Jom
	eDpgx9MBoBvM9LzYwukSZnDBPsnWUudwS0yqZa/dnHHwenqCT4aSjXToxRor1SiIcQu1iWz2tyh
	V5dRPy8HmZcMsn+1b6npF3WvYuZva
X-Received: by 2002:a05:701a:8148:10b0:177:9a5b:a89 with SMTP id a92af1059eb24-1b543c2572bmr3674952c88.29.1795032320945;
        Wed, 18 Nov 2026 12:05:20 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b549e398e4sm4026688c88.15.2026.11.18.12.05.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:20 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 3/4] ptp: ocp: report disabled SMA inputs consistently over DPLL
Date: Wed, 18 Nov 2026 12:05:18 -0800
Message-ID: <20261118-timecard-common-301f823ddd-3-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
References: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
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

Disabling an SMA input clears its mux field. Zero is also the selector
for 10 MHz, so a DPLL read reports 10 MHz while sysfs reports None. The
DPLL core then treats a request to enable 10 MHz as unchanged and skips
the setter, leaving the input disabled.

Substitute SMA_DISABLE for disabled inputs before looking up the
frequency, as the sysfs path already does. The None entry reports zero
Hz and a subsequent 10 MHz request reaches the setter.

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
 drivers/ptp/ptp_ocp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index d449ed8ca2..650047581f 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5920,6 +5920,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
-- 
2.54.0 (Apple Git-157)

