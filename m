Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795773589;
	b=HFYGwKrKffd8iAGbai2CDwW0eexi0s034remcKN29SjZyfWdQQ3+ysKw6t7H0FyFLcPJ
	 zgRgEsDx85Nq6hINm3RM4GBtcJzGlwBMiyOPwKwYRDaSiuCFHrNjKqrCGwHJewsI88QpW
	 TPRxrnTlJJdJwSFR1/4WeHiPkiK1lPmfr0Tn59Nntz7VxMTWdZOWEoY3CulYQjvYzz8m9
	 ZmMfyit+4/Ans9CUdm/9pMF0UjuqzyU8hsfKme/L06MkyVxabt+/rxtX9NTI0+99xLKLA
	 HoTSay0DCKQhvmlfGkEExxF4VjigavG0SwXFKHUFIt0dPESdFVPgdKm/1/6QYnHMDYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795773589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
	b=nb88DVg6vSicsq/zj7HbQOt/ykENL5ThRedAPjGzi+N8Zn3keN37iC7PUeL1KfniGRdZ
	 Nwn20QmIPJZoZ1q/IrQSOuoPqmdN/Oe0XJqLUNKwAO7VbkbwhKU/1zvRm4UGyZSxKEUjp
	 rX3QZiDJd0Tjxg8Nn/hEoEaWLBKxLluo+iDWPctWtXy/wTky7GWPuF+T9V49eY65ff8tS
	 Qm7IT3x1RwrV2Q+Olfk8QLN8kjE+2ACY2L1qrmIjmnmLKZmLTYJem0AeCDnFo6WS35Heg
	 Rz3oIzKX1ugE05J/cCf6H7tyoxeRyXmiHXCv1O8jCoeBOFW8TXoHfdD3wlvYWrIJ34g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0QhIu3W;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A6606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:59:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B8A6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R0QhIu3W
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so9204651a12.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795773588; x=1796378388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
        b=R0QhIu3WgCK80EmN+8wbvDiPq89uiXgOMhnArI5XW0kgdPoxIIMMQPEv9EOAfsRKt0
         AoNSPTQvWVUMM4mR3xNEeahH9jWALBDordO6pIF33Ik/2Mo5C3IPhwcnqsq+axKxtIIJ
         WK8ZLgpXSB7hGEon68r3i6Ns60Uc+NUjZSd8GmMswWuYVjyBc+cKOWdffY4mXGalac8Y
         ewm7Yj+5U15Jl8xAW+cWs3wGF0L3cmcsQCvOa5+hEw5cc0U1FoSdxdROgJLSu6baBfMV
         y5LmOijPxYDiKIYeIXATWP0XJvuNPyByrJcvMP5u/0OZfiCaxHuvlIsD91v7PuE6uPaH
         6heQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795773588; x=1796378388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HXRFd2cOQNGMDoVqNtgavt7+ro/SHVcuYq+oVmWUa/o=;
        b=dsHSoM32NEFI+kE1L4QGf2Fkdhmx3Zx76MwiZ2vgBmNpr4S5bvKgJvAlMxYG4lYeY9
         EFylM3hDNb9DrjtidYkvPCd9lrKO0KPewBsaPCv+71KYc++O1zkKhGm4yY70htiW//36
         tIbg/0Getmo7xf071D5rpGqOOL8mOHk9XF5nX0/WHkDdumiz+G4xXKmpshoESRpmN8Ep
         pB0ljJz+z7Xc9x87L8f/C6uV1HTk+nWMuj10BzWC9fGZc8fsqcq6TbDqxQRDULi9v0NC
         kNQfhAh/5EhJ2XuHXXjfSb+yqPhRPO0xZq/Eex55DDtVwvxIfhtQLAsT6jeO02N5xYkc
         Jq0w==
X-Forwarded-Encrypted: i=1; AL+hErGGBwBm1E27HaHvxTernuj9nnPJ5XaKO5ZRujX5MCW5Kv8FxNdMvZ1aWZr2hHr2QOW4MVKBsZQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WJXBC7Jazpf0PMKQoYermi9YlH0Uml41b3qQza+3hyLddHNFR
	wmrjrUniePFqtRD8vO4kpVG4P7cmjlCwob8sC9fIdt7/dSBIrvO1KQua
X-Gm-Gg: AZFdTZdtzgjkAawJgFmNLuK42Zv1ClMd32zPwI5O+1uB8aNoPqFFgscja6D8I+abYfu
	KWDwi1ut0ygZuAtBq7XwRKCn6lMV45TwXqtw7btpu/0FT2eSLgm58Ck2kP1kf7+1A0FsbhVjFPs
	pBclwMpD3eePtsX18FYLw4XlgpPLkqrTEPPCMllEPNB4bSAIkdbOh3h8t+/oJ+Mv4Q07WXqGxBt
	yKrf1yNj6t2m8iSqY7Wg1m0uhbo0Ahu/5JhzXO0SY2WBLo0+ybdubkDWL6Kx9dTOKU7P/Um/R7y
	BjN0ECHiDE/HqupIDfmJPd+U7N3amFC2aKEhg6pGV71mUDI0s4dvJTnl9QF6J/V1CeVzBtiHMsJ
	ZAZQsyMelO8OldbPXjow0rajVx0mAYS188Kix60OBXVhm02BpRUt48EZLoR4DknNYjwmMSESDJU
	0dQofzQ1xF52D7qV3i93cTVv2bWBjHc6SNi7dN01lMcQA2aRJEVrjV3ELc7NNCtVYK81lVsimB1
	Rx0MYtK6RSarjA8x4DmxAG6thZnUJgrswp7vRffSNtjQxwRDDK/B0YZiMI2z2igv19m+6gCxZsU
	tmsEOOuD96YlxJ4FYdyka9QCTY8+p5T3TpGbiH8bHN3XE7vc8hT5JJQ43iymqYly/Bkc2A==
X-Received: by 2002:a17:907:968a:b0:c42:bc58:f21 with SMTP id a640c23a62f3a-c51d5adb93emr163106666b.15.1795773587905;
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8ce16sm841249266b.37.2026.11.27.01.59.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 01:59:47 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] wireguard: selftests: remove a peer under load
Date: Fri, 27 Nov 2026 11:59:44 +0200
Message-ID: <20261127095944.17844-2-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179577288974.3135.10854019193613008297@kernel.org>
References: <20261126094722.73025-3-apasichnik9@gmail.com> <179577288974.3135.10854019193613008297@kernel.org>
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

Sashiko AI review wrote:
> [Severity: Medium]
> Does 1 MiB leave enough headroom for what the new loop can log?

In the runs I made it stayed well below that: about 217 lines per
removal on average over 200 removals, and 340-400 KB for the busiest ten
in a row. But the worst case is what you computed, so v3 raises
CONFIG_LOG_BUF_SHIFT to 21.

> Would setting a non-zero message_cost while the loop runs avoid relying
> on such a thin margin?

No: the "Keypair N created/destroyed" lines are rate limited by the same
setting, and the object check at the end needs all of them.

> [Severity: Low]
> Could the commit message give the detection rate with the default
> NR_CPUS? Or it could say that NR_CPUS=1 is needed to reproduce the
> regression reliably.

I only have single unpatched runs there: one with 2 CPUs failed, one
with 4 CPUs passed. v3 says that NR_CPUS=1 is the configuration that
checks for this.

> [Severity: Low]
> Does anything confirm that the peer is actually under load when it is
> removed?

Not in the script. In the runs above every iteration had an accepted
iperf3 connection before the removal (10 of 10 and 200 of 200), on KVM;
I have not run it under TCG. I kept the loop minimal as Jason asked, and
can add a transfer check if that is preferred.

Thanks,
Andrii
