Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197856;
	b=mz60c/FtDk6k4dL+CiggApCNuPPJiiA9eBET+oYHV1Qa4+Ml1c3v70AOapgBlu96Ovwz
	 fPKGMb9VfRXs8AXF3qnUGiZv5ltDl5M3utjYxprXrR5ystzdnZa5VqG30/+U01m5CLJwM
	 QpAZz5q3m5fBg8kgkAzX3amaKJhqI604JcBcrULn7jEhYBz3WRok09hwY8cPulr9YQHX8
	 SfuCaTuatkBF1KrgLXn/AxQfuTWUAsNdPp2Gg659Q26P5M5WggrAM3AbpeMFo/HtWsg16
	 4bBB+zTn+Y/i3di6wspZwlmbHI9fxTf21+QyDMMDdKmsR3Mz1HrMFvuCNCkKDy1vvnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197856;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=tlgHNxY3cbIEZdFgXAY46HV5KLADXUvJ3tj4tsStDeA=;
	b=s8wwBO/Ub8oUAJRWO39d48r+GIIL35EUtypBykDZI6cBpLrz+iaSYclILCTknxRgzNBR
	 rImynYo2d2r+inv8RhUZnf4FJohNxy/sAOgue7fyWQrzucCGJBDrGRhZ5CvQuLcWV8DJN
	 z2zxVaXPncQycEJGJIAMNSjYEeeyvBD60gbOLFHvceWecOTgZ4ucRS9VvEEDIZXHmFViL
	 I+Ir52fCGPZfBb5yq4iG3t4+7zXDXrQidOCfyLsm1VqmS0nM0K2n985kFGtJk4WeeOhii
	 0x5yoyTiVBn6Bas483xd+1vUUg4nuJOEfjvAAjQXSMOTz3EI8w9vM1e8113dWKt7p6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGFqq7s+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F40960A2626;
	Fri, 20 Nov 2026 18:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fGFqq7s+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DEE21F000CF;
	Fri, 20 Nov 2026 18:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197855;
	bh=tlgHNxY3cbIEZdFgXAY46HV5KLADXUvJ3tj4tsStDeA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fGFqq7s+2JMKLvv1WjB7blE5A9+++itSvV44DsMY4p9oiMHGexiUPOF/zNO5ZfIgd
	 Ns1dZR9ZNFTxFlf1+XonkwAOeUUw7ouBBqXFFUFVMIHspM3lRxD5BcLtclvgtGLSsN
	 1UGwOoXGsIImUz+Pz5NHI4fLomI40wW4sIgm2D264vH574TyGK7xYVd8Cv9XdN2Art
	 q+xq+YnWrzOohcPGCtOm5BEILRsBLELbJHmq1l2t/72ZL7fWiSp1vyGF5w3ch5h+CW
	 yY3QDi58hnOhrsCeLI2SNdQhHzG/cHSrdBTyk02GtGWZrmOCLTQXuBYkJ1OhQ572YR
	 VlkNQNc247VvA==
Date: Fri, 20 Nov 2026 10:04:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: mdshahid03@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
Message-ID: <20261120100415.363fcb19@kernel.org>
In-Reply-To: <20261120134548.214126-1-mdshahid03@gmail.com>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Nov 2026 19:15:48 +0530 mdshahid03@gmail.com wrote:
> From: Mohammad Shahid <mdshahid03@gmail.com>
> 
> The rtnl_get_link() function falls back to the PF_UNSPEC
> handler table when no handler table is registered for the
> requested protocol.
> 
> However, the fallback table can also be NULL,for example
> after rtnl_unregister_all(PF_UNSPEC) clears it.
> 
> In that cass, dereferencing tab[msgtyp] results in a NULL
> pointer dereference.

How can this happen? If you can't answer that - please do
not submit any patches to Linux networking for at least
6 months.

> diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
> index e141340172ce..b552cbf17d76 100644
> --- a/net/core/rtnetlink.c
> +++ b/net/core/rtnetlink.c
> @@ -406,6 +406,9 @@ static struct rtnl_link *rtnl_get_link(int protocol, int msgtype)
>  	if (!tab)
>  		tab = rcu_dereference_rtnl(rtnl_msg_handlers[PF_UNSPEC]);
>  
> +	if (!tab)
> +		return NULL;
> +
>  	return rcu_dereference_rtnl(tab[msgtype]);
>  }
>  

