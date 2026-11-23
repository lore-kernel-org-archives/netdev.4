Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452826;
	b=2Fmv1aCT6Dmk/hgPt/GtbEP7T86gGUgURqDA5qUheo2BAh99o2zvaZcaV0sKFYwn+hqG
	 Wu/v7ZoOIezUgvb4IIRaKlbtvV66r63OZ1YVAQ/Y52BemzbNfecaWSZ9WsyiHAMYYVWne
	 ZY+spBxu3aYdVpPZxTGK/EjIBQ3N/n/ZJRv2HUpgubrc08DMKkbc5lv/RmCf7ZoQkKOOI
	 d5rQXngvkko3U/2nTJksAyNFSShwbbwC8o5Xz21klZPcxobqDw1k3/ec+gXanhYdL/RbH
	 XYvGXH5mi8DOXnLwYdC6RDAn2TvXnQvTP6m3s23WU5ZHji/ueITKT5ZPnVe6XZ5rrkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=drBF3Z3PQ0R8gQvpvkiEd1RU8Xl9TyEqLv9Q1GlRXlw=;
	b=OEocjBJdDTvN64imUFX5J2BYjopNdNTAZnSaCzro8MvdlA/9tLfRTNsMxUgsU8uUWiET
	 U9R387f4U7q3/qb8cDqJAqPgmT2Px6DaE3pepV6F69SyFARffm2wOuZT52lakxAF217oM
	 S5VucyNYnU3TQeiYCSGD6dbosB78qFOFCGmkiv+BTjRJitp0O8ruM5/uMvg6q2fIyPWl/
	 Oo/e/c5++shqKx0PWNLMbhMAoJ5rKP0G5aOZYT9mLZb2qiPbhyYnrsnjjeKkhQuXbiuaY
	 6yfWFJFpgrrmQ14xc982WV1OcUMHPpssBC743tFwsUsw/fQ8+KjYlama70BS43piRKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kWNAo7iT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574A606A31E;
	Mon, 23 Nov 2026 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kWNAo7iT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51A001F000CF;
	Mon, 23 Nov 2026 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795452825;
	bh=drBF3Z3PQ0R8gQvpvkiEd1RU8Xl9TyEqLv9Q1GlRXlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kWNAo7iTk2MizLlzq6bTI6pK9ABv2SQVSrbQBR4A46kcXFppRsGaTwrWWEzSDO5en
	 YaKFoqoJ6WryyYf6vNmu7OVHhdktiaZio6JNRTHMM0Ha3evBiAKDkNETFs68Qjpfyo
	 2zK5R1WKOhuAvFG6PlUPNwziGkaugKBYjRjjeONPuVNh1RC5fDu6VfvUqZCOLkd/cf
	 iihftvajLKupwIW7J4EZDVISpP3f7FGT4n4IwCCeyZvSESMhrnDSio+ue4T4m709M4
	 uKoo4zFB8kmig0Y5Kdgk5sUSy+va1cFL517sYC9zSWDh82BvuKxiMl2/ZZxeFsXpmg
	 30nSpusG+Xbdw==
Date: Mon, 23 Nov 2026 16:53:40 +0000
From: Simon Horman <horms@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: lcy8047@gmail.com, michael.chan@broadcom.com, pavan.chebbi@broadcom.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, vikas.gupta@broadcom.com,
	andrew.gospodarek@broadcom.com, jacob.e.keller@intel.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe
 failures
Message-ID: <20261123165340.GH31322@horms.kernel.org>
References: <20261118050716.3873167-1-lcy8047@gmail.com>
 <179515123717.3136.1891710789877841672@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179515123717.3136.1891710789877841672@kernel.org>

On Fri, Nov 20, 2026 at 05:07:17AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] In bnxt_init_one()
>   (drivers/net/ethernet/broadcom/bnxt/bnxt.c), a bnxt_pf_wq allocation…
> - [Medium] bnxt_en: skipped bnxt_clear_int_mode() on bnxt_pf_wq error in
>   bnxt_init_one()

The two issues above appear to be the same issue.  It does seem to be a
real leak, similar to the one addressed by the patch under review. Yet
strictly speaking different.

I'm indifferent as to weather it's fixed in a revised version of this patch
or as a follow-up.

> - [Low] The commit message lists the leaking failure points as
>   bnxt_set_dflt_rings(), bnxt_init_int_mode() and the bnxt_pf_wq…

This does seem nice, but I don't think it warrants a respin by itself.

Reviewed-by: Simon Horman <horms@kernel.org>
