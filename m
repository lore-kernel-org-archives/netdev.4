Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459139;
	b=k8Qc8yNKe1LB6eqFnkXVIoXwJmwfCXo7qnPP4JxXaCrCLIv+RHSINk5a/LsDUsopnRLO
	 OhL4IEs63fx7UDM2Xd/t953VWASmFkdKiInCtPoq7TlXPvguT++IuBQZWlvWVYjA95zA2
	 /bfqyUFhAm3t6VmeJHcrtgfeK2ocROwMFwvqlYDXxoj5+YxKuXqSTe9AStJJreevkOH4W
	 cyFFWfnhgFegMS1ZcjZPXWpciFX8k1lDgV/pC55eAL3SlQVUXKD0+h0pwiInwM5axS9yt
	 ijRipug7W64/R5SEsEnswq7OTUYBuB77JlaCTuE4WV79rXtOoh+cRBLDiv4zWXenuwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=BVaIouS2pVUMajQqbfDiziKY6k1WNaUbZHjTPOkkoAI=;
	b=GkBZpJYO7x1wu0W3KFS1sXCJTLE3L9fkJaJKBCP4Yf2TW1qXBYGdxZVlkMQQ4bsEHDxJ
	 XYNl8XdNht3cFZw6Ss2CArVJYe2rWV6AP6Bvdsjs1Xqg/ESicIQdAYhNLR4djlvi/dsk+
	 dS6/WyxvUsnlSHDFztfF6brfR8hG/wwNIBii+FLDt8O1mS9tFqI9yoViK9Mz8a+NAAwMo
	 b4T2YwhgPC/gAwEZGMWWWwubIn/ZHy0DR9JOWmWjTfnauFNuIj79r0RLkRrXmLk8QrmHs
	 KyRtx7qj70qMjAFnmVDZqyDpotUii0fxGho0AL+AaLL3JhlDKsCf0HA+tyt2H3Jflyw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=odQEP70P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.43
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34104606A31F
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34104606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=odQEP70P
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9912c47367cso2397502241.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:38:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459137; cv=none;
        d=google.com; s=arc-20260327;
        b=V8u14G4Ui6n23nXdg9XnflQWuckTePdgWsedkVn/Vl1u46v7YcHSJvP3pN3gA20TjL
         P2J9eMuz1ECvB2eGdA6d6DGQ8jyHANbfDu7LxCeubyWb+W6t+3DZGXYnOyLQz6FnJcpn
         8J8a6OaYBcKKq1QW5vtRItvO4iL/KBQDLe/yEOOk/X2Fya41OzbyW28RoBIAzuKQbgG3
         9vbCW5P0RknIZJ1rpMukZG1W5BtmKmcuZfjcrGCuKycSVFLYHVGUJe45iVXApKUK7OJE
         jKuwXePKD+DFKMPlYDHjtrqRQ6mPC0IVeBZzCRdix+kO/hk7F8jDBa1cgAPt6aIpqWAS
         Qhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVaIouS2pVUMajQqbfDiziKY6k1WNaUbZHjTPOkkoAI=;
        fh=SX0rjOcaEJo8Otrkwj6P8M3dcazI7V+x4K5KN5Mcay8=;
        b=q43rNu5JOZj1TfhSRtivcA6iT/M1+koymBttVU5wx/FjNpZdkTd420Qmp2zeg2idgM
         BcWne8gUY9yVgwcw6vLLcnJsPkWvX3IEI5XLSMPhLOmSiqqQgwrwPoOgjfAfU3+nLDMC
         t3/6kZZn7tGZWEv9ZtrHWtzy0hc59dwRuLzo9PH+CFeaGDTiFPerR2HGpOt2DtSKkN3z
         0IMjMDLkmv2B+Of4vLFhvBeo1POwUniO9tKD6uDYN2fLVzn7ojoiXN5U4jWZmbV9NIbE
         wJOgpqH0d0Yzq8uTTY/izGFw/dQL0b8oJaUCryQR0ckhnQgA4uKgpx+FXu3pju+nneXO
         Ccaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1795459137; x=1796063937; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVaIouS2pVUMajQqbfDiziKY6k1WNaUbZHjTPOkkoAI=;
        b=odQEP70PWFT6c5SCrCZ4mVifAoDK96XoPCuTYfmIwW5qusVGtYSEfdfpwkpIny5fvt
         ueYLKr44uTbOecaTmw5zySux6FvYhiXh9gpbz9b0WglD2iepcHpNI9+7XKAqFtDY0tXR
         yFDt7a15fqydzcsLjTKrC8mk/3nbWsqr0iaLbA6yHduNsZz7X5/J/TaqFklDzLw7WWFO
         ikcis/EndrDpNa+w5aGu5Da+UxAdEsbVJy6cpi5InHemVoCV+RkX5c6N4legH2Po2lM8
         C4MqrJS22IDV/CFvhXk+GT01+S8yrsxwk5NRxYgNPLSnw67ojRa/3OIWDL+i2Qq9qMOj
         E5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459137; x=1796063937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVaIouS2pVUMajQqbfDiziKY6k1WNaUbZHjTPOkkoAI=;
        b=QHbmAtJ34jah4TvWjoUjLEYfufa0X6+FKmPoWOlMsI/Oqvv+7vp5VsLOtimyjocLz5
         aYgv5cqieMVr9BBoc9F7kWAemX3BCxJDfuuVBUwU4ZZ8AzDSP2xTZS6Twn7Cx2RqBvdO
         GGryrbxeqGswT8Q92wxpWbjEtTT+KzfxZQYPZADc1IcxH3/ZWOHjlVPbAtBNfbLHPdej
         3n/iAlUohDYo6j8QTDApqbzyDvfLiApMkSssnFBe7Nj+GMx22WAgZRGISpSB9trQRO4A
         oO7FRERMpMCvlGchETyFhseDft8K6/Kr/tTaa1qdQKU3mGcux60VZqOWMlL1p9AVKcKI
         krvA==
X-Gm-Message-State: APuU4Z/bRPhAIZAJjY1D1ghAwPpOz/T2+tbMg2cS9qAjTQT2zo0R4flm
	HIumQZbM0iRbod7LfqoPfILxR/aJTM38GBAXl6VJ0bBPg0UoqBEJurGYS8JNdx73xbYSs9vMKYk
	RDVZp/rBizD8N1C4WWBeYEqf5oA1R1cilkEhArg0IWg==
X-Gm-Gg: AZFdTZcr4eMTRT0Bjj0vp5K7xXTatA/tbnfLkm2MIpkqR0/u/sccEdnEGdBT0qy6+7T
	po5IgHypieVc21YMDzKsbOM3Wj8a0AwHYcZNkkoUGbIEXnp26erIxn6/wgB60W20YUYHSJypi+a
	x3vDt79R9k96EvXGhm26hme6TfxnnPFfTtyZqkLnLUU9WW4yQET2YA6+4vSPtIMVwQSNVmb3K0b
	kGMKTI3pnQEMF/d43DP0KxUJye/KqFGyuTyeQvXcsAj5icU+FC4VzClREkiImkgvN/dte9cDEIa
	etThJBRvukiBxWnnz06kc1L/HcKfIP6A+okXowQK1rp+rBEVgNAbCQqWvtOaVkJQrkaDi/bevs/
	CyVDnt/qXM4Xz13IJoKIzt9gvwkJkTFS4D6xLMDQ9GVSXIl4eRnBqZy5mjr+0ttvAIQCsd9O+iO
	ZznG5+gAwzm6ocXwFqwkewmDGpKtwo0s5VLt4oUdvxHnsHDRHqo631Bi14tFtpYmTom1U2dvhy5
	VXVUeuq7roMFZ7Ska/v1aoj
X-Received: by 2002:a05:6102:3709:b0:7c2:799c:9018 with SMTP id
 ada2fe7eead31-7d71e3301d9mr3598327137.0.1795459136929; Mon, 23 Nov 2026
 10:38:56 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116183519.3314837-1-rjethwani@purestorage.com> <20261121152324.668463ca@kernel.org>
In-Reply-To: <20261121152324.668463ca@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Mon, 23 Nov 2026 10:38:46 -0800
X-Gm-Features: Aa3M54ocmouk4lzpqzy6nOPF8SzDj5v--NdJJzUSb_41Ik007vkSQqPTkqjXAuw
Message-ID: <CAKaoeS0KjzHPcgmhHZud4=1sUG-J4H_J_==PRTtpNSYnMZ7ipg@mail.gmail.com>
Subject: Re: [PATCH net v5 1/2] tls: fix socket use-after-free during device-down
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	John Fastabend <john.fastabend@gmail.com>, Sabrina Dubroca <sd@queasysnail.net>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alice Mikityanska <alice.kernel@fastmail.im>, Tariq Toukan <tariqt@nvidia.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 21, 2026 at 3:23=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 16 Nov 2026 11:35:17 -0700 Rishikesh Jethwani wrote:
> > tls_device_down() pins each TLS context, then drops tls_device_lock bef=
ore
> > switching ctx->sk's TX validator. The socket destructor can run between
> > these steps: the context survives, but __sk_destruct() frees the socket=
.
>
> Looks like it conflicts with another recent fix. please respin

I=E2=80=99ll resolve the conflict with the recent fix and send an updated p=
atch.

> --
> pw-bot: cr
