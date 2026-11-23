Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795466140;
	b=UF/CeXpYQ8UnzJyqUDBNs2s4UzVV4dtS2ktcvPXAiroaylelXO2z4EaPunILDF//zvVv
	 lIc33k00CLkZwuDxXpVuH86ESWQrPZck6rqJlf7gwNuT4CLZp8Qj4MMxFZ38Ki07d7+w6
	 hGSY3FSHEMX4qocardMQBFYw8dt4oovImKka4m1RWNpkRem6ugSWtfSIdvimMTpkqfGIk
	 9NQIOpdIzkleQ93GlwxuEXLajZBz2dbbZ64ijE7QhcVaIwna2awPHO34CpRPywcin0pT+
	 VFEJQ35deZWFKYjfxlDAMNDZZwcbViytT+CizMRCngbmovC3mya0d2mIUNzEDUBrWAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795466140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=krTB7RKoikRzD5yyiTQ8FGQ+GcAUNRrGAGBRDsGvivU=;
	b=rVmzhl7fCPX3l/q2ce9/rIbsH/QBdhKjOifw4/0RzZahrV9gVSD8GYIc/InS9mwO5jkG
	 x8hwH+BtNsnq0cz0yMu9Ju/hzWohXkejAadXkyiHSKrfOloqOgEmCARB0IOATHXZXRIXp
	 3fy3AnGsuHq2H9lNmPlx3w0+jwwpLk+r0pX2BHKknnH7kWTHui1o6098o5BD+UOTLrSrc
	 M8kB/0PSEmkBPRjhbjHTDXPmdVyzZEHb78vJl0PCRHxWJrdz4nmq/dV+W9UBtb/Uag1hJ
	 Dg5n+jCSU6wiEVcwtDmR9dWlDzR+yBsLQbePb3EpRoHlcvp2oV/Z0cDKDE+uVM0G0dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b="QQXh7/z1";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20856606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20856606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=QQXh7/z1
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-71ad5f20016so2502394eaf.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:35:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795466139; cv=none;
        d=google.com; s=arc-20260327;
        b=W7HMh2Lc8LV+6l5rFwU7/WXL11gWLnRLCzDxWPgv0mjYmdZ7SF+pp6ce+27iiYG8XX
         IperM+M7iPQo9W2ft8cFbNHNPQO8KOyAYTPt2t5AfmE8HtLAfiWMwiB/1PtvJ0s2IbWs
         ioGmbecRfwb8+UmOCYFlEffngoW9mu5/kgun8amYB66fLEZ5YWs38e43o6xUfFYqn/gQ
         JNGaQvmCfhu4Q/+pXWJprUlRdHPpGijAjuHXIxROLAnP73YYPWadSu/PqNgfUcMg46B5
         iGYncoL88j0NSQNKtNfMfNehxc8I5m9OaYoBcdVzeyxp1/6/5Jv4BBBTqyKqzpQZGI5z
         FOUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=krTB7RKoikRzD5yyiTQ8FGQ+GcAUNRrGAGBRDsGvivU=;
        fh=vwsKYc3963CloJzlTSWnvijHE9l8ACVa/4ER1aYbAQ0=;
        b=Po/Xy9GVYronXEag7QH7oTQ4bFgXxxBBtCNjwUv2OoknTzxtAfUTM2NBceeydPdFmj
         Isk6QmnTfqCPIQDao1NdnalYTGjx/4az5clXvX4xFZ3uwpstdM3Kt5StRLhyd5iSPx0G
         XjtW3SRJNxI75YAC0diUbrR68C/k8DDhTVnoZO0F1PHYPDBmLqE45DLwDSts+U5sC3fL
         rO0VAld4lXFC0pwGPeMY63Ogd0SBuh+arMDrL2vW1c0iUQkMNOPp8BOiDvQ9lsHjRrb/
         kN5qnPQ216xw8R3zl/2CorcfDry9l94TBi+oOOH9v+dru2N+wMOqev30u221Q3+P2j35
         D6OA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1795466139; x=1796070939; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krTB7RKoikRzD5yyiTQ8FGQ+GcAUNRrGAGBRDsGvivU=;
        b=QQXh7/z1dUg33nJ3IIus60/y21mBi3We5PBI1YHITS915S8JNeb83kVQ2JkKY8s9g0
         EVvXRSS6SIqCUx2D0R03SMnPbSA9YNIQMEAJwSl28n1RCjGMQ3glX/jdd5AIxVqjHT1f
         viWaOet0TqL5Ahrrpi++8Jmg1e8tUrDdcU5GF1wjOLHB/zFNWS4UCP7GGjD2XDUWe6+k
         4GLvLiFMjeH3QSRP7b4NNKghUJtXDeMbFeDLDQfhSWVHNYw6rKAs6UvrI9KjzEbreC+q
         1qLA0XbE7r/2tk/OydeDFaqmuQbb0UvEkbCwpDt1hhWYpzlgmO3OM2XplS40+ie2i7gH
         I6sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795466139; x=1796070939;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=krTB7RKoikRzD5yyiTQ8FGQ+GcAUNRrGAGBRDsGvivU=;
        b=pGNnq5ZbUCbHMmu4XBYP1eGc8Is0YPdmYx2zFyAdVA1kfhFLfxbCGu9frJTSVX8XuM
         56HyDJlw4/p/tmia9x47ZX9z5Uy+PXZ+wMcadiGlqNJOZO5tBG02LVSgaQbisFjReoGB
         ff/eUOLcPLdZu4LUl9twxkgzYuGMxK5H17VEU0iE1ok54gtsRhQJPlFyUiUCcDMqFYZd
         2811wOkAHIHEGZZmsBfN8uKdL11CVw1tYGLlqyOMt9Ez3iNDOafkihY1XIzO3+mHV16a
         xdiawqJW281nrxBFVLkJjHGM17LWVHJtb0C0a0ZlTbhPS/vtR98NKrS8vB5obCAzKMgk
         WOZA==
X-Gm-Message-State: APuU4Z+x/3ROVlDuN73jfcUsd67R/fPtkuGpLWbHYzW/x3dJ3wlbQq7P
	Gy/SSMY0vpCZhbMg1ZF9G6D+34R7Loo18MSt/9BXZ8iAeI3R48g7zrLE5MsF6Akptp/lyx9jT9Z
	ud3AJWviqTfvpQLPl4IWR68bm29juIWhlAqS82BC1Jg==
X-Gm-Gg: AZFdTZdE/suk7WplLtNZ6+GgWVjJ5Kq8XT1HgHLih0JpB1A6lSxqfaEtaQNKeB1m7g0
	IpAWzlR4n9Ul0THVRotA3Ty1bNwxANNUrq6uFRVwgsqkl1ec9EuU3sZZpMY93NfLjcwSxMoe2UY
	6igjwZ9CqYRNQHpoKg1Q5DyVyoGI3oizwMecdIQozOvNPCXMIYEPF9+rbSrTlv603ziRYRjaxT1
	ZHrrDZhhk5kHp+/LFbJd+HnxOLhudKymxJH4QULTzkzaCRVlhCoaq94QQWA2X8H6kUocEwjYb+W
	GrCXwrHuNh/T6TNtbMitHR83xliTHLL885PQixiVp4TPohu2wuPPn5CJl+VwBJwjfu+9gtdVtFH
	12lSlF5fPAGYCm/09Y2TY/BRnNfx08oWgjbpoZVVCPNCgtIm3AILK+Z58gq7T+jiBWF3WtB0nIX
	kO0vZZBv+VMQ==
X-Received: by 2002:a05:6820:a78c:20b0:716:bca7:41de with SMTP id
 006d021491bc7-71b395b5dc2mr6723471eaf.87.1795466138983; Mon, 23 Nov 2026
 12:35:38 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261121012402.84848-1-tianyi@cloudflare.com> <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com>
In-Reply-To: <3adef4b4d528780bae31f2fb02d0a08bf9c8ebd5.camel@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 23 Nov 2026 20:35:27 +0000
X-Gm-Features: Aa3M54plANLdGi-6T1QT2FegAb5y7dpeYS4xxUrv2cDoobb2gOCJGSKfYwT1pMM
Message-ID: <CAG4wq-f18SHytDb39SdJYzRPk-dzECjH_HCSiMGAQ721Zmfomg@mail.gmail.com>
Subject: Re: [PATCH net] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Alexander H Duyck <alexander.duyck@gmail.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, bpf@vger.kernel.org, kernel-team@cloudflare.com, 
	tianyi.gao@linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 2026-11-23 at 10:49 -0800, Alexander H Duyck wrote:
> I'm not sure this is the best fix for this. If we are needing all NICs
> that support CHECKSUM_COMPLETE *and* XDP to report CHECKSUM_NONE in the
> event of a frame being modified by XDP it really feels like we should
> probably look at moving this further up the stack.

Thanks for the review, Alex.

IMHO we should first make sure XDP programs do not cause "hw csum
failure" in current kernels. Whatever an XDP program does, it should
not be able to trigger a hw csum failure. It's not an uncommon use
case, e.g., Katran from Meta [3] and Cloudflare's load balancer. And
existing selftests already do it (test_xdp_native_adjst_head_* and
test_xdp_native_adjst_tail_* in
tools/testing/selftests/drivers/net/xdp.py).

> Also even if we go the multiple driver fix route I wonder if we
> shouldn't look at adding a new XDP return type to indicate that we are
> passing a modified frame

IMHO that is for net-next. There we can add optimizations, such as a
way to keep CHECKSUM_COMPLETE for programs that do not change the
frame, potentially after [1] or [2] is accepted.


[3] https://github.com/facebookincubator/katran/blob/13a0d69221e43b4941b81303e6726ddc61a12169/katran/lib/bpf/pckt_encap.h#L137
