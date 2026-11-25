Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636662;
	b=ancamQpTVWv3TUPLU5dSukRDFGAqLxboLXitEiceKkXrRwqyhd8IpDYkhvr0obXexY7t
	 +NgY9nsyRg5pDPsd7kAyrY6/vnjzgvlCrDDfta6IOZFqqPuRhSteRXzw0nDsTZwH+Zny+
	 wIRv9fuNEilKUmOAr+ZsC6rxqDphsuRbh+r/+Qr+b75hbuOJ6vDXO7nhvI6EUWfUVeSOd
	 Vjwu4MpXJHLJEFaWX582UmRs6+6CnroULhm60XQNLMdfasPGk66E30MNqCS3m6Z33VpZH
	 y15tgkiV5Ntx8YUAXJ0CZQ+KMHPHoGiP1VsDW95SnkmQbptVFZ26dhUNU42rRBAKChQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FnWutwVHAzlegSMVJ4Kfkk7OIUcj8sfxBwSeQGcqrD4=;
	b=AHANiR1dTmK4mAQDDRdfcMPOrQHz35eDBfR+mUmY403rm8WQqj9Dr1Yitt8CijkJUUE7
	 Y8/UEWEz6d+1du15JpS2gBqgomzJy2SvSQjswhTwjACIIes4r2lBEMUSQkBwlH1clrjqD
	 e11A94N1lvX/ghBpxBAWW4dzyzrnFMgTRIAZ4/87Iq3ID5gMGK34eIochpbbkG7qsDMrp
	 ODBpT2+R1bLYpi1x8r7EVpx5KUh8nrFGsQapVk4+ILi8Ik2AYFKIZCQUYco3KPJ86jer6
	 KF0puim0Zqe3KOJVBBWCFFvjV1JIclvkWY/gfmFeCZGXXzZ2nnxxB6Hv6BmJSxicoDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=trailofbits.com;
	spf=pass smtp.mailfrom=trailofbits.com;
	dkim=pass header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=BJIbTReu;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7710606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7710606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.a=rsa-sha256 header.s=google header.b=BJIbTReu
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2761c69fbso7857979c88.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1795636661; x=1796241461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FnWutwVHAzlegSMVJ4Kfkk7OIUcj8sfxBwSeQGcqrD4=;
        b=BJIbTReuQbMD2EPqIi2oK/iI7IFqoFFIRB9NyHmHtd8O/sYk+ilqqcXO+oJxkErXNl
         4COQpCv+xRboHxL7oaaxZD0ziFIbxVOQXAeQkX10BXPdjfohhc85+DcaIdix42cjc+dg
         hcD7MK9kaOZa0zLM+lf1pLuzJt/7d6BOAJT6XL/4s+HG7twLRzsd1FXwk5lUhwNbpStb
         6rHUpptWd4sg+WjHPTAXkzTKUARYoFyN4LUTDd+tTGasG1rZ0Q7Ymvp03iFPI73IbtJ6
         9GfKH9RhotXSZ+Vo9coboFv4S0eQVoRgtbUahK8EaQQeALr2X93QgVx+GwhD2Z3yo+RV
         KLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636661; x=1796241461;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FnWutwVHAzlegSMVJ4Kfkk7OIUcj8sfxBwSeQGcqrD4=;
        b=XNvNUYhatjP8Pnxo8Ue6zyFROem3Nmm1CQjPhAj9bbgGTGvWl+tmUFwd0ZYzLVqk/N
         H2AbFxbeTQ9wjV24LT5aNyPB9w6OQcWe2sVGi70FRE08bEXw63POslWbF7c2ng9jPK4B
         MA9n8FehAL8Jkng/wpPGGvc77qtX7Goa2oKAnoJI/rplaJITCQ03SyeKuSZ+WklQOsNQ
         f47nkV21ey04TTPehTun9+ax/G+3gwZ5GJVLA5nMH7Wbg6jG8K7CXt093GFLo6nU/LNz
         OTs9rQvg6k9K5Zx08BJlfPQRyiHsWPvWOSvXJJ2bqqhJMAHsFBOO8HUqX32KdrHexV19
         bCig==
X-Forwarded-Encrypted: i=1; AL+hErFJJ0aluPbvnkRjFNjRC36VB7YkVjg+nW3fjcG4jnB3EWhTzSgWirQpTH5sjd79zFGEP+pb1DI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/9raQiX7OyPghmZ/iUCF6Jy3Vx+Qa9Am0N1fdJDpMOi1f17Wc
	xIccVfg/8sM7oNixo/qND/8a9YRrN8yDqPq5M97DczyN5yLo3c7270hL+BymibJAln8=
X-Gm-Gg: AZFdTZdTivhA0W2XR0RknlxmRJjzNdbSJB2+pOWpOA76ZYVDWE6EFGvxhiwfZeDtkup
	say2Qg5QyOqlruwNLYRewK08/tJxU7Tn0KuG6P6d0GgEuLjUXXc1pUowQhvmL7oe/yOAlSn+3UU
	uwgtg1r+IJK6EKFLYNWXNG7Qdx2Ee4jUYUR9lP42moX383OmCnQmTANlAhWDc5fTi3+/kiHH5DH
	WByzXa+U5oRjQOjJMVVgPnCmuriB08kdfAY3HsqFjnwszQ7feq7sv7xwc2VTq2SGo5xkQ0hhmox
	i9LvmFQoFyGhClxzuybWuqicWTGPTk4MqRkuzdXVyoV7WdhjlmA+X99STHV3Uk+iaTPqET/INLp
	gFPPFnc8N9HG028GCXOXAbE+r6llnR0B+qfSjb8uMRkz4SSjxdKzz6DSQi8BecxeWKwZfBKG9bl
	Pxxnw2pwxPt/fCmgPL+cSfp5grerV3FJcPdYYd03v0fgyYPIgOdlYnDPSa+pKXIt/SegpekyOhJ
	WyLvQ4kJEv2QG7kq0obWFFo5kfcTnePuMSmUvBzqGuiHYY/KSTIrB+LbDHKtXoPjJSnNDft/Mx4
	O2a829dQytdstCG7zT463g2nGBmcHiocV1ktmeYntb2eEfxzOczfJZITfOMNydo40bHS1cD81pk
	i+/woiC1wYZf6n8n5jHTePECg8cR1LPpzEWM8WChhHzNDpfo=
X-Received: by 2002:a05:7301:3a82:b0:374:ea35:9069 with SMTP id 5a478bee46e88-3856fb67380mr17732201eec.39.1795636660967;
        Wed, 25 Nov 2026 11:57:40 -0800 (PST)
Received: from localhost.localdomain ([2603:8003:6d40:6669:75a7:83bd:63db:baa9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm59596522eec.14.2026.11.25.11.57.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Nov 2026 11:57:40 -0800 (PST)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: ast@kernel.org,
	cratiu@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	herbert@gondor.apana.org.au,
	horms@kernel.org,
	ipsec@lists.linux.dev,
	jhs@mojatatu.com,
	joe@dama.to,
	kuba@kernel.org,
	mst@redhat.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shawnq1@163.com,
	steffen.klassert@secunet.com,
	willemb@google.com
Subject: [PATCH 6.18.y 0/5] net: validate GSO headers and preserve XFRM inner offsets
Date: Wed, 25 Nov 2026 14:57:30 -0500
Message-ID: <20261125195735.57472-1-artem@trailofbits.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

Please apply these five patches to 6.18.y. Patch 2 fixes CVE-2026-53091;
the others are its prerequisite and the upstream fixes that followed it.

1/5 be1b70ab21cb initialises shinfo->gso_segs for SKB_GSO_DODGY
    packets. Patches 2 and 4 build on it. It applies unchanged.
2/5 7fb4c1967011 pulls GSO headers into the linear area before
    transmit accounting uses them and drops malformed packets. It
    needed adaptation; see its backport note.
3/5 fa90a3145c03 stops xfrm from overwriting inner header offsets set
    by a tunnel. Without it, patch 2 drops VXLAN-over-IPsec GSO traffic.
    It applies unchanged.
4/5 c6648c9f3b51 bounds the segment count and accounted length of
    untrusted GSO packets. Only its context differs from upstream.
5/5 35d2d6e5ac0d rejects a negative TCP header offset in the code
    added by patch 2. It applies unchanged.

Patch 2 is in 6.6.160, 6.12.114 and 7.0.10, and in mainline since 7.1.
It does not cherry-pick onto 6.18.y (checked on 6.18.57 and 6.18.65)
because 6.18.y predates the qdisc_pkt_len_segs_init() rename and its
pkt_segs accounting. Patch 5 is also in 6.6.163 and 6.12.118. All five
changes are in 7.3.6.

Compiled net/core/dev.o, net/core/skbuff.o and net/xfrm/xfrm_output.o
with CONFIG_WERROR=y on 6.18.65 with the whole series applied, from a
cumulative x86_64 tree, with and without the current queue-6.18
patches. The intermediate patches were not built separately. No kernel
boot or runtime test was performed.

An LLM was used to prepare these backports and to check applicability
and stable-queue history; I reviewed the result.

Thanks,
Artem Dinaburg
