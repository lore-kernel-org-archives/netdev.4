Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681955;
	b=c2YSOqYou/fuKt6kv27Z+yt9tUpASvNSA1JBCQ7Yo4MLk/041PZ/oYtLQF4NI6tRC8SN
	 CaEmgvfZxcvQDCa+HHEcyBVBhZjR1CTIrb399uqfO88rKNS+qLY8BFQZ9hRtj8BrCbHcO
	 4yactuQH6PaCCqrdHosW4+boCXp5LE6esMNM/uoO5+cMz2oz1wGaW/c1dI26sC8fC8MnF
	 fS1AjqZKPsR8hjVcTCStso9aZ3HWLVtctoJT4QmrhFa1T30gmmS+PMaFM25AGsHInOWo0
	 yXTpXbdNltQK2Li7k1zMgzdf6wrZqyXfOV8Wt0J/wYQirE7XGVcXQf8L23TvdUp+xCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
	b=k/yKVOIHx+L/6iwAdHj1MPrYcfCVL+k0UNw9fRuUhy8DumzdAgcgMRjfFes5UCFntrLN
	 7lSPpagXKmutrmXqfjtKU4OhsqadjYgaPhVKm8q6ByyO2GsCKyb5oUuUK9Oq/5nuWMisl
	 nRpRBPXpVaJOY2L/c2Sdu9cfrA6nQpFR4Sk2z4hEROgGjclelOdnLiV4ZPXfOIT5fAJr2
	 cJFWRV8ID36WoYTTRdGTUFp9ObR4aIu+eanW/cxpHU2U1v9mTIT2v5IZ5hpe3wfAEy4B+
	 xbNne8aJ0wj/NBv3uaWi6KISoofl0yMnGIrfvoDG/tRYtJDu9RGebgwIBzxJcuP1Z6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B800A606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B800A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JUeDpqG+
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f1e5d7450so295484785a.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681954; x=1795286754; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=JUeDpqG++mf++7m4owPYQY97vDM1BdXIWpPWR9xMWUZo/jdQTQsMwApPcqakMIy9T4
         bxBTvAMMz8cKj90Y6hp8UVgQ08iHpVMTDGMkUDTTZhVtpCSlyDuLv23ZnhonAuYDQgX8
         oKPmJkcSN/LwL2vss6NxVKCVeiDgu6Jb9i1asyhayqdGhm3Z2qCoxUSeMlF0vthK2ck5
         xAz0/N+HElRMTaHFWZq2OAQvjEq5u87HjKalMvOkcw0cuyITO7+1Q1tMelM41VswOSma
         eUXZCNlTSp9PzhYqOD42jYE7WEurOcBwmyk9tMnP0YI2OkSYeC7Oqkb+p2tb0NKGtJCS
         ZZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681954; x=1795286754;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mhjMuwlcmmA6xmnk85ku3gy5AP9/nFkfmboSqD/BPaw=;
        b=BzXg4au/1XEVhZJ8SolM3VpOaxhbqIg5htEsmDTpK7t5oPxyQ92QQlsMO9y9dftE0N
         YwmhKUTdXnrlyfV/8K92dCbEOhWsOdVycLbSqmRBFjgXdwDnDFAZX06aSKedL0DrAtsm
         nj9wjRIdL5WR1G4BxOkA9IcAFx1+iKs2Yj071XFaNYaov3ebK8tneo+t2JOOma/3Vaae
         sh8qu3EhqvI+6IGYS6zTBjT5I3VHhkgUOs3sFly9Ff4gy6GfDnAqjIeG9P5CcuOVKKMn
         8TlPy4MGe8bPJSFj6BRgNdqTrcpmk2SDtjLqDLQRv+cbYQDhazL9V7lDBQ69UBDuIGKD
         CUWw==
X-Forwarded-Encrypted: i=1; AL+hErFjwLPAe60J3PrGK7F+dGpi2GtrkoOhrDBRJAQbCUVP1NWAENYM+AETjLHXX8LnlAquLeTgNvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OzEjkgMD9vxAB02cqrQYmYmaHj6Q3sgP+4CsLcHxi+a7JPibw
	pT94ao36Vl9MqVs+2aKOfmzBre10UOjOkdJsQbE7yBJIWKA9fZZnmYJUslgtDA==
X-Gm-Gg: AYBFou0KXQ/tpQ0VNHJxJa6iEdb9KdxbG99LGqdDdvlFkwJSEi8TXbCCQl06m9Z1QYx
	iAVEVCYVrGb1RFu6iOUKa2L9kGezw8pP57AvZfW6j5KAl63LsGmFZ+8SnifzH0asFDE66ASnva0
	w5M63FVjE4lKFGK52vm+bTs/krFoju7naC5SRFjFaJqzo+tdmPiLCutWy6Zd3jcrqifxRoJx8zs
	niHPBxvSBu4bOmW/Ofpk2rJ2iKjeDqwYUDKm1LC7026jcUU+llpGfEnZBm4jn3g78oG3DzuxVmQ
	LyV1gLzTN8g3Skv8OcUsLgUpyAutr6SbnpErhx30oJ5GtwWiJ7uEBUVENJZRwnjHV7PZzzcSzTC
	KhnD8xcM3N8l7TM70Uno4a7r9pVQcbP/oreJ3vLmQh6N5PPmcWwtO2mjNHNZVUYxUfznaK7vXqX
	LCgdqpANAhwtLyRsR3CO8IfpnkY6vrS5Zw0wDs2GtTqmtIwsdQ/GE13xFiNBlczCiT2QjIDOB+N
	Qg9tQaXk8EtUVjo4VcKFRPHQMo1Y9OTFDg+IGcNDjy07u3KsHSb7C6ZjoiDtTfX6/1ASX9BmDg9
	nUW33TrgZ7gD1ggbd+nZ1+zn5cxI1cPAk7594KOB74mVKCrBgu4zewzls/Ms7JjNkEDPp9R22u9
	4Eet3sGUwSbgT+CsPFqUaBn+CstcF0M7MUA==
X-Received: by 2002:a05:620a:25c6:b0:93f:1936:b229 with SMTP id af79cd13be357-9494bbfe4ecmr937435085a.77.1794681953514;
        Sat, 14 Nov 2026 10:45:53 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9495a5ef5c4sm338706085a.6.2026.11.14.10.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:45:52 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:45:49 +0000
Message-Id: <DMV5NLOEYFGF.C7ITHCRCNA7P@gmail.com>
To: "Michal Luczaj" <mhal@rbox.co>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar
 Kartikeya Dwivedi" <memxor@gmail.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>, "Yonghong Song"
 <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Emil
 Tsalapatis" <emil@etsalapatis.com>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Shuah Khan" <shuah@kernel.org>, "John
 Fastabend" <john.fastabend@gmail.com>, "Eric Dumazet"
 <edumazet@kernel.org>, "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo
 Abeni" <pabeni@redhat.com>, "Willem de Bruijn" <willemb@google.com>, "Jakub
 Sitnicki" <jakub@cloudflare.com>, "Jiayuan Chen" <jiayuan.chen@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Stanislav Fomichev" <sdf@fomichev.me>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, "Sashiko" <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf-next v3 0/8] bpf, sockmap: Restrict iter-context
 sockmap updates to sockmap iterators
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>

On Sat Nov 7, 2026 at 5:58 PM UTC, Michal Luczaj wrote:
> Follow-up to Sashiko's report [1] and the decision to restrict which
> iterator may perform sockmap updates [2]. Series started short: remove
> about-to-be-stale test, restrict updates, add a negative test. Then it
> expanded: mark bpf_iter__sockmap::sk as PTR_TRUSTED, restrict
> bpf_sock_destroy() callers to iter/{tcp,udp}, few little tweaks.
>
> [1]: https://msgid.link/20260626205814.BAC3C1F000E9@smtp.kernel.org
> [2]: https://msgid.link/87echn2fhd.fsf@cloudflare.com
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
> Changes in v3:
> - Drop RFC prefix
> - Update bpf_iter_reg::feature docs
> - Fix tcp_request_sock BTF build error
> - Restrict allowed callers of bpf_sock_destroy() to iter/{tcp,udp} (Alexe=
i)
> - Link to v2: https://patch.msgid.link/20261102-sockmap-update-limit-iter=
-v2-0-e96a63c43b39@rbox.co

Sorry for the delay. Applied.
