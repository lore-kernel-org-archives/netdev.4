Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567228;
	b=QxbR01CQBe8JXVBVw6EsvUntlvIzUPnjJKAzBwCMrVH6JFFLf5M4rXtKn6v/G6cDdGnP
	 pQxkZ12xRVkOOIjdmoMBuH6C9h6R2OFDDNGMsiNw2iDEVOgrcpA7wyoxp9lpIkRPoz0q0
	 izn76pmnLHfDobofIuaLzA8WDBZ0ng2kDzRfnNCk8/UmfQOeUVw3sNZxkceOhZIp026Dw
	 zd805NIZQ593JUhTlOyyGsKUG/n+G38/KCb03n1gYn9R/g024V5sT/7CvdxEeS50m3CvA
	 ei4ufixygQcNLEiqz1PSKYODbtKQs6F5pUEtQOpF1r8KqZn38mizzrwEgzJFsvacoXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
	b=4LcwDpzG6cQaFTUmiqxEjgJerwX6U3BjitaRgYsSdDtXhFppCGCFWmP12pJEYGfXNJhg
	 YZXBKeFaFyWSayrpqLgjGd/gkflteOG9piMSSb1bDL3GEZxZSGFvb/9lXtSl5KAQ57yjv
	 UGbwNjtduuYhqrvdV2jxbiFAMlxMVvaJgq5eiz/eUaksWLltaOYoDT4r7JKYKvjnRM29v
	 Y9/PTQg+yld1bZbry2xpjrllq3DSTBkRxPPbWLHo0zbEi26nCHJVP4ocWi8UTSl39ilJ9
	 Jl8KEkjMnLyXm10zNwhABM9UvBcyaDprYl+0A7XrrdQBPmdMDRrETq8vyLWN2ED2bwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RQ5CyAKf;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5668606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5668606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RQ5CyAKf
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so8079822eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567227; x=1796172027; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
        b=RQ5CyAKfDMT+/e5WYkcBJZkeLT7prrUrS3xAUlpgpJWUwnHWUftaY9qTVZmrsTDaqM
         Q4TJqx5vynev/dmvXCW+wY9tFV8vG3bXzP3isMR/H0KCOGhKImZ6UTcpS3Xw8t+FMq/h
         w9Hy1YHKXSScgYJPEjc6Vht75zspAmhqqb7/p+fq4lWtOjYwg3TotI6vIo0Hlh6yAx2U
         8v6uhRQtE7RB9XoIZ/m6WJWgi2RcGrPire/gKJu5IXFTqK0pf1plsJuRiAWfxhVU7PjJ
         iTYgI8QrKB3lejbLH9+Ic4iwIQn4KKunFfVR31Ps8Q0lo7ZtGycA2mLI/izuZ1N53yZf
         8JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567227; x=1796172027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
        b=afiy8C/jGycEpGOARQokl4tml8DUlytAwcS3E1W91y8gfqOiZJisyzuXYOgNxQcdfU
         za6kLT4L8tRnl+dJcjeE+uktlKyx5PA/2AXCZS5rh+1gWy4FPdxGPTd9kiJJdnwJbfSu
         pZ4gXYJ7O0X6QD2Mg5uDienojpXweO46hvDybfuCzyh8FSskmlGB1J98dcIxdkXjnYVs
         EE2Dxy1Scl4XjVczTAhCNo7rt/o67KFXsILowT7c43hFnvfDyAL/NjeTsU2Ey61z52C0
         EPL830i+9ZwGTEXVe2bfinzCJDFcdM66GoMCH5fcIbnD4gg3TUmNO8/l/i8j8YOhVS1d
         AnYg==
X-Forwarded-Encrypted: i=1; AL+hErG5ubqzSKnTfTSJH9pt9rZ3T85hpXXcIZbOmr3/l7Pd3hBvu8DtmYrRrdKw61Gc8lCAVgR9SFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/UTD2QFnDN1RePcPqtPyCoTF/Qk6Ut37V/9GhyWRn3aJ3oC7Zg
	zkAud/MbWs29k5cR4TOjqmxX0samqqAIHHhPl7/aofKGnNlbAifgPhUmbCfp2YglIqMGlaQ/v/E
	IYPqwCPQq1w==
X-Received: from dyhd10.prod.google.com ([2002:a05:7300:828a:b0:386:95bc:ec27])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:2419:b0:367:185e:867a
 with SMTP id 5a478bee46e88-38571027a5dmr18199472eec.38.1795567226076; Tue, 24
 Nov 2026 16:40:26 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:24 -0800
In-Reply-To: <179540977827.3135.7089774240645592681@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261122045326.19641-1-irogers@google.com> <179540977827.3135.7089774240645592681@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004024.1004485-1-irogers@google.com>
Subject: Re: [PATCH net-next v2] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 8:56 PM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> Is this description accurate? In tg3_get_invariants(), an error from
> tg3_phy_probe() is logged and probe keeps going:
[...]
> [Severity: High]
> Can this early return leave the BCM5703/5704/5705 PHY in its DSP test
> configuration?

Both points are valid - returning early skips unblocking DSP 0x8005 and
clearing MII_TG3_EXT_CTRL 0x3000 when test-pattern retries are exhausted
(while callers such as tg3_reset_hw() ignore tg3_phy_reset()'s return
value), and tg3_get_invariants() logs the tg3_phy_probe() failure
without aborting PCI probe.

I'll send a v3 for net-next that keeps the existing post-loop cleanup
intact and simply guards the MII_CTRL1000 restore with a boolean flag so
phy9_orig is only written back if MII_CTRL1000 was actually read.

Thanks,
Ian

pw-bot: cr
