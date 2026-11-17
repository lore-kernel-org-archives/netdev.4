Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950607;
	b=k+eafzRt07CuyNmoQYJpzn3wQtziqDAPb6C4bkIJwFK4WXxYrGsl5akgH93UUSr2zlEv
	 j2TWTjIg518fRgqGevhQVXTU/2SXzjYLWJMjelxDsPDtJCNHGw6ONoyTO/KazaVUb4wiY
	 D3clUADUC0P75KxGWLDIn+pAQEDHjnrLNq2Yf4qdqeUGCOhMmNNhR2Joa+/o0sQ1GBVhC
	 qNQQ9rH0ZSdC8AdFes+tHKDzoTgD5yuhy4JzkvxL9ksddi+Ihs9aQG8hcL8OtvCdg1uLs
	 lbkb8GJZpkd14qDjiVeU4arF3hi8BlEfkKE1jWfixKL+WCmaryaCl95FsnHdMhYi6BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950607;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GZjMfrUr3XmhgWf8hPROW+HmkG/OoHfUFt7B10YN/bc=;
	b=bNkor9dlk99CpjCAMhag06T3QhJIVir1eUpW9FeIvS5ktJjrT+9w1AAA5Skv1ceHKblK
	 Qofa0EBCf+9zWF38R81d/Oetr32saYch4jtFgdLs6y7TXX//RCxme8zIhe1wfweUJG0cQ
	 +IfxQADmGTSSeft/SYlbnVxUVTtrI0gm8bgonqiC4ia42HChF68c8ErdlXdsUyDgkemN6
	 Af5v6+kah0dZIRgKlKE7dmHVsi8uW2e8G6BwKFGJKxKRoArehloZuZZjoIiyuEyz5Mum7
	 gHSpbuR0hhZGrj9G2lDKKD8BNeG4E1xmE/3RSalnzBKjVF0pv15jGzJrWtCUsz+J8AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvaXbL02;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE2606A32C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZvaXbL02
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82ED51F000CB
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 21:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950607;
	bh=GZjMfrUr3XmhgWf8hPROW+HmkG/OoHfUFt7B10YN/bc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZvaXbL02mfeBYGx6S3YXxD1g/Ale5OnwClltwO6Arspn8wsAQtfnpbqh8cQyVKj1D
	 WRGArWanyaN+widsatccnr79F5E9PruXMbp3+Erckd6xCn9AuM90lnj9j3Y/oKPHpj
	 r5b06oTjTbN5N33MKKqPlktPe1Uo6sz7cfZpfYzfiU0GbBYY+gSZoTvPpLG9UW2chX
	 zT4zZtfhi60zGUL0QFzSW4/aZBSIrOv6BvY+lHWqKb+n9PB5i8T1yBj/UqAWclNJE6
	 I6O3DfG/b/ipt0+JhyqSquKIVgZgpZpij1Gu+KcIgGgQivL7kISDycWUi9TEs3//SP
	 2dIUee6SW6tPQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c17ef1e18cso173723e87.0
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 13:23:27 -0800 (PST)
X-Gm-Message-State: APuU4Z+rv2qNJ7rTmbgnCgHPnHx23DiaLtCdA0Av6Q/X7ryfdXoavGU5
	zWazqCKOyLhxB3BsKs0ui+3BAAR4ME3B6MA+LRPpjOCI1mCAJPD8D+StsxV5gieppOz536B4GLz
	8pw1ayzL6zDaWax71/2fV7L7Ls3MjqOA=
X-Received: by 2002:a05:6512:10cd:b0:5c0:d102:8363 with SMTP id
 2adb3069b0e04-5c1aa095f77mr100549e87.38.1794950606321; Tue, 17 Nov 2026
 13:23:26 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110070803.1099-1-zhaofeng2@cmss.chinamobile.com> <20261110070803.1099-3-zhaofeng2@cmss.chinamobile.com>
In-Reply-To: <20261110070803.1099-3-zhaofeng2@cmss.chinamobile.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:23:14 +0100
X-Gmail-Original-Message-ID: <CAD++jLnbEmP9ABUb00ZHWZ+3KHOcozBfnzg45kr1=Zekxs40ew@mail.gmail.com>
X-Gm-Features: Aa3M54py_xbuD81Mpen7PMYfOauNjDlw9rFU-q20_qg1ygTb44wF51hLre1aTTk
Message-ID: <CAD++jLnbEmP9ABUb00ZHWZ+3KHOcozBfnzg45kr1=Zekxs40ew@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: ixp4xx_hss: fix OF node leaks in ixp4xx_hss_probe()
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
> ixp4xx_hss_probe() resolves the NPE and the six TX/RX queue phandles
> with of_parse_phandle_with_fixed_args(), which takes a reference on
> the resolved device node, but the references are never dropped, so
> the NPE and queue manager device nodes are leaked on every probe.
>
> Drop the references with of_node_put() once the phandle argument has
> been consumed.
>
> Fixes: 35aefaad326b ("net: ixp4xx_hss: Convert to use DT probing")
> Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
