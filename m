Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795215791;
	b=iLHVc8I23bLWypCicvtMLjxoUhXgn3xFAg3ltuOh8HTDPI5D5KqhInLMN5XVT7vOa5Qy
	 R1R13Vt8HbUpVEaTblNd5yqvI6FLdKc3UCcFCsmRSdjdCbGM3CbFbvGh6MIzOJm+VRTZA
	 EedOGoctifmanlAZBVatG2xGjWLZyoIPns08p8TlyUxlOlpc49tqu3x5Qnsnwjj4OMuyr
	 9F4AJMpwXRLGq9J71r/qbwVNqF2OID7pGaJwJfs9OfG5FpievPx2gfQ4Nyxz1yKvWQSqJ
	 xXru8KTIJtAQLEjOkekdRJMScjBWt7TW/0EeVNzAQZRkojwilmUwQ2dSpclNsw77EDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795215791;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	b=4cO5G/ZpS+HoFvN41N95+00RTVTNItKpCZA5RHFCh0uiEyrlovoYH19auAmVOrErV639
	 627b/qKNhnxwMWmuCs28UgCgRjKzGZVV8K28PJCmHmM/1ZERWpYNmP9+qNEvDrG11nDwp
	 eiKP/w6K1CILEDcFqqOOHiLdW+HLP4LDRZGW1mnElU2997r1fmzAmFgctobtgQhiYK17Z
	 dB0nHVaoh3iENTM17JrLoRL5KVWNpKPswKttRxJKS5Y4qmvj58dN6sgRU3q6pADYarBXE
	 hwrp6nQKJ4ELW1Pmz3DIDP7abj2PExiwl4meXlApOnzka1qcVDvlJLEWC6+BqgGCdSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GX5Zy9Vj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE66606A68C;
	Fri, 20 Nov 2026 23:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GX5Zy9Vj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0441F000D0;
	Fri, 20 Nov 2026 23:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795215790;
	bh=Ps3dmenyy5Kz+Ld8FFyPnRbKN1BblcpmGxOsdgzLlkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GX5Zy9VjhDMTgbskyGu3RdUwyR3ky6kSZzd+yVtfbsVqtvfGu/Fc9cXs9ZWAqCMZo
	 c++KByM6eaa6jgULqlCyeocGvHXBzc70CzUMmKvIifDjcOgkwLfHnYY/KLZlAYm9Nt
	 5sMvqxDFKMp/+U47sACGkUVjZACZvxeD6ECBXk/kawSaXNwYA+TTRWMym7PASYQpKi
	 OF2BifWpl1HCBJWrUWIHuWCh8bVP/2beMFCnng7TvwU0YYRASgJgDJ99CiyieVbcHb
	 OprT+SXiPquzAwAFVEMZ0CzrHxwSzFFtWeA07nd4p1Fx644ry70vAc366sLxuga/ia
	 +PL3YDDPuqOQA==
From: netdev-bot+sinfo@kernel.org
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Eddy Tsalolikhin <eddsterxyz@gmail.com>,
 Kyle Zeng <kylebot@openai.com>, John Fastabend <john.fastabend@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Sabrina Dubroca <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v1] tls: fix ring wrap in sk_msg_memcopy_from_iter()
 after splice
Date: Fri, 20 Nov 2026 23:03:09 +0000
Message-ID: <179521578972.3294.3326307136812645533@kernel.org>
In-Reply-To: <20261120225720.89044-1-jiayuan.chen@linux.dev>
References: <20261120225720.89044-1-jiayuan.chen@linux.dev>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
