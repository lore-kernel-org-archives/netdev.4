Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794686372;
	b=K5qZL8fsutURImUMgR/UIlIL4xQ9AukRZ5YzW0/WUxkETD2Ejq+VWpoX2doISbXejX0e
	 J7SOeLRNTzbKHZQohXsStJn5Cv0uAPfd4Q9xqDBYh9eFhtaDq9rXC1c5HfhicfhPq3zSC
	 dxuKwQBWbvuwq5L/ViOnYIRgnlbOIzwsU0qsy04R++PuqyAYHFg5jo/1AeakGj7zRTj1k
	 a7vu2LeGHF6pzs40QqBNPRWzsBQEWIpJpSoXL5BPKU1/dYoWZbrXykolD4jztb7jRHcJV
	 ACqfogR53J+fo80tq12NSORfWT3lmEZaQApVCBY1mbVn0lRj0IrB0tEcoCRlProXxJA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
	b=DrRQc8l5ot6MJD9YABP0BQ/vEOA/LcEG1eokL1prGHgaz/OcZE3yvv7KaRDm4GGCXdZj
	 uFy/EqeN1go554o1bMFuoyyEqwYbbIjQaGp1XiaZoBseAC8PR5XueZPqKPYbrhEgHXjnp
	 7Xr4jv12QtNYlDP/7mZ2wayCCLmTz1mDzTi8ks2JH1r73dagnof6Kt7bz8wGcg6SV28od
	 kgEtuoSkLaUJTW153dADkr3gxWnHLDBW3Q7ggU2CBSAV/9RJ1DWrBu2Qhn7Vd2knDlVed
	 48NCmBXJ4Q5mFOXsNwkApOpOUYaYFDPL3ivYMFSVkcwNWZA/Br7lL3zDl47p3ronX8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Axa3Dmkk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E4606A331
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 19:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E86E4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Axa3Dmkk
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b8082af2ffso45422a12.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:59:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794686370; cv=none;
        d=google.com; s=arc-20260327;
        b=m4ucfL0uP28yXZFd262bF9PoxW2hIR1qmV+iUDo3zx4uFuxu0aeoPkKAro6HqHGZAx
         /lXaChQSqDcN3z4QmDjMDueiGr2lrCkIs9YwjIhUTWaMAgv9xIBWg4/aRnKxrkjWd8D8
         /xo0AliEK1XRycpJQutk4IBTK8XkFBykdEDluPKzlKBmnbhzaNIRVncHOBPVVyn9MezF
         F9hGMFb4fhBN8exO6JbhNQWJL+NWVc1/wo0TaNJxAPZluWHkX3M0FexIOFBrLWQ4Lyf8
         9WXyZbxcVEhkVSk1GOIvA2kZtDcVLi7iVUy8PgnuXI3d5AbcQpDSCmjTBEEaB5z6lZmh
         7cAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
        fh=lTuDoFnhIjq0pLKP+8oG0q/DFpcPt1doi/C/c7ReIYM=;
        b=DoMvfd2OXmhZi8qjSK0cFitQ+MxofRp7VFH8GWhah35DAotDEqbtKNh6wkhy3oqVYW
         f1HLddOeQ/DrYO7HewF7FXrAWw/HcnLG0E7B9kuszuiTuQdSO5HAFfmTCPly6qQwOEab
         DHhUeVzGwyQwv6VI+jLdR+MzB9c7mMx8v7dyMKtL175wD3i+Ld5t+WqVayfBKv+V5voA
         Wz09LTqvzKML/iE7lCYclQuVW0lxKqHCLDTsuhUlFC8oxeGO3W6FaRd/j5LP+MkWKZzT
         9neWC/naaqsMT0oOW8h5osRZhfs9OTuNYKQ0vXS+o5bji+Ipr3dcZ54fRRx8pB0rSiLA
         6l/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686370; x=1795291170; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
        b=Axa3DmkkoslFogfdNXB/3Y6s5zTqnqdgrbeuW6Z4aVIs39yyJmN1YHx02WcezqfyAB
         2x2+nB7mKedd1PBkymSJHTG0mW68fcOV5u9d+qSORJ1Csl/vIB2eeEAgByLx5U/FpX/B
         bzhRD2CFO5JuZilDu0J2hxZnpbklilA7OtyZDDMu7PIQsnT1m8BV41/J0AGtGHOlG2/Q
         OYl98C5KJhk5iA4bGScFPEiOMJ7T+3fsEyMuUJKw3yucTYFOyOs+Awy0S8LXee3BhGaO
         6pcMzI5mX8vMHQPL5eRgse+NCDT8Fe4vJc3KqYgWb5SIZEY76MSoh7V6AMqkctKsH4W5
         Xn4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686370; x=1795291170;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rGx6N2NXJiDpxISyYCIFC0My80iwLXCzqmeShpkRblQ=;
        b=EPkilm8C2RV9VgVRmEeuPCAZWiksTnqjswyEcF6a00smpfDuXE42CtkjPZEqr2PSif
         KZo71HY/rcl6TRBTXg+Byi5rnEZ/Jcf5dI3XfmlQoVnhsW5O2HVLRcMHCd/OASzPfcsD
         DfdDHSm5ieYTuqCZN37B63yniutPs26ib6u24W/vKf1AG7QA5CvEBSdpMBLvOS4yVJSY
         epNvAbg8O1x8++zj1NCqv3vt70Bv2S8qeQgTAksbJXa2nvgcCn+hYnLUogg50cBOZO9o
         m43vH/HbXt+wUuNTdzR6aczWNHmrlgo2XeDm8Q+96TQLS4P6Q2B73wgV4BAPrfMVuVRh
         zApA==
X-Forwarded-Encrypted: i=1; AL+hErHWt3wr+BcjlYqonYg4gcHDz0FAah/pUKYldubBlx2+PDd1ABXaIrFAvtb4QZtY5Rt4FmWaZpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZrmY5MxZQwF7Em3rNoJidhf9gIAgYECNazegs5ac0lU6j8/qS
	+J9ouOTWpnKxkavNfLf7jg50NBnotBsNzdA0KWg/NUxPsfXnmvfyYJd0MJQ8pe7OZv/VHctCJWR
	wZMv4TEYoqJEOfHT8hoc0crO8BKc/7RE=
X-Gm-Gg: AYBFou04S7SsI6xkGCfQ9dP82G/fKU9+oaDUBo/l+uy+bcrxKO1Qn+5ckvh2BwKuHN3
	Uj38v5Mlk+gU7fDJ1cjLFK5bK43gApC45i75kvno/PlTHV5OvAMfidoZL91eOczqoJCBpTwJfbY
	tk0yGnV+FSjNyuto85RptYZTmDif4f2FKR0wvWdXYfyt9rNWmUfhmFYVO4sBJijSAEsgKZSCUo2
	frLXOp50UaIwIA6tuhTHtb3P8Y2oTrHZIxfoGl0sCQBONIXhndjWH+FA+YjK3OqQf/mpnwS+2uF
	xyCVZ9TWnqx2v5kRVSXp6vNLRW9bCNSNwRAonrIxIwKAmYYY6Hd6WZZu/2Tl3LcPFK4WMrgrZca
	S/KY3r5xRzq7Ns35i4mUGsVXVkT/x7VOJxKu+
X-Received: by 2002:a17:907:c05:b0:c2e:378c:8ce3 with SMTP id
 a640c23a62f3a-c509634a522mr529891766b.32.1794686370262; Sat, 14 Nov 2026
 11:59:30 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-4-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-4-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 16:59:17 -0300
X-Gm-Features: AclHuK9tTdMaPCT4_EVDhr5kykymtyOgjut6ABk__VuqEE-znXptrRsUfuy9rmU
Message-ID: <CAJq09z5=CiYX18kSjM+n1LLe38hPODiPpemYLPyWtumETmKY+Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 04/10] net: ieee8021q: add tt_to_pcp()
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Add ieee8021q_tt_to_pcp(), the inverse of ieee8021q_pcp_to_tt(): it
> encodes an 802.1Q traffic type back to its Priority Code Point, and
> completes the pcp/tt helper family.
>
> A driver that reseeds its PCP classifier through ieee8021q_pcp_to_tt()
> stores traffic types in the hardware tables, while the dcbnl priority
> ops exchange 802.1p priorities across the DSA boundary. Reading such a
> table back therefore needs the reverse mapping to restore the 802.1p
> value, which no existing helper provides. Because pcp_to_tt only
> transposes Best Effort and Background and is the identity elsewhere the
> two directions are numerically equal; provide tt_to_pcp as its own named
> function so the read path does not decode a traffic type as if it were a
> PCP.
>
> The first user is the Realtek rtl8365mb DSA driver, whose dcbnl
> get_default_prio and get_dscp_prio paths read back traffic types and
> must return 802.1p priorities.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v2:
> - look the PCP up in the pcp_to_tt() table instead of a switch, so the
>   two helpers cannot disagree (Luiz)
> - check at build time that the table has one entry per traffic type
> - kernel-doc: cite the encoding table, Table 6-2 (6.9.3), not the
>   decoding Table I-7, and name the IEEE 802.1Q-2022 edition
> - kernel-doc: refer to the enum doc for the Best Effort/Background
>   order, and document each return value, including the stub's
> - keep Linus's Reviewed-by: the mapping is unchanged

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
