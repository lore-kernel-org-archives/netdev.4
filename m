Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567230;
	b=IJWrHjAgLCuszG/ScGuD1RRfQOwMXgSz2CmaB04tea4ntSYMEzTcTxTBxQI9omtKcSmj
	 ZzPHiJKbBDKqPgcI1J39bpw2q2D7DOSh6KwDz3eH/ktvyi9gZrDEYpCR8QdhASeNcW/Vi
	 Erzj8/P3d+u8BSpXAF5ex/IQQfvVSsYiDdeXxzeV5hKbfT7ENiUAbGZrk7fS1G34P7ydy
	 tO7egRcpxWbZk08nN98x28IvGCEcLmXMuIIz2wGSnGyPFADIiySBkbmEUhMNC7dm1rClM
	 WyxetuN9Pz+lhaVSiYVJGcPkv8hTY5+Z3rDkThSCSUDdn70zkTlPrJ/jWguqzqQ99nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
	b=ySelkN3V4PLqsr7G+++BCwvrI/UbhD2uLxNpsZaQg6KsUPFqbpMed8AuD9MLSHIdUmNB
	 LItQ0SZfb839d0N44eTfu7VM+23MnMI4rBHkNc0YuI0is8CQKTrMUvdbfHn3K5agwBnA9
	 o5Aet67tuSKNCIyolGFYLBD7ArDYpIFVzsHyA31jK6JReWO5gIaemcnv5oR/ndFNUoBE5
	 J+Zscnamw0qOg3DgMRYc0d1QWimLi+WHZ1ICsM+nhNBIqhKl+fKeJZow0eRP+6vq5ROLK
	 4gyGYZJDqclUi1nGt+5Vg7ET99M0cBU242VZSEK+TzaBQCWPzgzELI/00Jm8rjWOxCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KIQW3ubu;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3085606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3085606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KIQW3ubu
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b3b45597c7so6683483c88.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567229; x=1796172029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
        b=KIQW3ubux0cWLy0xvP/Y4srhJHZWcbz+MwQw6VUTsEMVVSAeTMb2ZPtfVyzbmMfq9T
         NAitwxwZR9BfWzeoPxGnVIJa4mqGxBCNmd23CC0f3A+jt2IK56Xbu8cIUXGQw8pBZBlK
         9WsHl3nLrozrL1+1aLdh6XgatMbuJE/Qn9etarX5ascsnyrxbhUrhuIGUsMZW761X1nK
         Yk/cnHLB/wvdTxhM6oClTviDDOkQtLjY73o/LdvxRabJLVtIo5s0cnvWcJ3hQlknKpkm
         IPz2MV2wB+7hUbHCTHxZ2ewA/luot3o7dhJhqCb61Z6OMGlS0XI3xzdqkwVkgrVnsjB9
         NYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567229; x=1796172029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7HiI3FMI9H20gA5Y//dyix9Owae4M1FMarVKc4YzQb0=;
        b=klU4a1WCJ40XkvfaAhLd/P8hdo3BLN0HBSL6CYYPzLnLxC0QxPKyxqRPq5Yw0OxgNI
         oR4eVhfiT0sJTZ5ly2jqbrmF0h+7ifGQOcqf5ZPJYGwZg/z2NzBu6Bw32yjKAXjh64sF
         ZV6S9N4MsFrhHup7Es5i3nZjQwov0jjaOePqwrV5iDEGTenhAA/+2B5bHtD3h8dm6Eea
         Wv6leAmzgjYhrep0VTWvmQBSOjHj2a3PIJcrdrJTbMNcQBzmS9ohiLIKyvDCAOEauTCJ
         W7SG5qfIyrlBbT7IGAjsn40wZ6060CpVKZPaEUo5Zpp40p4IH9UH/1owJXX6aXGHquzT
         kg2A==
X-Forwarded-Encrypted: i=1; AL+hErFLUtcodIM4LCXiL1aiHugDCmmpmudpaET2yt4h3Xdjz40jE2gwYzz9ebClU1DRjCRKuYJQR5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+IhYJ3FgRfK/lVgqFcURbLJ8o7jFi6/Ud27WokICSHrYkFkbV
	dsAekj0Bgxu0OACVIUE60OgsklQKqZh6RAKOPjnz7O0alpm7ogWiOGZ0YnLhhvcnzhEHi0gM1RP
	GGNlZtB+2Sg==
X-Received: from dleb8-n1.prod.google.com ([2002:a05:701b:4248:10b0:1a4:c892:b166])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:7f01:b0:1b2:6a01:f55e
 with SMTP id a92af1059eb24-1b56f39c712mr7629241c88.34.1795567228466; Tue, 24
 Nov 2026 16:40:28 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:27 -0800
In-Reply-To: <179545903032.3135.12672409534586940438@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119170623.1519909-1-irogers@google.com> <179545903032.3135.12672409534586940438@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004027.1004762-1-irogers@google.com>
Subject: Re: [PATCH net] niu: write back TXC_INT_MASK in niu_txc_set_imask()
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2026 at 10:37 AM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> With this write in place, niu_init_hw() now unmasks all six TXC sources
> for the port:
>
> niu_init_hw()
>     niu_txc_set_imask(np, 0);
>
> Those sources are SF_CE, SF_UE, RO_CE, RO_UE, REORDER_ERR and PKTASM_DEAD.
> niu.h defines TXC_INT_STAT and its per-port bits, but nothing in niu.c
> reads, decodes or acknowledges that register.

Good catch. Because niu.c has no TXC_INT_STAT handler (unlike ZCP, which
masks all sources via ZCP_INT_MASK_ALL), unmasking TXC_INT_MASK = 0
would route even hardware-corrected ECC events (SF_CE / RO_CE) into
niu_device_error() -> -ENODEV and disable all interrupts on port 0.

Since I don't have Sun Neptune hardware to test TXC interrupt handling,
please drop this patch.

Thanks,
Ian

pw-bot: cr
