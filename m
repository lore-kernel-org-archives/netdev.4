Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560760;
	b=xKYtkMSns/RzHch90MCahclCU/7q7WDGt09rtDcPpN7+5KBevH1Wq3Bowjyd7Qekpuq3
	 js6WoQOEkUT7ImmcTPjElzhzKoNtXPP2QcLGxdnzhtxmJywm+eDIgqLCL2Xel68ZMB5e/
	 F1FouSvCSKxcRExCQock7kpz4DBBtVE5+TPXNd9Gkkj+yMBSsGkc348eKHRQZnkDCitqo
	 a1S4MYSRtAZaKta2LauLF/TAmwfhcEf3a4EgOzd1yNL9K+FIqQJXVnPPYSR+Lsd90lLcP
	 Uu4O9NeF+ELY42iWHzP9vPFa/PldQ1pasrO5Dblm8EwuzmdctLE0FY7rLlaPPRXsMRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=89mPRmCko1ekzMHmpi1pXq3FOev7QxDobkAZxUTwVzI=;
	b=nkgnvmUebls6szT5YCZ2aw8HpR8uNIIOyiH0J4d7RK8YSbUXc6nVA5DGKCy3aVYfBjkZ
	 5HygsNj81wAHx3zCigM1OdBKi5uoYxDVnz5pDKT2c1p8YlvrWYdfrkifW6Ry6MV2kfLid
	 4SIdQq9F9Nfsqkg0rQA7AOcjMVOg9gDrxSsZgcv1eQdUF9QAK+an8ApXhmii48aoQu1ce
	 tPnBp4d/LPIP58nmufbKAN0OGcGJjJ2H75IibYa6/CF44JJzQLad/kaeIraIEEN8DpEgv
	 EGOjn4w5xIaRQXeIsZkE4jHIrLwpsgpsUhz+WsDPtxlhh0oWTsCZZ6Jm4WqUEiuWobw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lReO5e5Z;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6E4606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF6E4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lReO5e5Z
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-386b8f2f671so2300238eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560759; x=1796165559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89mPRmCko1ekzMHmpi1pXq3FOev7QxDobkAZxUTwVzI=;
        b=lReO5e5ZeTowpPe2JvJu2+JwTTbCo7GxFfy7PyzPmXv8DFAgtKA/vhax70ySI6jruY
         eIU6SKG8Bs+DwVFvid9RQyqjZeoMasP7sdX6cCNTqt4y2iqo0ZU4h+FskylzgYGOjYEC
         CwLC3rn8CBXlxBxyLXa26rWaVzoS0s5jNB/4MFo0/Z2oKqJ6XZ0EjHRaFl1FTAjE+QmA
         JS2PRc9ilsCNCh6WRfU8DjjbaL3TelcZhsoyKS7xK7Q7h5FW4X5VSIebqjvnXt1PsHrc
         YCUcSJEG9G1zK1Oao8n4gHorrnIchj85NQPvXRxW1FCcLAtSQv4TwsX9Xbm5BONRfQf+
         91Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560759; x=1796165559;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89mPRmCko1ekzMHmpi1pXq3FOev7QxDobkAZxUTwVzI=;
        b=ULeSWOQ/hDIkzeUyojT3OVh4oNi38zDr2sh2pf3KeIM1t6YfNBiXrP6WmKhNmmaByX
         loIPOkvHVS0FNuN0pAzN/KRbE/ITKSIMGPyIzeBMu1UCu8y34pxtDUU7wx4VK4HNMTVH
         YvIdjTiju06ZjDV2LPOo0DWBiQHPqQ2jxB65DWDB1TPRGR8q6DJOt71sSF4ciHiQiAAC
         Aj2gDVviIpuMbixaIEcrlPKftcLnLRJUk/f+ZG6/MAeCaardyJk28w1jCPUeTdCOf8OE
         bq/gj02u7nbIH5AQ3TX9qqLwkGjmpew3LcWoA4spagVoDGbjViqsjei36DNzAfHdeOqp
         GBBg==
X-Forwarded-Encrypted: i=1; AL+hErEOtGUs6c8J0nlQ1y5yg4yNhdkiW7o6soOVaHEVpilkgz+QP1x97tXWgQSMQu5F/1M6uzu7J7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mfhhne7uRIIky4knO3Di+CFNJD1zw/IMnx6+tqTQ7kwfVcxDi
	z6FOtvbOP964k/GuGgEc4k8oa7ambybCsWp2wfpOdgxKIed2FgVAasgS
X-Gm-Gg: AZFdTZdhqmcgLg5zw/j/2oCYx5HvDKc7nNUt5+JHfsv/6M4DO3D0AU0EGj4FK7lTkAQ
	6yvMT1EFzfQ1MY+1gH/yu3UztS7pSJPDnXsd1qG7Zb9wIsde6NZ8fqyv3imj/9a0IJEQZhQJPb6
	rcmrkiIDZJgmS9EABNAxMR0hfg2tn6U6nX/dKAP67PZZEyLoHHuHCnN+h0YcT5n6ybkOWEj6w6V
	QBCTdQ4VtuxkkgMUb1bNrpnEYQSbStbGND1Rh9CbZ6epy0u121r9pqsevquzK/b34TgKj1syqID
	gR1/VRsmWOrZUwfYMEhclWeBxlZcNMW1zxJeFeMVB0dqwYj4OJca0DJcYxszEC9JGlBbGIKV4A0
	1JmPyBmZ8lkWS64GcTAIiCBEyJhx4o0CByGbmgPfr4Zs835ZL7odGPDKpcXq++9e6Qr8e6pCC14
	jk3/cfNfMHQbFS9kAt4zMMGoZF+IDtIv0TQX5xVagcdtRn7xp8Zc/tDN66Z0yHT7teT6kuCszV+
	lxAWBFg89V4N4jQ0ouS0kTE3YKXeFwDJ3iM2FGdfd1/1ejgnusxvawhup5BAoFw1OLe/1cJfZx9
	f6w6QLzoF6otk50Awx6QzhvWcrzyxtwM0OG4xl/OotNlgs4emNe1FxOpmYOaKkNy9BLJVsGH3cq
	Ou4l/BZnVR4ye7dDdqnql7yS/Xj05A7mdTTadDqhRI7lBm4LtJVcLhpykNwSdcofy3pB2I/MTaQ
	==
X-Received: by 2002:a05:7301:1501:b0:385:1e1c:9ab5 with SMTP id 5a478bee46e88-385701527f3mr15563969eec.20.1795560758846;
        Tue, 24 Nov 2026 14:52:38 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm46605405eec.15.2026.11.24.14.52.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:52:37 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: Re: [PATCH net v3 3/4] ptp: ocp: report disabled SMA inputs consistently over DPLL
Date: Tue, 24 Nov 2026 14:52:36 -0800
Message-ID: <20261124-timecard-common-v5-tests-r3-ahmadexp@gmail.com>
In-Reply-To: <179555822748.3135.10487682659847621386@kernel.org>
References: <20261120-timecard-common-v3-33316bf475-3-ahmadexp@gmail.com> <179555822748.3135.10487682659847621386@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you. Both points are valid for v3 and are addressed in v5.

> Can a disabled input still be reported as 10 MHz after the driver is
> unbound and rebound?

> The new check looks only at the software flag sma->disabled. Disabling
> an input in ptp_ocp_sma_store_val() writes 0 to the whole input field,
> and that also clears SMA_ENABLE:

> Would it work to check the raw SMA_ENABLE bit for !sma->fixed_dir pins
> before masking? Another option is to set sma->disabled from that bit in
> ptp_ocp_sma_fb_init().

V5 patch 5 takes the initialization approach. For direction-configurable
FB-style connectors, including ADVA and ADVA X1, it recovers disabled
state from the mux enable bits. If neither buffer is enabled, it reports
input/None without writing the mux. It leaves legacy fixed-direction
firmware's interpretation unchanged. This fixes the pre-DPLL bind-state
bug separately, with Fixes: b2c4f0ac53f3.

V5 patch 6 then makes DPLL use the disabled state consistently with sysfs
and report 0 Hz, permitting a subsequent 10 MHz request on FB/ADVA to
re-enable the input. Its Fixes tag remains 09eeb3aecc6c.

The ASan/UBSan tests pass 243 modeled FB/ADVA/X1 rebind states with fresh
driver state and retained mux values, all four connectors, zero MMIO
writes and legacy fixed-direction checks. The boundary test also applies
patch 5 alone to the net base and verifies the initialization correction
without any DPLL test calls. Retained mux state is a model assumption;
no physical unbind/rebind or retained-register experiment was performed.

> Could the changelog describe only the testing that applies to this
> change?

Agreed. The v5 messages now describe each change's own test coverage and
limits. Patch 5 describes initialization/rebind tests; patch 6 describes
disabled-input reporting and recovery. Neither borrows the DCF77 or
teardown result. Patch 6 also explains that X1 zero-selector recovery
already works after patch 4, rather than claiming a second X1 -EINVAL fix.

Public test fixtures, reproduction instructions and logs:
https://github.com/Time-Appliances-Project/Time-Card/tree/c889b25e9ea175f64dd811457f8f2c3d29512e45/DRV/Linux/tests/common-v5
See tests/run-boundary-tests.py, results/original/fixed-rebind.log and
results/original/boundary-tests.log. The published model runners and all
20 negative variants passed again before publication.

V5 series:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com
Patch 5, recover disabled SMA inputs when binding:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-5-ahmadexp@gmail.com
Patch 6, report zero frequency for disabled SMA inputs:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-6-ahmadexp@gmail.com

Ahmad
