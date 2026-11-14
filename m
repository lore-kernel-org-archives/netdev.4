Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794686214;
	b=wc+w8mzP4wyYzGdGDAICXcAjD2DAVp8JAs0ym0OKWEQlEpTVWHbMeQEIY/+hrZnxpE+i
	 tBvNQou1w3nrwLTbPho5HwhqxlIUHnGrAqOuWN+xNf0qTIRfGvAXeEplx6mbJU75PMHBG
	 sjIyzwdgtyiZmFYizBJkz+xfIU50B2CRRf5doNMw/B61ld8xbTzyC7AZ6jLL3ya+iHJaU
	 XYhqCGODfVhoOOzp4u5CIRAWJ/ajKwl0+fEWNgz0YuS/yt3HyiRa+VX4LJYlXz6U3uTdd
	 Qo02poG0qpx3Zgggi/F8ypDxSrGsv+tOgG5u2rhMr3RvXVoV+bdbnuMJwr309x6F0pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
	b=TJaPRD9oCuAeP5INnIULUjIdAzM4Ylvoa91bmk3txSlc4zLubIC2tW1mTiMUKIGD/tBE
	 2m4AcxbKkhCkv0GuNNwFQFcJ1KowhN1KjNKALGLnKwv2gEMvn2RpGsizRfVX2HnVMPqgG
	 1/B1OZsCDoiQizjIl14k/SFPlZ1DV+GghZGtAm+XSzuh40kpXGTsXlQ0DRl8QFCt7D2ZI
	 4Z3j+0NhBbzMN/dL6zyszn+8vLLHVf/MhkEmPe9UzEkCRdktjSLYBIKZcJVoa2E3xm/aS
	 hkaSu7nJ8QLnrN+Vc9NvLQPpfu1VKcM4N6FLPMKKbq52j9EWyKk0erddWV7Ilts+wuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQs3WlZs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B896960A2626
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 19:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B896960A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rQs3WlZs
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c445c95d553so339305466b.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 11:56:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794686212; cv=none;
        d=google.com; s=arc-20260327;
        b=AqThGSyqGXC4TXMbSukdC8KenupLu6cL/WiVeYFtMStmXwuCmunAWB3AV61V2oYtcR
         z6/aywmCHLoCZG7MFMdmitAwnKpYKIEAUBc1+ACjl3Pf8sI1WeLhdWmNcn6bOHBpE53+
         rbB9Zgtwa0U1NpyRTZyTsFagvRNLB1GiuercGv8jdss5tm6N6fIqktwMvXnIOdD3TBwi
         6OVTur5fwd2Z0CJIHiuYw/qoydVEVtn0Re2DYAmvWMOekoW4EvW/LWAmrdMrvXftoc5t
         rL4dSw2Y5P+Yais8wfWfsxhZDZtERCTwmm1WL3s3gDwn4GZKHPJNUUiX6xiPPRFDRy+i
         LxXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
        fh=LtzsWaKrod+SAFYcpahZ+vfUKgEx9RmKIZWbdnVNcu8=;
        b=ESyJsqUEyoatRDKQ42MUWmJErVKKYNHHGOaCqOtVQt9gtuBB8ZJns2a+3BxH76S/bb
         +DbOSvtcrFViYUveblTSCpd7UMHQtu61VVmkR1UuqSxdnTtAnA5KquixuJUL1pgd7Irj
         pztnzjqThYlbFJ2a19IXR7gKxguKh9qBw8IlQzal1WKPOnnnxFsQ3fkghEdn7RvW0dI5
         j8sdD2dgytMfubSxeTBJ+C1WDZvN90rS73vkfU+AUIB2MgFmX1m86d8BxRcPA79JTu2e
         dAg8lbIomXRAnAgUpBoS0FNdKSOcGZOf3dxQgZcahT6cnNBJC2zhtCACnU/GLjWqqoYR
         uVoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794686212; x=1795291012; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
        b=rQs3WlZsbvbwOCe3JBwOj1wHNiPHVH1n1WPD06GXYcmU5bi9d5UePvKXpmPbv2Ro3L
         RsJGfjkHt/OOT8G06tY9HP5CnkytWPnYpMiDDVUmaAxenVIiLnnvnVxo9hr0fEUb7ac6
         wER8sL0audpLVOo0FWtVpiqOwVvXUmiftWNm036B0wkFSs7jJfC98HUREv5tchDf5xGV
         pLj72ErnU5nXqSIv/jB1BqqaWclRDk2aUowPEjF/LBYThZgWBwXdzN9qbTYuMysLGIcc
         23RW3Mv1kMWuAisovsEuYlMAJEmR56AwrLRw53rDydfIHl0DZOQlBDv5vHG+mBXSR0js
         9W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686212; x=1795291012;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=30MCZI4kNA+mBPnrnfoEtNdD8jnl62hOav7zZ9cZHCQ=;
        b=cZvsdqKdVljTMXfgIrJhNGRNN0gvYEzFA6vi/5xZw5q5QXsPXuFp3msRXjt4woZ21L
         m2CW8j1SJZ30rWovO3GZOT9tXUfiQOsALQv7jmdzSOwuDp+ESZ3P05c/33oEK9l4+M9B
         sONUeBzCR+YzdhfZcYUcvjvDJsRdWX843G5HwQUQN+J8xxEPfKuI451l4egSstNuhCVy
         qEzTKUhifGa5PUUH/t5YF2XJ1V+q3Vj00M8ivlUhcnmHhwFmgTWC2YyMI8P6793KjIJP
         jFgQpXhwBe0f9GWTODB85lmSoHo1xXm2sG6kvQa37CErVoMMWPT7EKLhZz7sZ67Nyzvc
         p39A==
X-Forwarded-Encrypted: i=1; AL+hErFNY5SVl1yWPxjobjmKK8KbgsrpUNDAwCXHzjFR8/sa6ejWgPgfckQjREk2U2SHqppgj/gCxBw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gIk0o2Z1QqHemaIT8eKbBGGu31BBghaSyJyIPl5BYKuwitBBh
	c6BExO1t17WkVSh749lfHkXQq2HGxfZ7nww8XGn9GOB3wZ3J7A0KaP1KS1DHaVfRZyojyg7ZBN2
	UBSlT1DA7q4jmJHpqfCkWv273R8WANhw=
X-Gm-Gg: AYBFou25KOPRQQES814Jjtz23k+icfkc4G0KTUfHOB5iuugmQZ2NqCN0XNePwuusSvW
	KQQ1Ujdm4Pbr88XA04cVZu17ziPJ4oIkxGH/Vr+M7A+KgZ1r3i5/xKxvZNaE/v5KIWMF/dQpFFe
	rqdA1jAQ5vwDMBtN3G1g0VSIbGZ6dHK3107hIXOakUZ5Far+u/B5vElLnDD159hEMTmU87IxR6S
	0cDdbnPPfa/GZqPDW8q05j1PwAUlgGp4CsxGiFQuJ9bWefYN26KQpgcjcquHMFqLtcVxhyRqP7r
	+aykBlnGuCbhhKIZ4Aq76yc2mDc28Y7I8TKk/a1J4V9tIAakEZjhDHFBo/72qxCKsT4uNrna66Q
	NFw+9eDfUrB/DDKTrd5cLvvtyNGrb/ALJQj9P
X-Received: by 2002:a17:906:7309:b0:c25:afb6:2d91 with SMTP id
 a640c23a62f3a-c509614e541mr511427966b.2.1794686211861; Sat, 14 Nov 2026
 11:56:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de> <20261112-rtl8365mb-dcb-ingress-v2-2-f8e6fbdf8c99@pengutronix.de>
In-Reply-To: <20261112-rtl8365mb-dcb-ingress-v2-2-f8e6fbdf8c99@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 16:56:38 -0300
X-Gm-Features: AclHuK8e80Cs30KX-korijUfgMB35N8ODch8H-NjMETF8kqtp_dsj3zSHGq-DEs
Message-ID: <CAJq09z5BfnCjNnp1TSN+Hz8sCSocxu5ycoUH_PXm==zggTtKZg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 02/10] net: ieee8021q: add pcp_to_tt()
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> Add a helper that maps an IEEE 802.1Q Priority Code Point (PCP) to the
> corresponding 802.1Q traffic type, complementing the existing
> ietf_dscp_to_ieee8021q_tt().
>
> It is very nearly an identity map, except that PCP 0 (Best Effort) and
> PCP 1 (Background) are swapped: per 802.1Q-2022 (Annex I, Table I-2)
> Background is a lower priority than Best Effort even though it carries
> the higher PCP value. PCP 2..7 map straight through to the matching
> traffic type, and values above 7 are rejected with -EINVAL. This decodes
> the 8P0D encoding (Table 6-3), where every PCP value is a priority and
> none carries drop eligibility.
>
> Drivers that classify ingress traffic by PCP need this to map into a
> priority-ordered internal space without misordering Best Effort and
> Background. The first consumer, the realtek rtl8365mb DSA driver, lands
> later in this series.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v2:
> - use a lookup table instead of the switch (Luiz)
> - check the lookup table size at build time
> - kernel-doc: cite Table 6-3 instead of Table I-7, fix the sentence on
>   7P1D/6P2D/5P3D, document the stub's return value
> - commit message: cite Table 6-3 instead of Table I-7
> - reword the @IEEE8021Q_TT_BE kernel-doc and the enum title
> - keep Linus's Reviewed-by: the mapping is unchanged

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
