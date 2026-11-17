Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922859;
	b=fAg+ctBqnQd9/lgHKHG1Vk2v1L5XALYgHuu6Yu1umSyriPEfXZxOQ05xeyTIgf4glSwL
	 fB90eL1kvx1xstECJgZ4ZnKpvG2oDfRkF7C2uSF/9b++OT5J5bpfWSNcGe7hOBHXIwOFx
	 YEGJd2+HpxWKxquxb0OnRaUYGL71/OjsLUe49PH6CasqbMLxiZrU9LtFVFqO1N08UGdcF
	 XMYHibWd2mAWwGLZaPU7okMECkZLW64W7TCGR6vGRA4JVcOSnMmm8p66SiGHqTSX0ucdN
	 i1gu0XjTk/rKu1MHWlRdznZFeisImEWygoz0Aj4+KtAz7KjIX2maxC9MxTiP5gBeDtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TwB4RSE1ahOv1eWO7HrIP9Xo526ulRCGPxUhrPC4tB0=;
	b=DrWsLpLJr0gUD/0aejwGmtp+zNkflV0Ck8ZlA+l77ckQLyfAf6tqv535jUi0nDFIOfbJ
	 LkHilTARqZeZneDreasfGYLLfXD+YmQ+rjh6Om2ZiCseQbMRXDOL+lDiLSaXqG47eZkVs
	 QYxzR8UDDi4GwFkeEo4mHM3NSGtUw/v62Xz2co/FVdP7bsYVtrKUoKvOiA6NeYg+EiQbv
	 vxbaBJE3D1ql+dLkemjkhD7CSVB9B5Xi8z8gH+kYWtfS6zLN5K7VGE8LmetCNS+I4Tqxe
	 AwY0E4nWjqBpNDrdLWdwYSG6PEbqw2rtn3fYsN9s2VSLwu+qGx9ysa5dvZFHHH9/KLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1password.com;
	spf=pass smtp.mailfrom=agilebits.com;
	dkim=pass header.d=1password.com header.i=@1password.com header.a=rsa-sha256 header.s=google header.b=mbrGrYZU;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71956606A32A
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71956606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=1password.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=agilebits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1password.com header.i=@1password.com header.a=rsa-sha256 header.s=google header.b=mbrGrYZU
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c1f548f87so81247036d6.2
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 05:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1password.com; s=google; t=1794922858; x=1795527658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TwB4RSE1ahOv1eWO7HrIP9Xo526ulRCGPxUhrPC4tB0=;
        b=mbrGrYZU/2TOeFzN23IFhtlXtGQ53gHxnOmST27w/O81rXdXcuR1XDou6E1j48MhA6
         wwq4r2OalvYh9HWBrwgCxsJq6diJWHagel8aNFSlqQNTCIJbHhie31WwSYbXJgaS49Fh
         FCqoYH74WEGJ3ZcXJ1zVY7dOj6La1jKN4T+Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922858; x=1795527658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TwB4RSE1ahOv1eWO7HrIP9Xo526ulRCGPxUhrPC4tB0=;
        b=E3UjZoUrtKI82cx38oH0qRBmNhNJDvATI2oiC47FZBrUv01oeuFFIrMACcp8SyYKH6
         SMxdjFE0WA1pPjI+GCMyOg2YebiE1OZgtqIWLTVVEijZfCiD2DbhmEXmC+eJOMUldS9n
         q4TluLI/QarAcKoAKw+c7b581jkV++fP1Hqa6gPUZNsxrfYJsa2ygOBmmVntiRToHpsp
         MZveRM7VXIpjVYT2yWsVx7qtFHnJX0mXJpGi8ryegMMsUXSsqmcGrdTrZSOdjkFnKdRf
         AcNMWrwRKgHI/NbgCOXgLcAFrvsXuIvas5HvAHpAlB7nHfq66JebzfoEFRmrLwy/FvEU
         hQFw==
X-Forwarded-Encrypted: i=1; AL+hErFA11tZzAD5GMpA19rBXTuGFGZX136b0DatKsXcVTLGUe6jf6DuMgb3b5cpN1dvrH6lQFiU0gc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9B7JkCvMFjzZNuKt/skACJIIPASX2o9T9w91e96nQw9jlwUMO
	2vgsr05yg1E0RavbbkYkvjoUbNXMIqBi1v4aTKpyoHomBAOa4p2zLN1wAz4vqH0BG4g=
X-Gm-Gg: AYBFou3MTKGtkq/8rFFKO2TtvPpijx8fgzjWbpFrBiSn7JxotcLMQlP4fROrpXFkVJP
	5ydrvlss381YXWWRgZ5SASKC7yLmid8QoVL2uzO+BvjhwGnHZlksAJ5XK5z02HHICbOZlRNJF8b
	QhQdMW4AF2XBsmrdWdf/nhAHVtJSXkdKXhHwY4WT5Uy/qHXBXyeS8A3YCyZDXoznUA0ztIeiYqp
	gK5uCrk00LaG3J4TxWDPBCRnsHj3sK0nP/BiA1TVwqu2qA5mhOxexS2zD7WD6urFQ2+3++3qe98
	5mPx3BwURWMfiLeFon+phehY2MyCUUnP42sqMEZvugeXnLRpt3IrkwXs5e1ocO775SAoqAhq2LX
	uYGkuCxmke03gypBNWnCuO0DoSyKPRegBn16gS+URj/sKj696AvXa9OKEPgIw0SfSwv/QSo7U6c
	30t+sWc2vQDlyNkLDTE+FWXZSzS29jA78J4ZFVe+a8RzJBjPBhsgsBmovHfY9tH/HhHT/8Fo9NG
	SY6Dm75nsTohH/VG2w0GuCM2KolyiTP5OokzHtGcglxmb8IZmYw3W00vC7SKgQ8f0ZavEP5XSpz
	exMJLT6/MDhbq8LnBl1wlTmPT2eobjrfdGHpa2qHZ2iFC1WeY4xDqAaQMIpY
X-Received: by 2002:a05:6214:62d4:10b0:91e:850b:770b with SMTP id 6a1803df08f44-91f24151026mr170565066d6.17.1794922858319;
        Tue, 17 Nov 2026 05:40:58 -0800 (PST)
Received: from localhost ([2600:4041:59c3:300:b8f8:e592:18c8:ba23])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a81sm110979646d6.42.2026.11.17.05.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:40:57 -0800 (PST)
From: Axel Mierczuk <axel.mierczuk@1password.com>
To: ja@ssi.bg,
	horms@verge.net.au,
	pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	dsahern@kernel.org,
	kuba@kernel.org,
	edumazet@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	netfilter-devel@vger.kernel.org,
	lvs-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	w@1wt.eu,
	Axel Mierczuk <axel.mierczuk@1password.com>
Subject: [PATCH nf v2 0/2] ipvs: fix OOB write when NATing ICMPv6 errors quoting non-first fragments
Date: Tue, 17 Nov 2026 08:40:47 -0500
Message-ID: <20261117134049.52386-1-axel.mierczuk@1password.com>
X-Mailer: git-send-email 2.50.1
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

This series fixes a 16-byte OOB write past the verified skb area,
reachable through ICMPv6 errors that quote non-first fragments.
Following Julian's suggestion, it preserves ESP ICMPv6 handling.

Patch 1 includes the embedded IP header in ciph.len at both ICMPv6
call sites when parsing stops at a non-first fragment. It stands on
its own for stable.

Patch 2 makes ipv6_find_hdr() set *offset to the fragment payload
for non-first fragments when target < 0, rejecting a truncated
Fragment header, so every successful return updates *offset. It
drops the workaround from patch 1, which becomes dead code.

Changes since v1:
- Patch 1: rewrote the comment and commit message. Nothing blocks an
  embedded ESP fragment on ciph.len; it continues because of
  pp->dont_defrag and its lookup reads only the addresses. Name the
  skb_ensure_writable() callers, handle_response_icmp() and
  ip_vs_icmp_xmit_v6(), that size the writable area from ciph.len.
  Code unchanged.
- Patch 2: return -EBADMSG when the Fragment header is truncated, so
  *offset never exceeds skb->len (Sashiko, Julian). Add Fixes tag
  (Julian). Drop the ciph.len workaround from patch 1 now that every
  successful return writes *offset (Sashiko). Describe the
  handle_response() effect, the nf_tables trace output change and the
  SYNPROXY callers in the commit message.

v1: https://lore.kernel.org/netfilter-devel/20260925141155.17603-1-axel.mierczuk@1password.com/

Axel Mierczuk (2):
  ipvs: avoid out-of-bounds write in ip_vs_nat_icmp_v6
  ipv6: update *offset for non-first fragments in ipv6_find_hdr()

 net/ipv6/exthdrs_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.50.1 (Apple Git-155)

