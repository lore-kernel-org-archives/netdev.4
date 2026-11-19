Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123196;
	b=yo5me0wUsVgYDORNqN+JQOzI10Ew5+cTXRfhsAwBBL9itLVZQr4PsNmPF46hfTZWdWUl
	 QxLF4t7Bp0XXCoyNAA3p/SYiHhJdzSZWYfpIkGDh1lix0nG9MZXj/Um6SkfV4rOpYD0IO
	 xSJmjpH6M9a8rWjP7mZRgA9e4+mL6ZNdZErDVU0jhxcYgvHNweWOpF09trzTv4cNCVeHX
	 qLOhcVGjwSr2TpJUAWP4HJC/pdYSQkieB548kUCX6b/siM8uPwxdxK3MGJiOucwoWuXKq
	 fkYtycCqPlE8hmNOEgRaQr8A90Acdw8E3NZ9PXyF9nMaZ9xCP2WKm/bGP/49XyQPJdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eheg3HVpJk++/tUa1wLaL+SmgVTMMP+rTXvoiZjTIqM=;
	b=yJTy9a1TvtEQG6CGxlNRjnlNSEikAkAgXDrdPEiYrqfPZ8R4hjQqq4ZAlSDYtdYJnAvx
	 du+Aqt6aPehPuybUmYRv1kDGBQ4sDgyIvt4B+/PkCxZ2RLBlD3ZvaRjcuPI+LOUOoDrkt
	 Y4Wkbp6IWPmsbD81oW6zXq53nL3Mpii3BAM6yu3v8MR8Yopk3c2BQHO47GYe2luP9qUy4
	 +lyDm+vfvcphR6/+KOdq5zNXWVMPzM/m+6n1uPJcc1La8ladAuyRGIrS+tfEU/pgdM+lt
	 Wbhnee48JMN7MoXG1ihu8xnILBWSqSeGZacIGTFkELs0CokuWGqj+vk4ArZUt3lrvkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohI3V2mx;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24EF606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 21:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24EF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ohI3V2mx
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38587f3de36so169215eec.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 13:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795123195; x=1795727995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eheg3HVpJk++/tUa1wLaL+SmgVTMMP+rTXvoiZjTIqM=;
        b=ohI3V2mxxpQ7uCTjCu7rfRKzv35ewDPHUk5can+HsDQ6+XacPgfgJzxGQgNqvaRO2G
         yEUZzYu4/GxV3ZjQrkX6WaZvo16q2WRYS9Rn0rZa267s4GDnWsyHq9GW0VUr2/QpJqvA
         QiGIH+E2zzgauaJVV6L8XnPBnGwjCZCYnEFJVJebIM1sQHYz/0bStN3GOzE2Ojx0j8iZ
         pdN9DaEnX1EsaYSKQAfQeAwLvw1JuaW+Bo7v4vshkddQqd6mJ95cNCUD1H7agARmFSmw
         9ok6oxIs/ClJfc7Zjgeb0UN5T0G1LuVJw4nrxmn1OQS38f9vYvW6+hKRbKOT/dtQ0ZdM
         QyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795123195; x=1795727995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eheg3HVpJk++/tUa1wLaL+SmgVTMMP+rTXvoiZjTIqM=;
        b=BNkdcwj6hl9SSV9l3IWpcZO5uIXIBLN9aioSTazOhZW+vLY385kuWdF42IxlN2pevw
         daEu95OJ8b8iidpul1piTuRfCUyXjl0tUoWwIkdbwxOUcPBeHZdtBfW9gjxPcmkIONkB
         OBq/w/jMMmqcmXOkd5WAs8V9Fhl4pS25Szg0qplbiF0YWG31hZ1LD39baA8MZb0cghCU
         RK0EjRlaQeqNejGJc/Y2Ew+dLA7zQaE18b9vHaNMKB5Vx7o/RwaUNKpCVXNxAiCI75yl
         AUagBL+q1kU7YLGixWu1Y590IFCBcFq25k7fhma4NJH+XV/Nyx6hW5Xo1Kp34CeOmsm6
         N8gQ==
X-Gm-Message-State: APuU4Z/j8ARlJev2vUBWhaUXNFPVSxQk3ePSxAY6C387IzM8OMEJC9qQ
	3UjlIrxydDzV3AHmcNGEsFtc4PCSkFMoKsrnooPRLnXl/5CcC8sLRKqLzBFnslZj
X-Gm-Gg: AZFdTZfBrolB6vmnHWS9oggF89NDt9BmhsIETM4zO0hvWL+ZgDRQ0MQmJG5UdW3qKUn
	zV5PsBT3DEyIdUa7YpFn1Q0PCPPNb4YTJQftjlDU7FOcpNyxHFcjn7tN87fu6bs9AqS7pDF3Uq0
	MDlavXv2CX3uV+5zv+ErJ7RLCQUwjGaFs0jyRqBPOcMtQ2pAnfpu2GbJ1uumsY+n9Xh/Bda5zwf
	nRn3j5zwDJlqSzeD6IWIa9eFAdalSla3y2VTiePq14DDea+q6q7UcjO5i6wcWx25L8bXph1Baof
	Ke42hzH6rLkTYt9CpyNk5ZXGO98r3SkBbBmGuzUPTdbrn+GpuGOjX8gHrdZT9+wTxZLZpPjeCBE
	tYiOP+lgMCccTY4nGp/+1tSQKYyQk7FFfecFa8BFOz9IxC7buhRACoNWWR3aomCusrKtbglqJlG
	tYRIOwvs7jCZeJTfJKocIco1xKPvZynPx3BwkfJHXPkTuW8kqQ0lo4Z0QnsZAEvIaBCxu7QrXDo
	LwPgxcz1OAezFZf0v71lnmjo7L5+LuOh+JFvcsEGqOAJmNPILQ2aPTYhRAUNwJjDfpywXkuhGch
	ecYs7Bc0X5MfPoxz6YqexpNObUyNgNozYKtHmpYCZQe7LLkNqkjnf/rCg1LNvUsmkrhi+anP2OH
	hJku3oiAbdiloxVmLR+/05FipzN+BL7Gsfown7AeoE/Le9yo2j8LKtU8M3Xr+coWqGhJ3Ke0SC4
	K7mYIWNP/fcnFEOs34ew==
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr837316eec.23.1795123194877;
        Thu, 19 Nov 2026 13:19:54 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm1335511eec.23.2026.11.19.13.19.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Nov 2026 13:19:54 -0800 (PST)
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
Subject: [PATCH net v2 3/4] ptp: ocp: report disabled SMA inputs consistently over DPLL
Date: Thu, 19 Nov 2026 13:19:53 -0800
Message-ID: <20261119-timecard-common-v2-078fe69f33-3-ahmadexp@gmail.com>
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
index f1f97c1fa0..06d05fac6e 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -5923,6 +5923,8 @@ static int ptp_ocp_dpll_frequency_get(const struct dpll_pin *pin,
 
 	val = bp->sma_op->get(bp, sma_nr + 1);
 	val &= SMA_SELECT_MASK;
+	if (sma->mode == SMA_MODE_IN && sma->disabled)
+		val = SMA_DISABLE;
 	tbl = bp->sma_op->tbl[sma->mode];
 	for (i = 0; tbl[i].name; i++)
 		if (val == tbl[i].value) {
