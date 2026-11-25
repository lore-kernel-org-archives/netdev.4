Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597207;
	b=ChI5eGKTAyD5C5LEAqiKgnDRE0IlIovlT0fjvDWswIsBGD9sYDUqiO+GmqcpnHFXY/BX
	 pDnMnnHCCeOQvd9GRiv3HoTLDlYSNYaIMGh6zaGmxjEUwVi5I/dGkC6s3mY+BhoOZu9tW
	 esG+GDDxhtNfmM8lyAkZ992/lY5+niQ5QsH58ybNfHuq/CD/OAPOdI1go0xGNOcyhqq9C
	 iyUxDQrKrd+n+FUB2ofNeU8z11Yi+QErc37yW087l0eX60HZEHlCk1sbxCdhL6sfTzVhX
	 pc5cvjCW/X3Ejq7m0peSd87gfwLF/3l5qs4E6WUfdXluFESvo+lwDhw98HtfPnbndvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597207;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=wCuJhhLEoHgkC07eMz8DzYO5TWgSi6mxnzjUookJyTY=;
	b=pwq6Bz7RcVu6ILw2H3pGKk7dDW4fsqZDJNTTMJdfmO5BdVJPHbEoLPPSCYyC2zORNzGe
	 FYX1yoRmXjxOI6dbwSOucf/DU41p5qbiD5PZZ4X08UTTXDAOqjyuXnYk4m6Dm1IdMnRCa
	 CncWGJvubzinuQt2bWYR1x5fSaIs8fESna64vY0Q8uXuKZbaTXrjA5l97sjDMuzaxNqFD
	 6aDXtqSpncC3RU233uNFKEyKl8sjc2quUfSD7b0NWwWz3+dvoOcno/xEAXwUZyClZj8WB
	 bg49ZDXna6UP4sOSWNZyvueBa4vtpSEXJyAA9jIi44QrBCgYptQP9BLNlGV2e9koBNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=bhBpgYSE;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DCB606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2DCB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=bhBpgYSE
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c5126505cb3so707862666b.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795597205; x=1796202005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wCuJhhLEoHgkC07eMz8DzYO5TWgSi6mxnzjUookJyTY=;
        b=bhBpgYSEVMMI2tkfZ6abvUy2hz8ISgTfJsny9X7YS4AYnon4DTf4YzuQBYvcdYYCG8
         hNRrq9ym7RDeyg21rIjJJUSVZOkrlO6ECJOMQSXyHvr7pr1nitIQFeYinlX5xJfXsO17
         Oo9XlIpVjXvwFYbmnZGLXvbtCfpBo0HMJa2ATOf7wf97+DO9nCT1BgQ60A/blA1yNcxC
         762F5M2KDC049K1HYJL6iBRlhT+GIKJdELAxPzgQd2UN4PdqV6IMRVXr01mBIvIWeYJQ
         oSPMpJxtg+q5Uv57GyAu6QygUP0GuiSI2iJ3JYSxQXSSX07kEIiHd8iNy4X/KgN97vYz
         3I8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597205; x=1796202005;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wCuJhhLEoHgkC07eMz8DzYO5TWgSi6mxnzjUookJyTY=;
        b=TL7YbYI3nZZ8pAJ7dyWHyvtPhWxMj3Pnqwhr6K+L1SgNbrWz6WBbw340q8BoVMWtqr
         elShra6Q+h+ODJOi7nqjdKBrvBdOG6ASfhiPBJGhDhl+9QnabUDCIZPcPF8MPwcyMNFb
         xA0Ah5LXiWtfNy0bo3BAsF/TtFOERamlIT5XdOSPfOWjYqBKtSOEPWOsNxZXuZ+kwPo7
         /2D008B/Y3PBwICw28Q1LdMSgOSx9ZWlfmorkiqJVM1bvSHUkHLH3ysTrNflp1vKl8DI
         mQZhSDl1xuEHX0I3QEx+PwhCLW+4+HYYjRMxiueU2f93KkLEchmJPvf90770XglBUfJq
         Zb2Q==
X-Gm-Message-State: APuU4Z88be6gTSyeGpfIcxVEAZUAeytBwBRNMXmevhQB6XCJqHnHVVux
	VHqnlUpK4lxYif29fthfgWBg5fD8p4I2C9CLo6lJrU/WOpfjWzo6LTqk5ZDbFhK8NUI=
X-Gm-Gg: AZFdTZebLS3fkiWXDSG1UKo+y7K7WF4YLnCnSvtaIsNboxGiEAL5uDpric42qJ5AZfB
	4DqvydCqm2NqkMb3SdHhcl7uZIGcmT5azUi/b/RBmdNJM5DPm0krGATi7htpC6q4ORmBQW54nuZ
	31q3cZHvunE3bhYmVlfrEGmATSAN5fbg9Ap6O2HWoPckpcWh1K9hyV/UYNs9Z9Qy8fc22bzpa97
	c1x6W4DkXRxSuBu3NBNjJtrhPnA/Y1NjFauYrqbQs5UCfPxJD3eMhSdcP2TsTtS6PpEAgNAqZHE
	e+QpaWWseCP5oHThMaPBocmfsUEvas1viBSW7RF2I9z3/jKH5sh3yI6be6yRcVCGCl0RjZDj1Aw
	2pyOFW/lh+1bRiUZa4Vx+5nLkk25OdYsRvItREZkw8sF4PqJLYByo7LqzkxOmmPC+Ndq+Hr27gL
	9lyZdyhKeif9tat4mveC4X1HTG79WLN+FG3PD8qyGHyF/a+xrP4R4ZNlkA+N4/WQLSDMl6nanXX
	1LBouexVTbrH/0tlMMCQL01tFNIfn0mUpMROcZcqnTv9HcZo+4xKPRMYEfnAJElta1Tn7ipUuEV
	uJM0rknY7eaBL5n4BZanADO6P5jmyouQl6YIQqfrsjvU/zcFT5hWEviKfJnKlq1isNBkwaglTzb
	q0WA=
X-Received: by 2002:a17:907:ea8e:b0:c49:a235:8e0c with SMTP id a640c23a62f3a-c513aadb22dmr1360811566b.22.1795597204487;
        Wed, 25 Nov 2026 01:00:04 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm591351166b.82.2026.11.25.01.00.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 01:00:04 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	paul.greenwalt@intel.com,
	alice.michael@intel.com,
	eric.joyner@intel.com,
	jbrandeb@kernel.org,
	lorenzo@kernel.org,
	alexander.duyck@gmail.com,
	maciej.fijalkowski@intel.com,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP program is attached
Date: Wed, 25 Nov 2026 09:00:01 +0000
Message-ID: <20261125090001.60782-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179557068810.3135.17964087549504688357@kernel.org>
References: <20261121012402.84848-1-tianyi@cloudflare.com> <179557068810.3135.17964087549504688357@kernel.org>
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
Content-Transfer-Encoding: 8bit

> [Severity: Medium]
[...]
> Would CHECKSUM_NONE be a safer fallback here until the pending XDP
> checksum hint series land? If not, could the commit message describe
> this trade-off?

Yes, the inner checksum is then not checked, as on E810, on mlx5 with
XDP, and on E830 before v6.15. CHECKSUM_NONE would make the stack check
every packet in software, also the ones XDP did not change.

The discussion in [3] concluded that CHECKSUM_UNNECESSARY only is the
safe option with XDP for now, and that the decap case is a known
problem. v2 will note this in the commit message.

> [Severity: Low]
> Should this use the per-poll snapshot instead of reading ring->xdp_prog
> a second time? The program that actually ran comes from:
[...]

v2 will drop the per-packet read and set ICE_RX_FLAGS_RING_GCS in
ice_vsi_cfg_rxq() instead, as Alexander suggested [4].

[3] https://lore.kernel.org/all/20260721183256.6f49d6e1@kernel.org/
[4] https://lore.kernel.org/all/CAKgT0UeNyyXKARjKR4nVVxNe3UB16WuXqxSz0cf4ZvCdb9A4_Q@mail.gmail.com/

Thanks,
Tianyi

pw-bot: cr
