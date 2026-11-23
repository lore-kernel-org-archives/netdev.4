Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406985;
	b=lMLU8IIjhSID0+PaYBsZPZgztWPm8bGzduJgH0eDPIvzl3w+zdeBeI4gJUOm+he8OUHV
	 DysDQL1eEaz55cfpQqBUPJGYCk4wnI1U+0lcTODtuZMdw5uYQ/kCMcpM5NBx8gP6a0K3v
	 pCmj+Ak4P05Ur26TEG/t+67UUO5Cm9eEkgmJIZiumgRqOcMWrK/6bwMRiBE8cakO0ynZj
	 wn1Ct/40f7MAHojn3OSotNP3nr9TN9FYDauf31RkPjwcVptqEF/kMtQZvVcgqlc8egLxg
	 OyldHJVwKWZPNleE+xTVZSy7StFhjjGT49z5k4z1EgNK/LIkLcIfsSQnu2LYSVQQvJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YLKmTz9mXxZ44RenvTwUZJjRcB/29lTMpfzoB+6Aoqs=;
	b=bpJbBgIxHs+n0lWKtVpFgSbQp47Sigp+oYu7FOQ1Br+c5zW3XBmJdh5vDOFmQexRNGCU
	 2QIA4NokVtcEcVVNQTyN7GZF1siEXCuQiQAM46HaLzlsc7q2QRfS7efgVQE297++tsPhx
	 fC1vzBxz2e1I1KdI/pXpnUU+OvCFnRmu5hSkhvKR+twsQCAIzEZJ39JcMJPwiWU2Ezeb1
	 bHzqRe8/xkfV9b4/+H6PQ79jNvIK9NVanVmaCUESYujqS59MtBB6Y9qSknenYSIghbQnh
	 heP+NmGNJd4jixpephLkZ+SwS2weaSQ1Yoj0jDiQBUgkRo/uhwuKDSHzDGSDT76I6oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=FWIRLrFU;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2190606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2190606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=FWIRLrFU
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9E86D3F131
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795406976;
	bh=YLKmTz9mXxZ44RenvTwUZJjRcB/29lTMpfzoB+6Aoqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=FWIRLrFU3W6V26zT9JCOpa890FckjHuHrqktJd33bVkNKYfXLRNpBqqTBGNS0gSnh
	 ZH5ctvkaRwikIhv018gQWyGjMAS3ZDdiUSUKdtgOO3tf10RyKwAoRZokveyqlCFcZd
	 dWp+UWlHTQ/bRhSQq2fN+wt+P3DIBx70WA+BU1Q1vSt/Dpm25Y9cpctCrW4tp8kaTX
	 V01QedYjvtX7zy04UdWkt8EwdChUef/4Dgsa1lJPedjRsHWJiNZ9AmibYmT9zxJ9k8
	 t1lbwBf5khySFXKRT1Ib87oZQs2hOmaM6d8YL/O6VclwoONmV5XSg0gqD/9cRZz90R
	 cMGZefUkOUDr0F1Vza5kfMobDfSRhMYoP8rDH6wmmOtzjsuHy5KzLOItqL/YabsXW2
	 UhOt3/Ymgrf7pHYWf8zhgaBUCKRxQkxdRk2BVDIFY0qZf/NEbLI5eEjbkW+BOhUjo3
	 5rb6yK0mnOrrEYfA6H1T4LF3M/a72sZR9PGCEHoI9XfD7CL4WZPxmjF1fnlm192C51
	 SeYp1cAV52jeEaLlzccqeSpGbAmxEaNoXeJvTUofNraSkj5ToTxAnq3J6kPvtBPazE
	 NCpEzCksXU/7+Wkpl/6ZuqgGTetQoLtfNl3ukhGBUPf3v7e+yn2EBTVYfjNu33Z4OX
	 uMIQgMIvxGddGok+ni0cq0Nc=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0329e57eeso27565615ad.3
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 20:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406975; x=1796011775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YLKmTz9mXxZ44RenvTwUZJjRcB/29lTMpfzoB+6Aoqs=;
        b=w46FktGVmG5pWELyEXzk0dahQSLaf+lPh5NgZUQEXeca5uAk9t56T+OvpivGKCuZs6
         TxnpxM2roe6QKPyuIq2KtOn3EFJogrVMdzsK+TVS1f51aJQTFpHYOabLHEDW11UdHT5m
         b0Uu6sx2tOFJCRjZw4dRJRKhZAYSOEEcoSKDvt4PBUQ+DG/BsB54AsMyig9c2knuMFxf
         PXPTPfLj5vR19W2446/fKwxOVuhUIHaIgrF3xRicOF4p/h1oqkfK/aVkxK7ZEb6MLSjN
         hDJp+YjUH+Zh3q3qaTgEW9YVcC5Q/7tHxu+5yY81ICWX49vLO2IPZ7mTzxOwION6O0nK
         mWZg==
X-Forwarded-Encrypted: i=1; AL+hErGKhk1DmRtalNjZF64V/nyVTtVBuChIIosKtfMoPFvPnmZVLzPOOoOcbRbp5nEF5fQFEvJR/ck=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fOfXICoui3o+moyGUcPhFVvTS9pM4VQYbuYtpmp8AB/eo++tK
	j00Px2YAduBQQJ/fiGI1LwzpxnOU0HH50E00mCf7Ea0Lh9O2McHsIhKcMPcWNHm4+GO6qSQDN/6
	IXPhIwq2K/IoPYmnIPRsQujcYd9yzDjdxlW6J3J7CEipBS0sWGX8asHMf46MncR4oZA+vQIMkhg
	==
X-Gm-Gg: AZFdTZdA6Ixk9IBxOsn6m2QC9HggbL8El7V68A19tw6KUSMvZFSveXhnLWzkPr14XrR
	OJw57nG8xmEt/+MrLzZXoLw1trjwNT4spTK9A3MGH4KQpipBJMlqFFDLO6AltatjeJyu3t7/wL4
	tebZhiIjemmgwOutPyrDB3WhiCXerbMuFZ7VsBeJVSMcZaEeaehCxwrE/ygK64LYRq7nJivzK7k
	1a+opguOWHn9L0WK7SK7MCT/yhMQKfHVFpf7zNA0r8d1qVVFMA2/xBGPvhcyeyeya2N8nA2gHqn
	Ub83PUUiJ9LBRcFkqwUEO7bVHjs2gJzUftgbFjxx7GkwlvuBM+27uGVmaTu+xzb4xNH81KpI+M0
	cPVUgu3K9W9aRX/GC+FXAI56Iqw+l5WbVThkX70xbp7h7aGpLpfO0drqldMsM1BuFuTVih2y/Ts
	ancwbdbYOh/cKRomck7M7vkQuCMcji
X-Received: by 2002:a17:903:2283:b0:2f0:7707:228e with SMTP id d9443c01a7336-2f077072aeamr39456315ad.32.1795406974995;
        Sun, 22 Nov 2026 20:09:34 -0800 (PST)
X-Received: by 2002:a17:903:2283:b0:2f0:7707:228e with SMTP id d9443c01a7336-2f077072aeamr39456135ad.32.1795406974561;
        Sun, 22 Nov 2026 20:09:34 -0800 (PST)
Received: from acelan-Precision-5480 (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c88sm45431965ad.56.2026.11.22.20.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:09:34 -0800 (PST)
Date: Mon, 23 Nov 2026 12:09:27 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Ye Shu <hello@shuye.dev>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dima Ruinskiy <dima.ruinskiy@intel.com>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] e1000e: add Dell Pro 5 Micro P5M1260 to disable K1 list
Message-ID: <awO7PG_bzIjHuq4O@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Ye Shu <hello@shuye.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dima Ruinskiy <dima.ruinskiy@intel.com>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119001818.513503-1-acelan.kao@canonical.com>
 <c4801ff7-7ff6-457e-b0a5-c2e633d35c59@shuye.dev>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4801ff7-7ff6-457e-b0a5-c2e633d35c59@shuye.dev>

On Thu, Nov 19, 2026 at 05:54:50PM -0800, Ye Shu wrote:
> Hi Chia-Lin and others,
>
> On 11/18/26 4:18 PM, Chia-Lin Kao (AceLan) wrote:
> > K1 was re-enabled on MTL and later platforms by
> > commit 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and re-enable K1 on Meteor Lake").
> > Since then, the Dell Pro 5 Micro P5M1260 (Panther Lake, I219
> > [8086:57b3]) no longer enters S0ix during s2idle.
>
> I have independently reproduced a similar S0ix issue on a different
> machine, an HP ZBook 8 G2i 14 (also Panther Lake, with Intel I219 NIC
> [8086:57b3] using the e1000e driver).
Cool, I think you can try submit the patch for your machine.

I also verified on another bunch of machines and found another 25
affected machines.
The impact of enabling K1 is huge, I'm not sure how Intel will handle
this. But for now, there is no harm for sending out the patch.

>
> Machine tested:
> - Model: HP ZBook 8 G2i 14
> - DMI system vendor: HP
> - DMI product name: HP ZBook 8 G2i 14 inch Mobile Workstation PC
> - DMI base board product name: 8ED9
> - NIC: Intel I219-LM [8086:57b3], subsystem Hewlett-Packard Company
>   Device [103c:8ed9], driver e1000e
> - Distribution: Fedora 45
> - Kernel: 7.3.4-300.fc45.x86_64
> - BIOS: Y70 Ver. 01.01.07
>
> With K1 enabled by default (disable-k1: off), S0ix entry is
> intermittent. Some suspend go into S0ix while others do not, even with
> CPU reaching Package C10.
>
> > Every suspend ends with:
> >
> >    intel_pmc_core INT33A1:00: CPU did not enter SLP_S0!!! (S0ix cnt=0)
>
> Failed suspend produces the same message:
>    intel_pmc_core INT33A1:00: CPU did not enter SLP_S0!!!
>
> > The PMC low power mode status dump shows the GbE IP is never power
> > gated (GBE_PGD0_PG_STS, GBE_D3_STS and GBE_VNN_REQ_STS all 0), while
> > the CPU itself reaches C10.
>
> The PMC dump shows the following:
>    CPU_C10_REQ_STS     1
>    GBE_PGD0_PG_STS     0
>    GBE_D3_STS          1
>    GBE_VNN_REQ_STS     0
>
> > Disabling K1 at runtime restores S0ix on the same unit, kernel and
> > BIOS:
> >
> >    # ethtool --set-priv-flags enp0s31f6 disable-k1 on
>
> Disabling K1 using the same command appears to resolve the problem. I
> performed the following A/B/A test within a single boot, using 120
> second rtcwake -m mem cycles and measuring slp_s0_residency_usec before
> and after each cycle:
>
> disable-k1 on:   6/6 successful (~116-119 s in S0ix)
> disable-k1 off:  1/4 successful (118, 0, 0, 0 s in S0ix)
> disable-k1 on:   4/4 successful (~115-119 s in S0ix)
>
> Since this issue also reproduces on a different machine with the same
> PCI device ID for NIC, would you prefer adding another HP-specific DMI
> entry to disable_k1_list, or do you think that disabling K1 for all NICs
> with PCI ID [8086:57b3] would be more appropriate?
>
> I'm happy to submit a separate disable_k1_list patch or test any
> proposed changes.
>
> Thank you!
> Ye
