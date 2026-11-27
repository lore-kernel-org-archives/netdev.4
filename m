Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817667;
	b=UuZhtroV9IMgUPuNAYvp1lke+j9cc8zhi7OUq+NeoDRK2mTIfacepV+2NwVL7zXxXirE
	 YgPEW9bHHyeZNUdcyEEOmr5VXwYcvo15iBGUEy/aLCRyyjlb4xYFzKelTqezScowZaftz
	 5kNXyznItBSQUr0SEd2jA9btZYN12IpPKidyYBfAsppJ3JRkrHlMT1o0uyT4Itt8/ADy4
	 g2wWKn8abebEjQloa+fjyaZ7kCAsNXiMOMnN1kcVixjOO/WW4qD+rGPKkHo0hdwBHUckH
	 K+KVmpVmWj+OIMKMgFLX6esolnHiLlv+N3DRxwo6cPt3LGS2XNcYZ1tzeNAsv6O6XNA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
	b=E1E5msSO8rpYKIT2Y8vN4J+KZjlxLHAJ3btYj/Ea2sYIig4pWPNS6zDnQU8+xX9/P7Ng
	 mqZEM4miBAo3bWQDkrRH3nL/v2iNkEbcg9cd6qMtnRdl5qPWLUS0csb1e94CqLqMqcdn/
	 +ilUMh3MfRiMuztuyZyuxutIESoXk/Kznh7TuVo5lfGa3Si3zKwmKC9KvFE30keP4FB3z
	 FOg9yF0WZPtE+I067wlhzYGu0qBE+HlirR2nWxV7Q/gFjCZZbs6j2gtQwO/0PT+TPRvQ7
	 y7COms4UOVZPcFlZiXIDaGfwYloWvz4lBwLdwI57TTKJnDcGDXN5CWIE03KfQFF+iNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67196606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 22:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67196606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b32daac9d7so47211307b3.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 14:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817666; cv=none;
        d=google.com; s=arc-20260327;
        b=TXX6LzdLz966xyF2C3ZvwqaRoEzy7SVnhy0vtVuqlFMSEsD+6u5FAFEHouDlQvHMmm
         nIYuBWqU6nWSFAF/9Iqn344zUfr3F0/Xw3fc85iwXMlv0yp4W9ilYjNGl9LJzXPqg2N5
         H5LD4jhaWTFh2ju/3C2J+Bt7N1n9PZtE9pTddY+CVljvBtQfWYjkcz9DgylVEh7Syohq
         +aGNAk5MImrboosO1GbI/oi4vQgurM/jhhmeIcLDWXrXssmtCyQUvE7L0AqbS9DTuM6h
         mpQxyiZvv5RDdeqqnho71Rdu4y49igrZNatrnEVO7keqUIeYJo9eNQtvKtSRnWD/pgrT
         U+vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        fh=3N97AgZAkrcLca1qpZ5/G3UkbyZnR0Eysky5hHbxDZA=;
        b=Rx8pNy/8GrX112d5PZN4TrrNiGlHG3ejVsCaCsBe0lOgaIH3gFWgVzz5SgN71iDihz
         NdPNC09OlZNAoH2zyqwwG64wXAITeyVxR1+OLCtjyKT25n17+8IxhHGJ8XfTQ6eGekT2
         eV3JsN5xekdlJY1GKxbNmRZK8UIWNyxyMqFpsTgY2gMHfoF0Q/Xu8zqRvFMfnG/KwSwy
         PDxsI/gSi0TlXNvq3jMIwgXDdiGnVTlf1ve+dmTwu3Maft0SAIIndemAHWDr4a1ZN6Pc
         JwEmkEW9VGKpSze8vNjQCZFpgrjmx5CJABJ1WBKrJqlPZ2iHj/3lDpAMF3OvH7B898WK
         A5Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795817666; x=1796422466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=JwXKkOiA1hHPevvY6KlGz0H49ngjn7RSbuIh1YPq3ZNFaYUe1nazCmKX2br5ZXNy4J
         lrV768348Q3U79vKmJySW2rQ/MkbDivy3dmUMfBNwTYOAPAbhoTrWGG85bRhMU+mxDin
         Q4jcdvzBp30jHmZqt0LjihCvbPF3x7iSxL4xEcataneXHFNDE2OARzMZQw8C/x/OLs4E
         LSe4CdBiFOxtxXIA6bELFzV2YiTbFfJtbz1i4xQtMCPC5/g7joS4/uxbvwPx90zjmTTM
         CE36Ip4C4zEdmHSCsHw+iyU9lpY7XuHS3y/YQZpYEZUXtfn6/OBY8NePBmmoQXkwJn72
         L+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817666; x=1796422466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=1mcbWu9c45sYdMGPpD5X/maqUueFpq3GJMyQIyWtuAh8ObtRrhZryo883V7sbDCs92
         JH8j9jPZQhxBnF4Csv2hJ1okHIXvNa2iEGjw2dZKeUB7ZzSHDAQrcwTKDW8kNcOcuHJh
         wuUzfXjuR4e72p1MCJM2jwgVwdfvUePSfkLfhp1CwRsw4+7s8IRXUX9pHjGAqc86Ev7O
         6xI3xY8CGcj7VnuWz68UWkZ7wFSdxeVtGFeXsByUT2q+oF5LaVgaAYFVdRYDFFSciZG4
         3uSTODovJiuhschoGLaAkfw30kYm+84kWW14Sa8xkcb6MAqMN+7hRAilsO3cIMIVfTf7
         tUmQ==
X-Forwarded-Encrypted: i=1; AL+hErHJL1LWYO1p06x9sQVA88npm0hLl3iCVqyDttcKtv6wKlfQfLS06kUBmgqRJksCKfFnuPytNFM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kkQTX5sZp0iqK+XJCX5osTT372pGSN2fuG5lpPTVp1+cyhvaL
	f2ZoY8RvXMHvRpku2PPrRmu+llhzFDsYzHupzej8mc/XvBOf7M/pAwuX0/Wvjd40ShSc6ISnA2o
	swZaj+lImhQp6oos3BmZh/zv+KbcxV+GHcfAaqAVd4Q==
X-Gm-Gg: AZFdTZdYAar9Ivnih6fl9zUHpAFnJNN48Ir8B6FvRd2qywg1JQt8Hrbce3y9TA1xsn3
	ecaQbxzJJAtPztn8OO8Y1fC3mExd8eLHL2H+O0sGfcUdv8ltnME0zA7bkdPS8I54zCvklPAZIMr
	qojeGg4ux2Ux09SV7a1bkGu0Z7FLxjVdREw/kJ85/nTKLuJmX7sJCk2lneQogBNz7b4fagIpv9G
	pCIEpAEf/w2bbEA1lSsAocg8i3ERRI45k2ergRJdgYnNyeMrWpp8Mv6XBhwlo2kKclpgZCWNv2v
	sR+9RSlj+yPq7WINzeiJp/vRx441+CvX2iiAuyqpnyu0baxHJ3g2dXCy7PcZZSvdfh6QtmrKsXu
	4Ed8UDNNJrMOvD7MTjp77XimcTSQ6XWjEzivdmXHGsQwzNtIFHjh3CLe93DG4uMuoiUA9
X-Received: by 2002:a05:690c:290:b0:895:8474:3c6f with SMTP id
 00721157ae682-8b5201eff64mr106815777b3.0.1795817666463; Fri, 27 Nov 2026
 14:14:26 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tcp-l3mdev-exempt-ports-v2-1-b920f3ff8f5e@nexthop.ai> <179572802536.3135.6305865608768923950@kernel.org>
In-Reply-To: <179572802536.3135.6305865608768923950@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Fri, 27 Nov 2026 15:14:14 -0700
X-Gm-Features: Aa3M54oqRaxMY7_UWPQgj5lUHHUmW8MGZPBMkR5eyixxsYNc4OEEliipG1r_sDM
Message-ID: <CAAv61uQA=z5i7OB3O55jvcZP+wVt5907oPUnhuO-zyjn2-P-SA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Could the commit message explain why a new UAPI knob was chosen instead
> of fixing the selection order in inet_lhash2_lookup() and
> inet6_lhash2_lookup()?

Yes, v3 adds that to the commit message. With both listeners present,
existing setups get a stable result that depends on creation order and
address family, and making the bound listener always win would change
that for every tcp_l3mdev_accept user. So the new behavior is opt-in
per port.

The SO_BINDTODEVICE case without a VRF is a fair point. The same
early return applies there, and this sysctl does not cover it, since
it is scoped to l3mdev traffic. A change to the lookup itself would
cover both cases.

Maintainers: if you would rather fix the selection order in
inet_lhash2_lookup() and inet6_lhash2_lookup() so that a matching
device-bound listener always wins, I am happy to rework the series that
way and drop the sysctl.

> [Severity: Low]
> Should the document leave the fast path columns empty for this field?

Yes, fixed in v3.
