Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794862194;
	b=rqONR+jnhr9UOhtKJw+SP/llgR5hYgxwAVscV9hdBf/1RHhcviMlkb6EbqlctqQpfnSm
	 UANaaukXBN/6oXwZucxcpdpcp20i5La495WH4OUwJJhtI9H91cxsyl0ra0hIwJ3Qt84bm
	 /IPIhcD9LWR7IXfb4rMyofeSJ5EqSXgOmyPJIKhHNXEWrgWgWQcxn7W8/n+5UxyflRB9Z
	 6fULD+uM0tSvIeq0zCqmjJwE8yldGBAg+J9/K0tnj6am6CkhOOgb8qU6i86BFqyu09mBT
	 fax/AmG0Qt4E4TERs4hO5FPcCGsIebdsCKlrLdUmcDz8gA4BJLLrpxmtABipSaJ/fbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
	b=zE5MrSKxbWjAeDPxVihy6PFsMBhyzMSxN1UrQwn1tUvOENuieNfE6VCiOvtgqs5tdBHa
	 6o46bixsKzeKiNCqW/Cqy3JX+xsNgVh68nORbFFZ4fL/ohbAIvAVoz33mloE5tFYXJfFF
	 JE2Td6WEyoc9hV/3Su5DyV2EqFQh493rhEVRBnYUsITytuZdehiHa3DPxKHX9UHfKlm2y
	 YxAaVL/5L92q9FDBmXwm/AQ/mmRrR2UPcv0UsBTHzsTJa28dyRmu381k/+yU9AvJ3YoOO
	 I1LCBxEyPsHs5thWwdfewIqK78DEbf8VNcdH4NG86PqJYi5hPcNlc2W/nPxW83PWykA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bEjcuIiK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1D8606A332
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1D8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bEjcuIiK
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-194d0c31715so1715c88.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 12:49:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794862193; cv=none;
        d=google.com; s=arc-20260327;
        b=RRnjiY9F/K8uQMHSdLHf2aGDP1VchuAvXMgJ+VYuZ56ql94BL6XmtKqobahcdfOept
         JJuAm9LXyike9uZTZ9Qg8YvkLZLQoMBKmSB0q3GtBVUXWuDWuom0QQX2K9uozxTVvcdb
         LQGQloxXwyndYKj/m4TVSNUndZSbV1v4bVo7aHkSQUgKqD6rMBXSYBXmHpm2D25DuJUm
         SXw0w3Aiv91daLIbb78chcOtiQN2pZA4aD5TSX6G+aYYpVnt5PpJ8RpdrWpL4bz65YCf
         3I4Shn+ZZaeT7J+vajAxm04Tabq8i18BoiAZpGg/20YPxTWFlV8jOf7pw0nuui/w3b6E
         bIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        fh=Xhz4w6A1C12gxBsXnogkYQqMMjH9ATsgHxuNAZAMFCU=;
        b=dU1YtvSnNkHzVYpW4HNJezF9LvVe+N+pJ4dAYQjVrx8CUhVI5S07cZ38RlwNOug+UD
         dO0BSjAVhI6YuahlCwU11Y1Srg5orBGDzDWr/Ns8zKdbCMpnaax11tm03rH35j0xpG/o
         KweNMeDtmPY3mXh8ka3UPbaGzB+JPJ4XTFXMjKUzPIW2oRM1aN9qGPSpm50Jm9gzMPEd
         1J7TgmhBIXJJdhWUhqty1CB/0EsUM01BMH9h9vIaZZQRhVQm1dXgL5yo4+fR+KoDj1I/
         GiBEbRK+/6gwBiysDFDvJDDJtbF93Wt9+vCVk4fhcibZOAmSCb4p27O0ffZ2Ha2FvQiK
         nYWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794862193; x=1795466993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        b=bEjcuIiK5ZzslMfTPogaDUFoWAzfW7XSIlgeWB+jQEocpZXi0A2/2ry9JGDzqWrV2C
         Otl+PiA4C4mRc5hokEx9Ps7c5fSKx2ScfDXDfJU1gjF0gzJU8OkE+ssimQcRSnQ0Sa7B
         rd1+f9yQyPhR38YklodVcnYCELRqxyttWQ9nWrVS8Dvdu4Q2MviS0naNBlb+7xI436I7
         xm1bwwLggvurvqBhTifKsHdDDU4yLf5vA1/oL8JC/MkxU/SfE4mkt1ycfr1BmU1aRz49
         mFSFZXKzWkq9N6y3IBU1i7veM3ukdlbhIzawVB38Qmm9r6Bkff1vIaeWBxXEXiYP56S5
         o/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862193; x=1795466993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbo2KladFLx7VgxkgYTRkAN9eonT9/CDW2PBbI8A2GY=;
        b=R2zZ61REcgUKNzqevUVGY2dKuunntO70EjzxChwmOb5nWjN0U+8QY3J/pm7H8p1nrL
         U4fLMeQanVB76fc2e9DQ9fsBo9GVRLAcx4ywZaLyae0is9r6LG9KMqHlJChFqrEdoczo
         eR/WJMb3Z1GaZCET/lyOS2fX9h+BCrHwjpwIHGGbldBdX4emIFSFR3LtjefJ/v0kHWDU
         JOObey/aC68pt0L/+uqw7EvNuULFEhu67vfv8cDa7h2pwoshBjVqz7p432ZwVmaFBwwv
         4leD7XyTcme8ZNQbjYtFfOYwWqcoNBWKXcn8aPn1sLeV+BPVIjzfhG+04Pb44RAaoovA
         USew==
X-Gm-Message-State: APuU4Z+Ir9Wjk9vlqLqmioMyTUrIV6B7tsatkw6e282yjq1MQyx/Fv3t
	qF/RKOQzMDT8qLxSQApffta2vtFIfBME99JgXTyRWHkuxH2+W2Ht9E/60aSaSEocfnm3YdDcl/k
	VTG6rT0QOSjIzh6YDj6wVTCtda0yheQgSY7zbtM5c
X-Gm-Gg: AYBFou3LlaXhkseWfcPiBT3aZweoKB3r+c4EccBycdtzFeIotX/EMD5LyxfVFdkW+Z1
	CoyVZpYHmy7QceKq6FK3/VHAojinFRWjIBzofKEXpw4H4G7AwTX2NGZkEQtsRmV9fRFMT6mVq+w
	j/EKRsimFQVZhDtz7v2U3A/kQ+XsJJAygfZeQJ4e3bBOf8ZbmYpOmKsAYA/tXwjbnwOYAQUzb5+
	ShYZROK9Pfd3FBhxgYQxjl1Szc5vHG/3FDQ8SsD+Kf3TMRFMS9F6YR4HAG8Doyr7BBv/FkwBhr4
	e+NIMGYvUgk32FNcB/SWkR++2mtPefibqf9lheGPM5eosQJn1iYni1W9enre6yd8oytvdnbZgD4
	iqS5ovhVNvokvDtb8PbP2Nq2vmfueMjoXWel6Zu6bzxT/5ziVUam2DLcC
X-Received: by 2002:a05:701b:4184:20b0:133:12e0:aab7 with SMTP id
 a92af1059eb24-1b53b1c311emr17544c88.11.1794862191699; Mon, 16 Nov 2026
 12:49:51 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115022607.348112-1-almasrymina@google.com> <179477333507.3291.8047663595939414550@kernel.org>
In-Reply-To: <179477333507.3291.8047663595939414550@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 12:49:36 -0800
X-Gm-Features: AclHuK-aQ9C1I6-uUlKXpnPxjBY0WWDeyp9bVBRmMdCUZbStYerQX917Ww7ppsE
Message-ID: <CAHS8izPmV_Ap-L8rykyMpc2acTrhGuU0tT-8bCMUE4e3vQNiBw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/6] net: devmem: support leased RX and TX
 queues on netdev unregister
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Weiming Shi <bestswngs@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 12:08=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

Ugh, I think I dropped this description somehow. These are follow up
fixes to my earlier series that fixed the device getting revoked for
non-leased devices, where criticality high issues were called out for
leased devices. Not hit in production. It's sashiko code review issues
that are correct from reviewing the code. Not reproduced on real
hardware.

--=20
Thanks,
Mina
