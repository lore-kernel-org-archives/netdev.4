Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795544999;
	b=f+Jlj5p1EOafMZtM+RFw+j1OCy4A5tMaFaq17fp59/10KfwBe+Fsb8I8cUJ+ioBMboA6
	 e7ud9hBqJH+Tk7R2GdnkdwYhNaLb5meEk0Yg9f/tLcbHOLzAvccATyarDpskqp0GgMtrf
	 5Hf0uvaXlPlvPW0sYwVizT4bGRIIqXpa0ApSiFSVnYCf6HZ6A8VBKSbMjlDoSrt+d4Jha
	 mr8fZyE3Qig2joEyl2VObbjkz3CwnOmEY4WoAQLuY7FEMLzaFPmMADFv1miCfW/KAT3xI
	 UmNR+dUnWIjl+4HwDf73iBQqN9gutwSMN/bU94Rqhnb6wqRsHjg7wkHUIbFSD7JQKoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544999;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Mt1qkJqvHKWZ7lCg6Zj89oN21K+MCF0dZ8CV5svzMuk=;
	b=lOaLingh/OAy46gBUcURsWtf/P67bVebK+qdTjOxacQYUPLv/J1Z6ss8QU+sdFvY/2A9
	 0dPjjj6uvK71I5DF5+RLJ+Sx+z95TwO88jYZRdmvqRvZAZuxjz29A8/0FhCddztC8RiX6
	 TMQgyNttS6Ff3iB600douSdJry1u6GWRRYbzyU5XD1QcMQ5aQ4nuEwGC51lYKLGDEkSdo
	 o/PP4IFWFH0DFr53NKZNJEwjvijrhGKZKcXySwVgBSuEesDZ8yy7m5OdhtpcFE8T2JIpE
	 O9iCZn5a6EilRd4lOhDXLb213/OR1YtsKB6pdozzUl74y2r5vWLlegnPK/oFTZa7lPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooSJxSha;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A26606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ooSJxSha
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7369C1F000D1;
	Tue, 24 Nov 2026 18:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795544999;
	bh=Mt1qkJqvHKWZ7lCg6Zj89oN21K+MCF0dZ8CV5svzMuk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ooSJxShauV64d4pKfic/1SnEHAmpopX3UiOmTsTgd/pjSzhKcxsPhxJiI2Qycq/aj
	 kLPsxqiyAhprkG/pDFkrxs4j4QRLcqwzyD0B0r3vItf7f1q4K2DT3Udlpo0tNqmdZp
	 ButgIdwFYMZGrujWXuWNTUCVK7b0cTEGut0o5ysVIY8Xl6G/O722qOEtFtOat0WCK9
	 jxbLib0fZZsJpE0+s2RciLMyoe0CuqzmEix/Ox4X6783Il5SKvN+nV+2C+awB1YrVe
	 aLmAshMnJWFugudWp2TeoVmr8KAWXUh0L3qWbQ0Q2HU5f4gVgFJLK1la6TNYm1wL8p
	 y9pQgJHrNbLYw==
Subject: Re: [PATCH net-next v9 12/14] net: ethernet: cortina: Account RX
 buffer size in truesize
From: netdev-bot+sashiko@kernel.org
To: linusw@kernel.org
Cc: ulli.kroll@googlemail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, mirq-linux@rere.qmqm.pl,
 mhun512@gmail.com, edumazet@kernel.org, netdev@vger.kernel.org
Date: Tue, 24 Nov 2026 18:29:58 +0000
Message-ID: <179554499804.3135.1304494460561168411@kernel.org>
In-Reply-To: <20261120-gemini-ethernet-fixes-3-v9-12-298671d799d5@kernel.org>
References: <20261120-gemini-ethernet-fixes-3-v9-12-298671d799d5@kernel.org>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit "net: ethernet: cortina: Account RX buffer size in
  truesize" fixes a truesize undercount that has been present since the…

--

net: ethernet: cortina: Account RX buffer size in truesize

Before this patch, gmac_rx() charged each page fragment attached to an skb
with only the received payload length. This patch charges the full posted
free queue fragment size instead. Each fragment pins a whole free queue DMA
buffer, so truesize now reflects that.

> diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/cortina/gemini.c
> index fe23ef8be9e51..5f8f220ad9d73 100644
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
> @@ -1907,7 +1907,7 @@ static unsigned int gmac_rx(struct net_device *netdev, unsigned int budget,
>  		skb_fill_page_desc(skb, frag_nr, page, page_offs, frag_len);
>  		skb->len += frag_len;
>  		skb->data_len += frag_len;
> -		skb->truesize += frag_len;
> +		skb->truesize += freeq_frag_len;

[Severity: Low]
The code change looks right. Should the commit carry a Fixes: tag, though?

The commit message calls this a bug ("short packets understate their
memory use to GRO and socket accounting"). The line being replaced:

    skb->truesize += frag_len;

goes back to the original driver submission, so this undercount has been
there since then:

Fixes: 4d5ae32f5e1e ("net: ethernet: Add a driver for Gemini gigabit ethernet")

Without the tag, stable tooling can't tell which kernels have the problem.
Is this meant for net rather than net-next?

>  		frag_nr++;
>  
>  		if (!(word3.bits32 & EOF_BIT))

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5%40kernel.org
