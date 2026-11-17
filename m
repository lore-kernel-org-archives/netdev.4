Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950588;
	b=JPBQ82QL5UCcu7cz7m2Rnr65NupF/IHwwUe9s1S7GvmHr50ph9QAzhmYYi8O/Da+EesA
	 ytifA3bZoybC/3taMpeail07NR8JiImMoATMLyLym7GUJDDpLgDcafXydy3WuyjDAgBc/
	 xZSBohyOnRMDiINDWmlEM3MP6EDLo6xgq1udHnk7eC/qvJnEeoYog1cSoY/xY8CZB7WFi
	 95dBaFeyH81wX8HuW3hmSn2xWb+xPqDEJYoedEnA6roI85vqH2XkBqJkJj4a+qkg4yevg
	 UuN9JG5O/4eHYJonvwt76uiOp7ETphoOU/Ttm2eRXtma1EV5JFDtpYyhMmIgAuwlpSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950588;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ivv/HLtWZDGXndFoIoonS7iWYOytgA6TsI5iBjC2yfA=;
	b=II/mhK8voE4PBcl0itKynAEWqdXwb2C4FJ08V3fGLmnq+nHvzv4UViUpBC+BkoxG0ryz
	 jk/1kYi5whrNVaVX01SnDZqmy/N/ndlPDfhd3by7CcCOpHN5XbT8RLRB3R7L0fPlCKWVx
	 LbaeReSkJBCtSW7js5VNDJUxKTnzhc5HbPVOz1rMFKlt+zraW65SNA9fXOG92OzMYbxn+
	 MfJu3KXwKfMRiMkOkjh+8+h+nxUQmFDEALRXo2P57P1wjcxhpyEhpIFY+7C414rwkYXwP
	 eaIc47A4mUPqpaHjE3MtMpDwJXZrnerNjbXzhkKQZh+j9GJ8kY4xtRcENgfZN3AhhBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCoFj8Md;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD234606A339
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCoFj8Md
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7C21F000CF
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950588;
	bh=Ivv/HLtWZDGXndFoIoonS7iWYOytgA6TsI5iBjC2yfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VCoFj8MdgqdEFCHkQ1FLZUjelaP5AG6aHLrJ7d5hOiWCxD263k3m9KlBhNNw+9c9L
	 RBp9xLGFz/7nkx1DObXHq0L4eOpIH7E1XpTlFd/pAuY418HFGbuYfy3daAvXULnRfQ
	 nB0MxepBtz3QipkhKvZCnD2DBjDpZnljIi9tkSJ4ws4QIYzUNcz6jIrEKDa7l+m96c
	 iHGx3r72BiV/XTciukTjTCdn/R9Oy1+VNDXw1Oxf5AcdGjnTgaAkMGMZMUGIs6C7/C
	 wH4q1fNg7dsM5Ywi8Fxdks60KQu8vSyc7AHieXzPA4P2/CaBZ9aCdxj6SWUCNh7D5/
	 OL9zkM2OEsR2Q==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso158336e87.1
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:23:08 -0800 (PST)
X-Gm-Message-State: APuU4Z+B1oVG/Gw+wCgDRKUqj5KNDYsAESzcKg/GHz7vVfj56UKr0Dnw
	CRhdidd0RghcrbeLf/1lVwztPD+mGI4ByESSAoBKsUZ3QtNV5BiyN1XRxMG/xmXDDrqNYdLidbY
	4qbQtyN3RTwz7R7dDpYddBP58L8rvV9c=
X-Received: by 2002:a05:6512:3f2a:b0:5c0:b5f9:2f2a with SMTP id
 2adb3069b0e04-5c1a0ef7bc3mr1357421e87.13.1794950587167; Tue, 17 Nov 2026
 13:23:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com> <20261110070803.1099-2-zhaofeng2@cmss.chinamobile.com>
In-Reply-To: <20261110070803.1099-2-zhaofeng2@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:22:54 +0100
X-Gmail-Original-Message-ID: <CAD++jLn665uHMJ7FqWvdpvrmV+6swhrNpc-yLx20+ADtzJpKUg@mail.gmail.com>
X-Gm-Features: Aa3M54o44UuunTchrwBVQk0gW-Li5wccYbCfQryWhAr0YYMlTOz7y3tpa_12JhU
Message-ID: <CAD++jLn665uHMJ7FqWvdpvrmV+6swhrNpc-yLx20+ADtzJpKUg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: ethernet: ixp4xx: fix OF node leaks in ixp4xx_of_get_platdata()
To: zhaofeng2 <zhaofeng2@cmss.chinamobile.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Imre Kaloz <kaloz@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 8:08=E2=80=AFAM zhaofeng2
<zhaofeng2@cmss.chinamobile.com> wrote:

> From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
>
> ixp4xx_of_get_platdata() resolves the NPE and the RX/TX-ready queue
> phandles with of_parse_phandle_with_fixed_args(), which takes a
> reference on the resolved device node, but the references are never
> dropped, so the NPE and queue manager device nodes are leaked on every
> probe.  Since the DT parsing happens before the -EPROBE_DEFER check
> for the MDIO bus instance, the leak also repeats on every probe
> deferral.
>
> Drop the references with of_node_put() once the phandle argument has
> been consumed.
>
> Fixes: 95aafe911db6 ("net: ethernet: ixp4xx: Support device tree probing"=
)
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
