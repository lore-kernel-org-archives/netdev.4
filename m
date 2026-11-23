Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467047;
	b=XFqYPeb/1wI6j2uA5n8qP4FLefc6YxhN6wyRBxW8UgC+UZnG5waRal1zn1cCbtCQU/5N
	 DhYHlxnZGK2zUh7MCDiRv5S+AHVhOTsh2IaiCY0tFXQWH0o5y0GANlC5Dz83OGvxkKvDW
	 bWIuouK5DUsYmPLwCI40yw9c9bN01fB9D/wzIZsdNQfeJmk5P0JSXqS/zRlI1XjW4k7cU
	 r15D04kbzNabp/ctOrFeX2zvIV0Wos0u44J5Ko++g1VGewTiSfCp/9orkO2mBokK+NZ4L
	 NI54upJ3v8hL5LZ5HWAnnOlQp8t2/JG1ZopsbJbb0GwkghUCTaOh2rulh1bxRFi3bMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=rtg1QwlxUlqKdWFFkOLdbOG6qOLObjBGzDminPCVQ78=;
	b=ahb+Re2mNmsj7L1uEQ+pSknocd0dC9jGLsX29QWvhrzSMbgbsWz1+Z/nYPRx3x4R7lpg
	 BBH4RwNFRRNx2ttkzly2/ImRLVb6OPkHULJdbRKrJBGJ6MFxKdk9golD+DfnN2xKheAtf
	 4+L7mpvjKRUuAdZMVqYEoSwVxWDL3qJiRGrcs5+uEs/IptWCKa7Tcw8US2adQUza2nhh6
	 KuYBocLJdnxo9J/4tgfXJE8yI6Itw6m9WL6f9FAQuqgBdtvV3gMzIpSdLva0zDQZXIa2u
	 syn4Il1JecxVmRahwJavjVNPof1lMoxgUJ0gPZoaZjb/tjeVg5p/EVQgFkgaT0+hGzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=XbFKUc+B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13DE606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B13DE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=XbFKUc+B
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-49429181ce9so2212166fac.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:50:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795467045; cv=none;
        d=google.com; s=arc-20260327;
        b=XRMh6mC0aldA3kz/H5cj4IQqfMCsriUJetAWEJwzK/x5U17OLXh6Onm5NiajW/uODy
         RpMgkKRvWqtArHu8JF3BqxvyNeBsbNxWUb73Wmr4D1nVqqFFUar8q0gObXp1Om9+W6la
         nHdHO2SVV9ZZZJR1bIVWsFtemVvdyzefdVgUg5qzFP8JCJA7Pvn7nUyvQqwcImKdToh8
         hidLITKi8e0X7HxwDDE+WG9gNRwBg4pxXmfxssFUXGmFlJIzL1ZRc6gfR5lhWeoejxYY
         Ak0mP9cwjPf4ho2ST957GCXCE3BlWp9tmoUhwlr8JUFEWEi6g0H/RIGnbeaw1tC3I/Ac
         Vm4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rtg1QwlxUlqKdWFFkOLdbOG6qOLObjBGzDminPCVQ78=;
        fh=2K2Fg+Ptf1Hvx01fEusU8YFx/AtI2CNPjQQks4KgS7s=;
        b=lamL/Zpw8fwll7hyZVIAPVY9DFzVOYnawaJIQ/2YPAAYX/ClYlCksLmu62FvYQzrEI
         AfBagrQGaF4s60KDgM/NhCSER5Ygu1mJdL1JjKO2WvC1n6rmLA7vz+rpjlwxuSd++/Je
         tY8UxgeZ3YAK07TQuXEA6Ti72d6m76OcsqW1qAvgWIR/+SXp7Py9tPryeELxB752NNQm
         XKcOdS+XCqcrU+jlfuTgRBQPv2BgAtce0UIitaj/3x5c4caCk8MyJk9K0SJ+AuXimzg3
         eprJTiqaun6KIVJHFnXoezr97N1apxcZiIJ2d5bB7RdANaKDElTr4T6XC+m3fbnkEK6z
         UZTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795467045; x=1796071845; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtg1QwlxUlqKdWFFkOLdbOG6qOLObjBGzDminPCVQ78=;
        b=XbFKUc+BTIDQ6jnQ0wCIjukRGGRFMm3/5IO4CD4uNpdpTm7+O/bBttTVEdAhjeSz1B
         R40cCAEaHRiqLrrL0Zv354fdTKDUfO4WApALwN2wEiPfMUSbi5ORrgZvLIDy0RNmzFd9
         TsYUuMv0QXF/2WJ3f5LHZpiinh2DkOAutblZJ5FD+o2B/hmcpwZIUt8uuH6yRoWyD56e
         kutdhTQEZstNtZY/RdZfL1MnV14yoRKj1viBQbq+YryTvkNb3p0a9xct3N10qjnxyFoi
         6nX2lhtBMwMSD9LZgtqR7VrTxjW46magGz7fNZnXrcCUpkvGPlIAgSX/msKLCkM5tBPY
         uFGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467045; x=1796071845;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rtg1QwlxUlqKdWFFkOLdbOG6qOLObjBGzDminPCVQ78=;
        b=rJfNupUaKeFsBmIfQZNJT9GMfM3u0WZVSzk2JbYW/3MIFpBsOrIwPJEsZLuQ0/S/lC
         9ymP1EvZWH+89gbLULbj+X0OJX4YQhHnnkJ9IpnHQ0lSdz1W+/QPiHYTf4zwJoCxbBtS
         um1X029InpHcwnbVZmLCMaluMeHi6TYllktihqqCnDyyROZoLLbXVskz7Xxgb4nWN/9P
         V2jPUkj73dUBUahrzvBbHbw4hC8yO+O7SGGM+SOCrnXAc6NKZvNkamuOmH7kb8MVkqJ5
         CNfS5Y/KjGNfiAqOrTReqqbeniBiu6BZkLc6pcFbMs2m42zzzpXvqqGnzy3nQKP3kYxU
         NNkw==
X-Gm-Message-State: APuU4Z91iaL0HlmSl4G3jhgFFblIjg5/aKCFFIZM2nVlk9gIUhWl+KEg
	16qQKne5d4W4nk1QXo5gAkuuq/+Xio3QTdDCN02wx+ImS//TMeXInjmgaGorg821dNf5Ttj+h5N
	oHNiAhDeCR/FIKjzFyLl5EsWGKs5rRaPS3eDQFJLSHA==
X-Gm-Gg: AZFdTZcOqrnGTGPkAQSfbKBW2Reh1Ru3EtXmfgRKSi11EKDlXH8VFSYdCWo2QStnTYI
	+1rCG19GMG1NxstMQftrg6+sY3u/mYI69iRmjisBnyMiQRTqRtGgDonrzrHYn3GiaNeTYl8//xy
	zOfN5hXlYlygPMtM6/xiXOrGLqxkhjmDLRUPo/gS2eqGkVC9GAlAFPM6OxppR9D1S34U+BwO8Yx
	5G47P4qDD8kYKYVqZ3dWQl0rTeyxO6oKV8aWjOfSafJcRtr5wa4c1zJMFHxMnaUVjpl8hxbjMcr
	zm9KDCOfngS1tBdE6bRwPsv4U7XgI2aNAKhsEDUDgm7ZDWaGmMk36t2e7o2c92Av+3LZ+/wKGPP
	F+mk6MNYJBQUZVqeXSv1A2eG7myJJOPRU/gT3Jh7kG0zQKTJB2f0GpBLnEQ3zKiGBh2Ulktv6V3
	bA3Fk7RXbO7A==
X-Received: by 2002:a05:6871:5214:b0:494:9899:dc19 with SMTP id
 586e51a60fabf-4bc858fe4e1mr11416644fac.57.1795467045382; Mon, 23 Nov 2026
 12:50:45 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121012402.84848-1-tianyi@cloudflare.com> <awSF9MseWZF7GXoT@boxer>
In-Reply-To: <awSF9MseWZF7GXoT@boxer>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 23 Nov 2026 20:50:33 +0000
X-Gm-Features: Aa3M54qknv-LC3GqPC4I5eLThmOD4Cwkbfje5p8LrDaQRMJr2NeCERG3yi0ic8o
Message-ID: <CAG4wq-fmKUPCpvu_m8Zw-9X23QW3k2F3ucjSQdDvWQTpjKNYaA@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	tianyi.gao@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 07:29:08PM +0100, Maciej Fijalkowski wrote:
> Anyone else besides mlx5 behaving this way?

Thanks for the ack, Maciej.

From roughly analyzing the code, no. At least fbnic, gve, idpf, enetc,
ionic, mlx4 and nfp report CHECKSUM_COMPLETE with an XDP program
attached too, and I am not sure this list is exhaustive. So I am
wondering whether we should enforce it for all drivers, with the
drv-net selftest I mentioned.

The existing tests in xdp.py (test_xdp_native_adjst_head_* and
test_xdp_native_adjst_tail_*) already change the frame and return
XDP_PASS, but they only check the payload. A stale CHECKSUM_COMPLETE is
only reported silently as "hw csum failure" in dmesg, so they still
pass. Could you check the dmesg of the ice-E830-XXV2 NIPA runner?
